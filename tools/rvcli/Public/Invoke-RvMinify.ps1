# RavenUI CLI - Asset Minifier Command
# Wraps tools/minify.ps1 as a first-class rvcli command.
# [Compliance: file-per-cmdlet | Palette Object | UI Object]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvMinify {
    [CmdletBinding()]
    param(
        [string[]]$Args          = @(),
        [string]$WorkspaceRoot   = "."
    )

    Write-RvLog -Level "act" -Message "Starting asset minification..." -Context "minify"

    # ── Parse Args ──────────────────────────────────────────
    $targetDir = $null
    $dryRun    = $false
    $quiet     = $false
    $noHTML    = $false
    $noCSS     = $false
    $noJS      = $false
    $skip      = [System.Collections.Generic.List[string]]::new()

    for ($i = 0; $i -lt $Args.Count; $i++) {
        $a = $Args[$i]
        switch -Exact ($a) {
            "--dry-run"  { $dryRun = $true  }
            "-n"         { $dryRun = $true  }
            "--quiet"    { $quiet  = $true  }
            "-q"         { $quiet  = $true  }
            "--no-html"  { $noHTML = $true  }
            "--no-css"   { $noCSS  = $true  }
            "--no-js"    { $noJS   = $true  }
            "--skip" {
                $i++
                if ($i -lt $Args.Count) { $skip.Add($Args[$i]) }
            }
            default {
                if (-not $a.StartsWith("-")) { $targetDir = $a }
            }
        }
    }

    # Default target: look for 'public' (CI deploy dir) then '_site'
    if (-not $targetDir) {
        $publicPath = [System.IO.Path]::Combine($WorkspaceRoot, "public")
        $sitePath   = [System.IO.Path]::Combine($WorkspaceRoot, "_site")
        if ([System.IO.Directory]::Exists($publicPath))    { $targetDir = $publicPath }
        elseif ([System.IO.Directory]::Exists($sitePath))  { $targetDir = $sitePath }
        else {
            Write-RvLog -Level "fail" -Message "No compiled site directory found. Build first with 'rvcli dev' or 'bundle exec jekyll build'." -Context "minify"
            return
        }
    } else {
        $targetDir = [System.IO.Path]::Combine($WorkspaceRoot, $targetDir)
    }

    if (-not [System.IO.Directory]::Exists($targetDir)) {
        Write-RvLog -Level "fail" -Message "Target directory does not exist: $targetDir" -Context "minify"
        return
    }

    # ── Locate minify.ps1 ───────────────────────────────────
    $minifyScript = [System.IO.Path]::Combine($WorkspaceRoot, "tools", "minify.ps1")
    if (-not [System.IO.File]::Exists($minifyScript)) {
        Write-RvLog -Level "fail" -Message "Minifier script not found at: $minifyScript" -Context "minify"
        return
    }

    # ── Build splatted argument list ────────────────────────
    $psArgs = [System.Collections.Generic.List[string]]::new()
    $psArgs.Add("-TargetDir"); $psArgs.Add($targetDir)
    if ($dryRun) { $psArgs.Add("-DryRun") }
    if ($quiet)  { $psArgs.Add("-Quiet")  }
    if ($noHTML) { $psArgs.Add("-NoHTML") }
    if ($noCSS)  { $psArgs.Add("-NoCSS")  }
    if ($noJS)   { $psArgs.Add("-NoJS")   }
    if ($skip.Count -gt 0) {
        $psArgs.Add("-Skip")
        $psArgs.Add(($skip -join ","))
    }

    # ── Execute ─────────────────────────────────────────────
    & pwsh -NoProfile -NonInteractive -File $minifyScript @psArgs

    if ($LASTEXITCODE -ne 0) {
        Write-RvLog -Level "fail" -Message "Minification completed with errors (exit $LASTEXITCODE)." -Context "minify"
    } else {
        Write-RvLog -Level "suc" -Message "Minification complete." -Context "minify"
    }
}
