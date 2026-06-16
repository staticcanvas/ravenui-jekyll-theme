# RavenUI CLI - Dev Server & Hotreload Wrapper

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvDev {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    # 1. Port Collision Detection & Auto-Resolution
    $port = 4000
    Write-RvLog -Level "act" -Message "Validating port availability..." -Context "port-check"
    if (-not (Test-RvPort $port)) {
        Write-RvLog -Level "wrn" -Message "Port $port is currently in use. Seeking free port..." -Context "port-check"
        $port = Find-RvFreePort -StartPort 4001
        Write-RvLog -Level "suc" -Message "Found available port: $port" -Context "port-check"
    } else {
        Write-RvLog -Level "suc" -Message "Port $port is clear." -Context "port-check"
    }

    # 2. Build Arguments
    $jekyllArgs = [System.Collections.Generic.List[string]]::new()
    $jekyllArgs.Add("exec")
    $jekyllArgs.Add("jekyll")
    $jekyllArgs.Add("serve")
    $jekyllArgs.Add("--port")
    $jekyllArgs.Add([string]$port)

    # Support incremental builds
    $isIncremental = $false
    foreach ($arg in $Args) {
        if ($arg -eq "-I" -or $arg -eq "--incremental") {
            $isIncremental = $true
        }
    }
    if ($isIncremental) {
        $jekyllArgs.Add("--incremental")
        Write-RvLog -Level "inf" -Message "Incremental build enabled (-I)" -Context "dev"
    }

    $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
    Write-RvLog -Level "act" -Message "Launching Jekyll server on http://localhost:$port..." -Context "dev"

    $lastWrite = [System.IO.File]::GetLastWriteTime($configPath)
    $process = $null

    try {
        $process = Start-JekyllProcess -JekyllArgs $jekyllArgs -WorkspaceRoot $WorkspaceRoot
        Write-RvLog -Level "suc" -Message "Server online (PID: $($process.Id)). Press Ctrl+C to terminate." -Context "dev"

        # Hot-reload monitoring loop
        while ($true) {
            Start-Sleep -Seconds 2

            if ($process.HasExited) {
                Write-RvLog -Level "fail" -Message "Jekyll process terminated unexpectedly." -Context "dev"
                break
            }

            if ([System.IO.File]::Exists($configPath)) {
                $currentWrite = [System.IO.File]::GetLastWriteTime($configPath)
                if ($currentWrite -gt $lastWrite) {
                    Write-RvLog -Level "wrn" -Message "Configuration change in _config.yml. Reloading server..." -Context "hotreload"

                    # ── Stop Jekyll ────────────────────────────────────────────
                    Stop-JekyllProcess -Process $process

                    # ── Serve placeholder during restart gap ──────────────────
                    $placeholder = Start-RvPlaceholderServer -Port $port -WorkspaceRoot $WorkspaceRoot
                    Write-RvLog -Level "inf" -Message "Placeholder page active at http://localhost:$port (auto-refreshing)" -Context "hotreload"

                    # Re-initialize theme settings in case colors changed
                    Initialize-RvTheme -WorkspaceRoot $WorkspaceRoot

                    # ── Restart Jekyll ─────────────────────────────────────────
                    # Stop placeholder before Jekyll reclaims the port
                    Stop-RvPlaceholderServer -Listener $placeholder
                    Write-RvLog -Level "inf" -Message "Placeholder server stopped. Starting Jekyll..." -Context "hotreload"

                    $process = Start-JekyllProcess -JekyllArgs $jekyllArgs -WorkspaceRoot $WorkspaceRoot
                    $lastWrite = $currentWrite
                    Write-RvLog -Level "suc" -Message "Jekyll server restarted (PID: $($process.Id))" -Context "hotreload"
                }
            }
        }
    }
    catch {
        # Catch cancellation or exit signal
        Write-RvLog -Level "act" -Message "Halting dev server..." -Context "dev"
    }
    finally {
        if ($process -and -not $process.HasExited) {
            Write-RvLog -Level "act" -Message "Shutting down Jekyll subprocess tree..." -Context "dev"
            Stop-JekyllProcess -Process $process
        }
        Write-RvLog -Level "suc" -Message "Development server stopped." -Context "dev"
    }
}

# ─────────────────────────────────────────────────────────────────────────────
# Placeholder HTTP server — serves loading.html during config restart gaps
# ─────────────────────────────────────────────────────────────────────────────

function Start-RvPlaceholderServer {
    param(
        [int]$Port,
        [string]$WorkspaceRoot
    )

    # Resolve the loading page from the rvcli assets directory
    $scriptDir     = [System.IO.Path]::GetDirectoryName($PSCommandPath)
    $assetsDir     = [System.IO.Path]::Combine($scriptDir, '..', 'assets')
    $loadingPage   = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($assetsDir, 'loading.html'))
    $loadingHtml   = if ([System.IO.File]::Exists($loadingPage)) {
        [System.IO.File]::ReadAllText($loadingPage, [System.Text.Encoding]::UTF8)
    } else {
        '<html><body style="background:#050505;color:#00ff9d;font-family:monospace;display:flex;align-items:center;justify-content:center;height:100vh;margin:0;"><h2>Restarting server...</h2></body></html>'
    }

    $listener = [System.Net.HttpListener]::new()
    $listener.Prefixes.Add("http://localhost:$Port/")
    try {
        $listener.Start()
    } catch {
        # Port still in use — wait briefly then retry once
        Start-Sleep -Milliseconds 500
        try { $listener.Start() } catch { return $null }
    }

    # Serve requests on a background thread
    $htmlBytes = [System.Text.Encoding]::UTF8.GetBytes($loadingHtml)
    $listenerRef = $listener
    $null = [System.Threading.ThreadPool]::QueueUserWorkItem({
        while ($listenerRef.IsListening) {
            try {
                $ctx = $listenerRef.GetContext()
                $ctx.Response.ContentType     = 'text/html; charset=utf-8'
                $ctx.Response.ContentLength64 = $htmlBytes.Length
                $ctx.Response.OutputStream.Write($htmlBytes, 0, $htmlBytes.Length)
                $ctx.Response.OutputStream.Close()
            } catch {
                # Listener was stopped — exit thread loop silently
                break
            }
        }
    })

    return $listener
}

function Stop-RvPlaceholderServer {
    param($Listener)
    if ($Listener -and $Listener.IsListening) {
        try { $Listener.Stop() } catch {}
        try { $Listener.Close() } catch {}
    }
}

# ─────────────────────────────────────────────────────────────────────────────
# Jekyll process management
# ─────────────────────────────────────────────────────────────────────────────

function Start-JekyllProcess {
    param(
        [System.Collections.Generic.List[string]]$JekyllArgs,
        [string]$WorkspaceRoot
    )
    $psi = [System.Diagnostics.ProcessStartInfo]::new()
    $psi.FileName = "bundle"
    foreach ($arg in $JekyllArgs) {
        $psi.ArgumentList.Add($arg)
    }
    $psi.WorkingDirectory = $WorkspaceRoot
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $false
    $psi.RedirectStandardError = $false

    $proc = [System.Diagnostics.Process]::new()
    $proc.StartInfo = $psi
    $proc.Start() | Out-Null
    return $proc
}

function Stop-JekyllProcess {
    param(
        $Process
    )
    if ($Process -and -not $Process.HasExited) {
        try {
            # Recurse process kill for parent + children
            $Process.Kill($true)
            $Process.WaitForExit(3000)
        } catch {
            try {
                $Process.Kill()
            } catch {}
        }
    }
}
