# Zero-Dark CLI - Dev Server & Hotreload Wrapper

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-ZdDev {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    # 1. Port Collision Detection & Auto-Resolution
    $port = 4000
    Write-ZdLog -Level "act" -Message "Validating port availability..." -Context "port-check"
    if (-not (Test-ZdPort $port)) {
        Write-ZdLog -Level "wrn" -Message "Port $port is currently in use. Seeking free port..." -Context "port-check"
        $port = Find-ZdFreePort -StartPort 4001
        Write-ZdLog -Level "suc" -Message "Found available port: $port" -Context "port-check"
    } else {
        Write-ZdLog -Level "suc" -Message "Port $port is clear." -Context "port-check"
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
        Write-ZdLog -Level "inf" -Message "Incremental build enabled (-I)" -Context "dev"
    }

    $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
    Write-ZdLog -Level "act" -Message "Launching Jekyll server on http://localhost:$port..." -Context "dev"

    $lastWrite = [System.IO.File]::GetLastWriteTime($configPath)
    $process = $null

    try {
        $process = Start-JekyllProcess -JekyllArgs $jekyllArgs -WorkspaceRoot $WorkspaceRoot
        Write-ZdLog -Level "suc" -Message "Server online (PID: $($process.Id)). Press Ctrl+C to terminate." -Context "dev"

        # Hot-reload monitoring loop
        while ($true) {
            Start-Sleep -Seconds 2

            if ($process.HasExited) {
                Write-ZdLog -Level "fail" -Message "Jekyll process terminated unexpectedly." -Context "dev"
                break
            }

            if ([System.IO.File]::Exists($configPath)) {
                $currentWrite = [System.IO.File]::GetLastWriteTime($configPath)
                if ($currentWrite -gt $lastWrite) {
                    Write-ZdLog -Level "wrn" -Message "Configuration change in _config.yml. Reloading server..." -Context "hotreload"
                    Stop-JekyllProcess -Process $process
                    
                    # Re-initialize theme settings in case colors changed
                    Initialize-ZdTheme -WorkspaceRoot $WorkspaceRoot
                    
                    $process = Start-JekyllProcess -JekyllArgs $jekyllArgs -WorkspaceRoot $WorkspaceRoot
                    $lastWrite = $currentWrite
                    Write-ZdLog -Level "suc" -Message "Jekyll server restarted (PID: $($process.Id))" -Context "hotreload"
                }
            }
        }
    }
    catch {
        # Catch cancellation or exit signal
        Write-ZdLog -Level "act" -Message "Halting dev server..." -Context "dev"
    }
    finally {
        if ($process -and -not $process.HasExited) {
            Write-ZdLog -Level "act" -Message "Shutting down Jekyll subprocess tree..." -Context "dev"
            Stop-JekyllProcess -Process $process
        }
        Write-ZdLog -Level "suc" -Message "Development server stopped." -Context "dev"
    }
}

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
