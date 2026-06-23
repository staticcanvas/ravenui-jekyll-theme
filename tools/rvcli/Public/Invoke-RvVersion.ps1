# RavenUI CLI - Site Version Manager
# [Compliance: .NET classes, regex, Write-RvLog, file-per-cmdlet]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvVersion {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    $repoRoot      = [System.IO.Path]::GetFullPath($WorkspaceRoot)
    $versionFile   = [System.IO.Path]::Combine($repoRoot, 'VERSION')
    $configFile    = [System.IO.Path]::Combine($repoRoot, '_config.yml')

    # -- Sub-command + optional value -----------------------------------------
    $subCommand = if ($Args.Count -gt 0) { $Args[0].ToLower() } else { 'get' }
    $subArg     = if ($Args.Count -gt 1) { $Args[1] } else { $null }

    switch ($subCommand) {

        # ----------------------------------------------------------------------
        # get  (default): print current version from both sources
        # ----------------------------------------------------------------------
        { $_ -eq 'get' -or $_ -eq '' } {
            $vfVer  = Read-RvVersionFile  -Path $versionFile
            $cfgVer = Read-RvConfigVersion -Path $configFile

            Write-RvLog -Level 'inf' -Message "VERSION file   : $vfVer"  -Context 'version'
            Write-RvLog -Level 'inf' -Message "_config.yml    : $cfgVer" -Context 'version'

            if ($vfVer -ne $cfgVer) {
                Write-RvLog -Level 'wrn' -Message 'Sources are out of sync. Run: rvcli version sync' -Context 'version'
            }
        }

        # ----------------------------------------------------------------------
        # set <version>: write explicit version to both sources
        # ----------------------------------------------------------------------
        'set' {
            if (-not $subArg) {
                Write-RvLog -Level 'fail' -Message "Usage: rvcli version set <version>" -Context 'version'
                return
            }

            $oldVer = Read-RvVersionFile -Path $versionFile
            Write-RvLog -Level 'act' -Message "Setting version: $oldVer -> $subArg" -Context 'version'

            Write-RvVersionFile   -Path $versionFile -Version $subArg
            Write-RvConfigVersion -Path $configFile  -Version $subArg

            Write-RvLog -Level 'suc' -Message "Version set to $subArg in VERSION and _config.yml." -Context 'version'
        }

        # ----------------------------------------------------------------------
        # bump major|minor|patch: auto-increment semantic version
        # ----------------------------------------------------------------------
        'bump' {
            $part = if ($subArg) { $subArg.ToLower() } else { 'patch' }

            if ($part -notin @('major', 'minor', 'patch')) {
                Write-RvLog -Level 'fail' -Message "Invalid bump part '$part'. Use: major | minor | patch" -Context 'version'
                return
            }

            $currentVer = Read-RvVersionFile -Path $versionFile
            $newVer     = Invoke-RvSemverBump -Version $currentVer -Part $part

            Write-RvLog -Level 'act' -Message "Bumping ${part}: $currentVer -> $newVer" -Context 'version'

            Write-RvVersionFile   -Path $versionFile -Version $newVer
            Write-RvConfigVersion -Path $configFile  -Version $newVer

            Write-RvLog -Level 'suc' -Message "Version bumped: $currentVer -> $newVer" -Context 'version'
        }

        # ----------------------------------------------------------------------
        # sync: read VERSION file, push value to _config.yml
        # ----------------------------------------------------------------------
        'sync' {
            $vfVer = Read-RvVersionFile -Path $versionFile
            Write-RvLog -Level 'act' -Message "Syncing version '$vfVer' from VERSION -> _config.yml" -Context 'version'
            Write-RvConfigVersion -Path $configFile -Version $vfVer
            Write-RvLog -Level 'suc' -Message "_config.yml version field updated to $vfVer." -Context 'version'
        }

        default {
            Write-RvLog -Level 'fail' -Message "Unknown sub-command '$subCommand'. Use: get | set | bump | sync" -Context 'version'
        }
    }
}

# ---------------------------------------------------------------------------
# Helpers: file I/O
# ---------------------------------------------------------------------------

function Read-RvVersionFile {
    param([string]$Path)

    if (-not [System.IO.File]::Exists($Path)) {
        Write-RvLog -Level 'wrn' -Message "VERSION file not found: $Path. Defaulting to 0.0.0" -Context 'version'
        return '0.0.0'
    }

    $content = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
    return $content.Trim()
}

function Write-RvVersionFile {
    param(
        [string]$Path,
        [string]$Version
    )
    [System.IO.File]::WriteAllText($Path, $Version, [System.Text.Encoding]::UTF8)
}

function Read-RvConfigVersion {
    param([string]$Path)

    if (-not [System.IO.File]::Exists($Path)) {
        Write-RvLog -Level 'wrn' -Message "_config.yml not found: $Path" -Context 'version'
        return 'unknown'
    }

    $content = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)
    if ($content -match '(?m)^version:\s*(.+)$') {
        return $Matches[1].Trim()
    }
    return 'unknown'
}

function Write-RvConfigVersion {
    param(
        [string]$Path,
        [string]$Version
    )

    $content = [System.IO.File]::ReadAllText($Path, [System.Text.Encoding]::UTF8)

    # Patch the version: field in-place; handles both plain and quoted values
    $patched = [regex]::Replace(
        $content,
        '(?m)^(version:\s*).*$',
        "version: $Version"
    )

    [System.IO.File]::WriteAllText($Path, $patched, [System.Text.Encoding]::UTF8)
}

# ---------------------------------------------------------------------------
# SemVer increment logic
# ---------------------------------------------------------------------------

function Invoke-RvSemverBump {
    param(
        [string]$Version,
        [string]$Part   # major | minor | patch
    )

    # Strip leading 'v' prefix if present; re-attach after bump
    $hasV   = $Version.StartsWith('v', [System.StringComparison]::OrdinalIgnoreCase)
    $semver = $Version.TrimStart('v')

    if ($semver -notmatch '^(\d+)\.(\d+)\.(\d+)') {
        throw "Cannot parse semantic version: '$Version'"
    }

    [int]$major = [int]$Matches[1]
    [int]$minor = [int]$Matches[2]
    [int]$patch = [int]$Matches[3]

    switch ($Part) {
        'major' { $major++; $minor = 0; $patch = 0 }
        'minor' { $minor++; $patch = 0 }
        'patch' { $patch++ }
    }

    $bumped = "$major.$minor.$patch"
    return if ($hasV) { "v$bumped" } else { $bumped }
}
