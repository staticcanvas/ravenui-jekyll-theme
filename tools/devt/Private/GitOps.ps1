# RavenUI Task Tracker - Private Git Operations Helper

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-NextSemVer([string]$currentVersion, [string]$incrementType) {
    if ($currentVersion -match '^(\d+)\.(\d+)\.(\d+)$') {
        [int]$major = $Matches[1]
        [int]$minor = $Matches[2]
        [int]$patch = $Matches[3]
        switch ($incrementType) {
            'major' { $major++; $minor = 0; $patch = 0 }
            'minor' { $minor++; $patch = 0 }
            'patch' { $patch++ }
        }
        return "$major.$minor.$patch"
    }
    return $currentVersion
}

function Invoke-GitCommitHelper {
    Write-TrackerLog 'act' "Starting Conventional Commit prompt..." "Commit"
    
    # 1. Select Type
    $types = @('feat', 'fix', 'refactor', 'docs', 'chore', 'build', 'style', 'ci', 'test')
    Write-Host "`nSelect commit type:" -ForegroundColor Gray
    for ($i = 0; $i -lt $types.Count; $i++) {
        Write-Host "  [$i] $($types[$i])" -ForegroundColor Cyan
    }
    $typeIndexInput = Read-Host "Choice [0]"
    $typeIndex = 0
    if ($typeIndexInput -match '^\d+$' -and [int]$typeIndexInput -lt $types.Count) {
        $typeIndex = [int]$typeIndexInput
    }
    $type = $types[$typeIndex]

    # 2. Scope
    $scope = (Read-Host "Enter scope (e.g. CLI/MultiTheme, Refactoring/Sass) [optional]").Trim()

    # 3. Summary
    $summary = ""
    while ($summary -eq "") {
        $summary = (Read-Host "Enter short summary (max 72 chars) [mandatory]").Trim()
    }

    # 4. Version Increment
    $increments = @('patch', 'minor', 'major', 'none')
    Write-Host "`nSelect build version increment type:" -ForegroundColor Gray
    for ($i = 0; $i -lt $increments.Count; $i++) {
        Write-Host "  [$i] $($increments[$i])" -ForegroundColor Cyan
    }
    $incIndexInput = Read-Host "Choice [0]"
    $incIndex = 0
    if ($incIndexInput -match '^\d+$' -and [int]$incIndexInput -lt $increments.Count) {
        $incIndex = [int]$incIndexInput
    }
    $increment = $increments[$incIndex]

    # Calculate new version if increment is not 'none'
    $versionLine = ""
    if ($increment -ne 'none') {
        # Resolve Get-ConventionalCommitVersion
        $currentVer = "0.1.0"
        if (Get-Command Get-ConventionalCommitVersion -ErrorAction SilentlyContinue) {
            $autoVerObj = Get-ConventionalCommitVersion
            $currentVer = $autoVerObj.Version
        } else {
            # Try to resolve relative to PSScriptRoot
            $localScript = [System.IO.Path]::Combine($PSScriptRoot, "Get-ConventionalCommitVersion.ps1")
            if (-not [System.IO.File]::Exists($localScript)) {
                $localScript = [System.IO.Path]::Combine($PSScriptRoot, "Private", "Get-ConventionalCommitVersion.ps1")
            }
            if (-not [System.IO.File]::Exists($localScript)) {
                # Fallback to global locations
                $localScript = "/home/gsnow/.gemini/antigravity-cli/scripts/pwsh/Get-ConventionalCommitVersion.ps1"
                if (-not [System.IO.File]::Exists($localScript)) {
                    $localScript = "/home/gsnow/.gemini/config/skills/fluent-ui-v1/resources/Get-ConventionalCommitVersion.ps1"
                }
            }

            if ([System.IO.File]::Exists($localScript)) {
                . $localScript
                $autoVerObj = Get-ConventionalCommitVersion
                $currentVer = $autoVerObj.Version
            } else {
                # Fallback to local VERSION file
                $resolvedVerFile = Resolve-RepoPath "VERSION"
                if ([System.IO.File]::Exists($resolvedVerFile)) {
                    $currentVer = ([System.IO.File]::ReadAllText($resolvedVerFile)).Trim()
                }
            }
        }

        $nextVer = Get-NextSemVer $currentVer $increment
        $versionLine = "build: [$nextVer]`nBuild: $increment"
        Write-TrackerLog 'inf' "Incrementing version from $currentVer to $nextVer ($increment)" "Commit"
    } else {
        $versionLine = "build: [none]"
    }

    # 5. Notes
    Write-Host "`nEnter commit Notes (type '.' or press Enter on empty line to finish):" -ForegroundColor Gray
    $notesList = [System.Collections.Generic.List[string]]::new()
    while ($true) {
        $note = (Read-Host "- ").Trim()
        if ($note -eq "" -or $note -eq ".") { break }
        $notesList.Add("- $note")
    }
    $notesBlock = if ($notesList.Count -gt 0) { $notesList -join "`n" } else { "- None" }

    # 6. Feature Additions
    Write-Host "`nEnter Feature Additions (type '.' or press Enter on empty line to finish):" -ForegroundColor Gray
    $featsList = [System.Collections.Generic.List[string]]::new()
    while ($true) {
        $feat = (Read-Host "- ").Trim()
        if ($feat -eq "" -or $feat -eq ".") { break }
        $featsList.Add("- $feat")
    }
    $featsBlock = if ($featsList.Count -gt 0) { $featsList -join "`n" } else { "- None" }

    # 7. Bug Fixes
    Write-Host "`nEnter Bug Fixes (type '.' or press Enter on empty line to finish):" -ForegroundColor Gray
    $bugsList = [System.Collections.Generic.List[string]]::new()
    while ($true) {
        $bug = (Read-Host "- ").Trim()
        if ($bug -eq "" -or $bug -eq ".") { break }
        $bugsList.Add("- $bug")
    }
    $bugsBlock = if ($bugsList.Count -gt 0) { $bugsList -join "`n" } else { "- None" }

    # Build commit message
    $scopeStr = if ($scope) { "($scope)" } else { "" }
    $header = "$($type)$($scopeStr): $summary"
    
    $sb = [System.Text.StringBuilder]::new()
    [void]$sb.AppendLine($header)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine($versionLine)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("Notes:")
    [void]$sb.AppendLine($notesBlock)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("Feature Additions:")
    [void]$sb.AppendLine($featsBlock)
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("Bug Fixes:")
    [void]$sb.AppendLine($bugsBlock)

    $commitMessage = $sb.ToString().Trim()

    Write-Host "`n================================================================================" -ForegroundColor Gray
    Write-Host $commitMessage -ForegroundColor Yellow
    Write-Host "================================================================================" -ForegroundColor Gray

    $confirm = Read-Host "Do you want to run: git commit -m (staged changes only)? [y/N]"
    if ($confirm -eq 'y' -or $confirm -eq 'Y') {
        # Create temp file to avoid command line parsing issues with quotes/newlines
        $tempFile = [System.IO.Path]::GetTempFileName()
        [System.IO.File]::WriteAllText($tempFile, $commitMessage, [System.Text.Encoding]::UTF8)
        
        try {
            git commit -F $tempFile
            Write-TrackerLog 'suc' "Commit successful!" "Commit"
        }
        catch {
            Write-TrackerLog 'err' "Commit failed: $_" "Commit"
        }
        finally {
            if ([System.IO.File]::Exists($tempFile)) {
                [System.IO.File]::Delete($tempFile)
            }
        }
    } else {
        Write-TrackerLog 'wrn' "Commit aborted." "Commit"
    }
}

function Invoke-GitDiffHelper {
    Write-TrackerLog 'act' "Showing repository diff status..." "Diff"
    Write-Host "`nStaged Files:" -ForegroundColor Green
    git diff --cached --name-status
    
    Write-Host "`nUnstaged Files:" -ForegroundColor Red
    git status -s | Where-Object { $_ -notmatch '^M|^A|^D' }
    
    Write-Host "`nStaged Diff Summary:" -ForegroundColor Green
    git diff --cached --stat
    
    Write-Host "`nUnstaged Diff Summary:" -ForegroundColor Red
    git diff --stat
}
