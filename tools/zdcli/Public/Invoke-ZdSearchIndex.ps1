# Zero-Dark CLI - Search Index Compiler

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-ZdSearchIndex {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    Write-ZdLog -Level "act" -Message "Building Jekyll site files..." -Context "search-index"

    # 1. Build Jekyll site static output
    $psiBuild = [System.Diagnostics.ProcessStartInfo]::new()
    $psiBuild.FileName = "bundle"
    $psiBuild.ArgumentList.Add("exec")
    $psiBuild.ArgumentList.Add("jekyll")
    $psiBuild.ArgumentList.Add("build")
    $psiBuild.WorkingDirectory = $WorkspaceRoot
    $psiBuild.UseShellExecute = $false

    $procBuild = [System.Diagnostics.Process]::new()
    $procBuild.StartInfo = $psiBuild
    $procBuild.Start() | Out-Null
    $procBuild.WaitForExit(60000)

    if ($procBuild.ExitCode -ne 0) {
        Write-ZdLog -Level "fail" -Message "Jekyll build failed with exit code $($procBuild.ExitCode). Aborting index compile." -Context "search-index"
        return
    }

    # 2. Run Pagefind indexing binary via npx
    Write-ZdLog -Level "act" -Message "Compiling search index chunks using Pagefind..." -Context "search-index"
    
    $sitePath = [System.IO.Path]::Combine($WorkspaceRoot, "_site")
    $psiPagefind = [System.Diagnostics.ProcessStartInfo]::new()
    $psiPagefind.FileName = "npx"
    $psiPagefind.ArgumentList.Add("pagefind")
    $psiPagefind.ArgumentList.Add("--site")
    $psiPagefind.ArgumentList.Add($sitePath)
    $psiPagefind.UseShellExecute = $false

    $procPagefind = [System.Diagnostics.Process]::new()
    $procPagefind.StartInfo = $psiPagefind
    $procPagefind.Start() | Out-Null
    $procPagefind.WaitForExit(30000)

    if ($procPagefind.ExitCode -eq 0) {
        Write-ZdLog -Level "suc" -Message "Pagefind search indexes built successfully!" -Context "search-index"
    } else {
        Write-ZdLog -Level "fail" -Message "Pagefind failed with exit code $($procPagefind.ExitCode)." -Context "search-index"
    }
}
