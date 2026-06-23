# RavenUI CLI - Invoke-RvMultiTheme Cmdlet
# Multi-theme compiler, packager, and manager.
# [Compliance: file-per-cmdlet | Write-RvLog | UI Box | .NET Compression]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvMultiTheme {
    [CmdletBinding()]
    param(
        [Alias("Args")]
        [string[]]$ThemeArgs = @(),
        [string]$WorkspaceRoot = "."
    )

    $subcommand = if ($ThemeArgs.Count -gt 0) { $ThemeArgs[0].ToLower() } else { "list" }

    if ($subcommand -eq "list") {
        $themes = Get-RvTheme -WorkspaceRoot $WorkspaceRoot
        if ($themes.Count -eq 0) {
            Write-RvLog -Level "wrn" -Message "No custom themes found in '_ravenui-themes/'. Use 'ravenui-<name>' folder naming." -Context "theme"
            return
        }

        Write-RvLog -Level "inf" -Message "Scanning _ravenui-themes/..." -Context "theme"
        $lines = [System.Collections.Generic.List[string]]::new()
        foreach ($t in $themes) {
            $lines.Add("• {ct:accent:$($t.Name)} (v$($t.Version)) by $($t.Author)")
            $lines.Add("  $($t.Description)")
            $lines.Add("")
        }
        # Remove trailing empty line if any
        if ($lines.Count -gt 0) { $lines.RemoveAt($lines.Count - 1) }

        Write-RvBox -Title "Custom Theme Variants" -Lines $lines.ToArray() -BorderColor "accent"
        return
    }

    if ($subcommand -eq "show" -or $subcommand -eq "pack") {
        if ($ThemeArgs.Count -lt 2) {
            Write-RvLog -Level "fail" -Message "Please specify a theme name. Example: './rvcli theme $subcommand midnight'" -Context "theme"
            return
        }
        $target = $ThemeArgs[1]

        if ($subcommand -eq "show") {
            Show-RvThemeMetadata -Name $target -WorkspaceRoot $WorkspaceRoot
        } else {
            Pack-RvTheme -Name $target -WorkspaceRoot $WorkspaceRoot
        }
        return
    }

    Write-RvLog -Level "fail" -Message "Unknown theme subcommand '$subcommand'. Use: list | show | pack" -Context "theme"
}

function Pack-RvTheme {
    param(
        [string]$Name,
        [string]$WorkspaceRoot
    )

    $themes = Get-RvTheme -Name $Name -WorkspaceRoot $WorkspaceRoot
    if ($themes.Count -eq 0) {
        Write-RvLog -Level "fail" -Message "Theme matching '$Name' not found under '_ravenui-themes/'." -Context "theme"
        return
    }

    $t = $themes[0]
    Write-RvLog -Level "act" -Message "Packaging theme '$($t.DisplayName)'..." -Context "theme"

    $distDir = [System.IO.Path]::Combine($WorkspaceRoot, "dist")
    if (-not [System.IO.Directory]::Exists($distDir)) {
        [System.IO.Directory]::CreateDirectory($distDir) | Out-Null
    }

    # Output ZIP name format: ravenui-themename-starterkit-vX.Y.Z.zip
    $cleanName = $t.Name -replace "^ravenui-", ""
    $zipFile = [System.IO.Path]::Combine($distDir, "ravenui-$cleanName-starterkit-v$($t.Version).zip")

    if ([System.IO.File]::Exists($zipFile)) {
        [System.IO.File]::Delete($zipFile)
    }

    # Assemble temporary packaging folder
    $tempDir = [System.IO.Path]::Combine($WorkspaceRoot, "tmp", "packaging_" + [System.Guid]::NewGuid().ToString("N"))
    [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null

    try {
        # 1. Copy base theme layout structure
        $folders = @("_layouts", "_includes", "_sass", "assets")
        foreach ($f in $folders) {
            $srcF = [System.IO.Path]::Combine($WorkspaceRoot, $f)
            $destF = [System.IO.Path]::Combine($tempDir, $f)
            if ([System.IO.Directory]::Exists($srcF)) {
                Copy-ThemeDir-Recursive -Src $srcF -Dest $destF
            }
        }

        # Copy config, readme and version
        $filesToCopy = @("_config.yml", "README.md", "VERSION")
        foreach ($file in $filesToCopy) {
            $srcFile = [System.IO.Path]::Combine($WorkspaceRoot, $file)
            $destFile = [System.IO.Path]::Combine($tempDir, $file)
            if ([System.IO.File]::Exists($srcFile)) {
                [System.IO.File]::Copy($srcFile, $destFile, $true)
            }
        }

        # 2. Overlay custom theme overrides
        foreach ($f in $folders) {
            $themeSrcF = [System.IO.Path]::Combine($t.Path, $f)
            $destF = [System.IO.Path]::Combine($tempDir, $f)
            if ([System.IO.Directory]::Exists($themeSrcF)) {
                Copy-ThemeDir-Recursive -Src $themeSrcF -Dest $destF
            }
        }

        # Overlay custom theme config if present
        $themeConfig = [System.IO.Path]::Combine($t.Path, "_config.yml")
        $destConfig = [System.IO.Path]::Combine($tempDir, "_config.yml")
        if ([System.IO.File]::Exists($themeConfig)) {
            Write-RvLog -Level "act" -Message "Merging theme configuration overrides..." -Context "theme"
            $baseConfigText = [System.IO.File]::ReadAllText($destConfig)
            $themeConfigText = [System.IO.File]::ReadAllText($themeConfig)
            
            $baseHash = ConvertFrom-AuspexYaml -YamlText $baseConfigText
            $themeHash = ConvertFrom-AuspexYaml -YamlText $themeConfigText
            
            $mergedHash = Merge-AuspexConfig -Base $baseHash -Overlay $themeHash
            $mergedText = (ConvertTo-AuspexYaml -Config $mergedHash) -join "`n"
            [System.IO.File]::WriteAllText($destConfig, $mergedText)
        }

        # 3. Zip files using .NET ZipFile class
        [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
        [System.IO.Compression.ZipFile]::CreateFromDirectory($tempDir, $zipFile)

        Write-RvLog -Level "suc" -Message "Successfully packaged starter kit: dist/ravenui-$cleanName-starterkit-v$($t.Version).zip" -Context "theme"
    } catch {
        Write-RvLog -Level "fail" -Message "Theme packaging failed: $_" -Context "theme"
    } finally {
        if ([System.IO.Directory]::Exists($tempDir)) {
            [System.IO.Directory]::Delete($tempDir, $true)
        }
    }
}

function Copy-ThemeDir-Recursive {
    param(
        [string]$Src,
        [string]$Dest
    )
    if (-not [System.IO.Directory]::Exists($Dest)) {
        [System.IO.Directory]::CreateDirectory($Dest) | Out-Null
    }

    foreach ($file in [System.IO.Directory]::GetFiles($Src)) {
        $name = [System.IO.Path]::GetFileName($file)
        if ($name -match '^\.|\.lock|\.zip$|node_modules|vendor') { continue }
        $target = [System.IO.Path]::Combine($Dest, $name)
        [System.IO.File]::Copy($file, $target, $true)
    }

    foreach ($dir in [System.IO.Directory]::GetDirectories($Src)) {
        $name = [System.IO.Path]::GetFileName($dir)
        if ($name -match '^\.|\.git|node_modules|vendor|_site|\.jekyll-cache') { continue }
        $target = [System.IO.Path]::Combine($Dest, $name)
        Copy-ThemeDir-Recursive -Src $dir -Dest $target
    }
}
