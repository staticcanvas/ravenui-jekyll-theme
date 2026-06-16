# RavenUI CLI - Theme Variant Packager

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvVariant {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    Write-RvLog -Level "act" -Message "Starting layout variant packaging..." -Context "variants"

    $distDir = [System.IO.Path]::Combine($WorkspaceRoot, "dist")
    if (-not [System.IO.Directory]::Exists($distDir)) {
        [System.IO.Directory]::CreateDirectory($distDir) | Out-Null
    }

    # Clean existing packages
    $minZipPath = [System.IO.Path]::Combine($distDir, "theme-variant-minimalist.zip")
    $stdZipPath = [System.IO.Path]::Combine($distDir, "theme-variant-standard.zip")

    if ([System.IO.File]::Exists($minZipPath)) { [System.IO.File]::Delete($minZipPath) }
    if ([System.IO.File]::Exists($stdZipPath)) { [System.IO.File]::Delete($stdZipPath) }

    # Create temporary packaging directories
    $tempDir = [System.IO.Path]::Combine($WorkspaceRoot, "tmp", "packaging_" + [System.Guid]::NewGuid().ToString("N"))
    [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null

    try {
        # 1. Package Minimalist variant
        $minTemp = [System.IO.Path]::Combine($tempDir, "minimalist")
        [System.IO.Directory]::CreateDirectory($minTemp) | Out-Null
        
        Write-RvLog -Level "act" -Message "Assembling Minimalist layout package..." -Context "variants"
        Copy-VariantFiles -Src $WorkspaceRoot -Dest $minTemp -Type "minimal"

        # Zip using .NET Compression
        [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
        [System.IO.Compression.ZipFile]::CreateFromDirectory($minTemp, $minZipPath)
        Write-RvLog -Level "suc" -Message "Created: dist/theme-variant-minimalist.zip" -Context "variants"

        # 2. Package Standard variant
        $stdTemp = [System.IO.Path]::Combine($tempDir, "standard")
        [System.IO.Directory]::CreateDirectory($stdTemp) | Out-Null

        Write-RvLog -Level "act" -Message "Assembling Standard layout package..." -Context "variants"
        Copy-VariantFiles -Src $WorkspaceRoot -Dest $stdTemp -Type "standard"

        [System.IO.Compression.ZipFile]::CreateFromDirectory($stdTemp, $stdZipPath)
        Write-RvLog -Level "suc" -Message "Created: dist/theme-variant-standard.zip" -Context "variants"

        Write-RvLog -Level "suc" -Message "Packaging complete! Archives successfully built." -Context "variants"
    } catch {
        Write-RvLog -Level "fail" -Message "Packaging encountered an error: $_" -Context "variants"
    } finally {
        if ([System.IO.Directory]::Exists($tempDir)) {
            [System.IO.Directory]::Delete($tempDir, $true)
        }
    }
}

function Copy-VariantFiles {
    param(
        [string]$Src,
        [string]$Dest,
        [string]$Type
    )

    $folders = @("_layouts", "_includes", "_sass", "assets")
    foreach ($f in $folders) {
        $sFolder = [System.IO.Path]::Combine($Src, $f)
        $dFolder = [System.IO.Path]::Combine($Dest, $f)
        if ([System.IO.Directory]::Exists($sFolder)) {
            Copy-Dir-Recursive -Src $sFolder -Dest $dFolder
        }
    }

    # Custom variant config files
    $configSrc = [System.IO.Path]::Combine($Src, "_config.yml")
    $configDest = [System.IO.Path]::Combine($Dest, "_config.yml")
    if ([System.IO.File]::Exists($configSrc)) {
        $cfg = [System.IO.File]::ReadAllText($configSrc)
        if ($Type -eq "minimal") {
            # Disable extra components / animations in config
            $cfg = $cfg -replace '(?im)^  animations:\s*$', '  animations:'
            $cfg = $cfg -replace '(?im)^    enabled: true', '    enabled: false'
            $cfg = $cfg -replace '(?im)^    page_loads: true', '    page_loads: false'
        }
        [System.IO.File]::WriteAllText($configDest, $cfg)
    }
}

function Copy-Dir-Recursive {
    param(
        [string]$Src,
        [string]$Dest
    )
    if (-not [System.IO.Directory]::Exists($Dest)) {
        [System.IO.Directory]::CreateDirectory($Dest) | Out-Null
    }

    foreach ($file in [System.IO.Directory]::GetFiles($Src)) {
        $name = [System.IO.Path]::GetFileName($file)
        # Skip temporary build files or local lock/database files
        if ($name -match '^\.|\.lock|\.zip$|node_modules|vendor') { continue }
        $target = [System.IO.Path]::Combine($Dest, $name)
        [System.IO.File]::Copy($file, $target, $true)
    }

    foreach ($dir in [System.IO.Directory]::GetDirectories($Src)) {
        $name = [System.IO.Path]::GetFileName($dir)
        if ($name -match '^\.|\.git|node_modules|vendor|_site|\.jekyll-cache') { continue }
        $target = [System.IO.Path]::Combine($Dest, $name)
        Copy-Dir-Recursive -Src $dir -Dest $target
    }
}
