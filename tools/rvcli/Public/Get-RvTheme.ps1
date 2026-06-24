# RavenUI CLI - Get-RvTheme Cmdlet
# Scans '_ravenui-themes' directory and extracts theme metadata.
# [Compliance: file-per-cmdlet | Write-RvLog | .NET optimization]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-RvTheme {
    [CmdletBinding()]
    param(
        [string]$Name = "*",
        [string]$WorkspaceRoot = "."
    )

    $themesDir = [System.IO.Path]::Combine($WorkspaceRoot, "_ravenui-themes")
    if (-not [System.IO.Directory]::Exists($themesDir)) {
        return @()
    }

    $subdirs = [System.IO.Directory]::GetDirectories($themesDir, "ravenui-*")
    $results = [System.Collections.Generic.List[PSCustomObject]]::new()

    foreach ($dir in $subdirs) {
        $themeName = [System.IO.Path]::GetFileName($dir)
        
        # Filter by name if specified
        if ($Name -ne "*" -and $themeName -notlike "*$Name*") {
            continue
        }

        $configPath = [System.IO.Path]::Combine($dir, "_config.yml")
        $themeYmlPath = [System.IO.Path]::Combine($dir, "theme.yml")

        $displayName = $themeName -replace "^ravenui-", ""
        $version = "0.0.0"
        $author = "Unknown"
        $description = "No description provided."

        $metaFile = $null
        if ([System.IO.File]::Exists($themeYmlPath)) {
            $metaFile = $themeYmlPath
        } elseif ([System.IO.File]::Exists($configPath)) {
            $metaFile = $configPath
        }

        if ($metaFile) {
            $content = [System.IO.File]::ReadAllText($metaFile)
            # Regex parse to extract YAML keys simply
            if ($content -match '(?im)^\s*name:\s*["'']?([^"''\r\n]+)["'']?') {
                $displayName = $Matches[1].Trim()
            }
            if ($content -match '(?im)^\s*version:\s*["'']?([^"''\r\n]+)["'']?') {
                $version = $Matches[1].Trim()
            }
            if ($content -match '(?im)^\s*author:\s*["'']?([^"''\r\n]+)["'']?') {
                $author = $Matches[1].Trim()
            }
            if ($content -match '(?im)^\s*description:\s*["'']?([^"''\r\n]+)["'']?') {
                $description = $Matches[1].Trim()
            }
        }

        $results.Add([PSCustomObject]@{
            Name        = $themeName
            DisplayName = $displayName
            Version     = $version
            Author      = $author
            Description = $description
            Path        = $dir
        })
    }

    return $results.ToArray()
}
