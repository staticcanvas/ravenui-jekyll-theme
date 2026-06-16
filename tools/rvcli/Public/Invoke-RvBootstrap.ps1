# RavenUI CLI - Project Bootstrapper

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvBootstrap {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    $targetDir = "."
    if ($Args.Count -gt 0) {
        $targetDir = $Args[0]
    }

    $targetFullPath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine([System.IO.Directory]::GetCurrentDirectory(), $targetDir))
    Write-RvLog -Level "act" -Message "Initializing new RavenUI project in '$targetFullPath'..." -Context "bootstrap"

    # Create target directory if it doesn't exist
    if (-not [System.IO.Directory]::Exists($targetFullPath)) {
        [System.IO.Directory]::CreateDirectory($targetFullPath) | Out-Null
    }

    # Check if target directory is empty
    $files = [System.IO.Directory]::GetFileSystemEntries($targetFullPath)
    if ($files.Count -gt 0) {
        Write-RvLog -Level "wrn" -Message "Target directory is not empty. Proceeding may overwrite files." -Context "bootstrap"
    }

    $repoUrl = "https://github.com/staticcanvas/ravenui-starter.git"
    $gitSuccess = $false

    # Try Git Clone first
    try {
        Write-RvLog -Level "act" -Message "Attempting to clone starter template from $repoUrl..." -Context "bootstrap"
        
        $psi = [System.Diagnostics.ProcessStartInfo]::new()
        $psi.FileName = "git"
        $psi.ArgumentList.Add("clone")
        $psi.ArgumentList.Add($repoUrl)
        $psi.ArgumentList.Add($targetFullPath)
        $psi.UseShellExecute = $false
        $psi.RedirectStandardOutput = $true
        $psi.RedirectStandardError = $true

        $proc = [System.Diagnostics.Process]::new()
        $proc.StartInfo = $psi
        $proc.Start() | Out-Null
        $proc.WaitForExit(15000)

        if ($proc.ExitCode -eq 0) {
            $gitSuccess = $true
            Write-RvLog -Level "suc" -Message "Starter template cloned successfully!" -Context "bootstrap"
        } else {
            Write-RvLog -Level "wrn" -Message "Git clone failed with exit code $($proc.ExitCode). Switching to local scaffolding fallback..." -Context "bootstrap"
        }
    } catch {
        Write-RvLog -Level "wrn" -Message "Git is not installed or unreachable. Switching to local scaffolding fallback..." -Context "bootstrap"
    }

    # Local Scaffolding Fallback
    if (-not $gitSuccess) {
        Scaffold-LocalFolders -TargetDir $targetFullPath
    }

    Write-RvLog -Level "suc" -Message "RavenUI project initialized successfully!" -Context "bootstrap"
    Write-RvLog -Level "inf" -Message "Run 'rvcli doctor' to verify dependencies, then 'rvcli dev' to launch local server." -Context "bootstrap"
}

function Scaffold-LocalFolders {
    param(
        [string]$TargetDir
    )

    Write-RvLog -Level "act" -Message "Scaffolding local workspace structure..." -Context "bootstrap"

    $dirs = @(
        "_layouts",
        "_includes/comps",
        "_includes/core",
        "_sass/ravenui-sp",
        "_data",
        "assets/css",
        "assets/js",
        "assets/img",
        "docs/components"
    )

    foreach ($d in $dirs) {
        $p = [System.IO.Path]::Combine($TargetDir, $d)
        if (-not [System.IO.Directory]::Exists($p)) {
            [System.IO.Directory]::CreateDirectory($p) | Out-Null
        }
    }

    # Create boilerplate _config.yml
    $configContent = @"
title: RavenUI Site
description: Scaffolded documentation site using RavenUI theme.
logo_text: ZERODARK
logo_subtext: SITE
version: 1.0.0
rd_accent_color: "#00ff9d"

theme: jekyll-theme-ravenui

theme_settings:
  scroll_progress: true
  header:
    enabled: true
    sticky: true
  toc:
    style: simple
    density: default
    animations: true
  search:
    provider: pagefind
    use_cdn: true

plugins:
  - jekyll-feed
  - jekyll-seo-tag
"@

    # Create standard Gemfile
    $gemfileContent = @"
source "https://rubygems.org"

gem "jekyll", "~> 4.3"

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-sitemap", "~> 1.4"
end

gem "jekyll-theme-ravenui", :path => "."
"@

    # Create index.md
    $indexContent = @"
---
layout: default
title: **Home**
permalink: /
enable_search: true
---

# **Welcome to RavenUI**

This is your new documentation home page, scaffolded dynamically by the RavenUI CLI (\`rvcli\`).

## **Getting Started**

1. Run \`rvcli doctor\` to check environment dependencies.
2. Run \`rvcli dev\` to start the high-performance local watch/serve server.
3. Open \`http://localhost:4000\` in your browser to view this page!
"@

    # Create navigation data
    $navContent = @"
- title: "Overview"
  items:
    - type: link
      text: "Introduction"
      url: "/"
      icon: "home"
"@

    try {
        [System.IO.File]::WriteAllText([System.IO.Path]::Combine($TargetDir, "_config.yml"), $configContent)
        [System.IO.File]::WriteAllText([System.IO.Path]::Combine($TargetDir, "Gemfile"), $gemfileContent)
        [System.IO.File]::WriteAllText([System.IO.Path]::Combine($TargetDir, "index.md"), $indexContent)
        [System.IO.File]::WriteAllText([System.IO.Path]::Combine($TargetDir, "_data/navigation.yml"), $navContent)

        Write-RvLog -Level "suc" -Message "Scaffolded _config.yml, Gemfile, index.md, navigation.yml" -Context "bootstrap"
    } catch {
        Write-RvLog -Level "fail" -Message "Failed to write scaffold files: $_" -Context "bootstrap"
    }
}
