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
    foreach ($line in (git status -s)) {
        if ($line -notmatch '^M|^A|^D') {
            Write-Host $line
        }
    }
    
    Write-Host "`nStaged Diff Summary:" -ForegroundColor Green
    git diff --cached --stat
    
    Write-Host "`nUnstaged Diff Summary:" -ForegroundColor Red
    git diff --stat
}

function Invoke-GitBranchesHelper {
    Write-TrackerLog 'act' "Analyzing repository branch status..." "Branches"
    
    # Determine base branch
    $baseBranch = "develop"
    $hasDevelop = git branch --list "develop"
    if (-not $hasDevelop) {
        $baseBranch = "main"
        $hasMain = git branch --list "main"
        if (-not $hasMain) {
            $baseBranch = "master"
        }
    }
    
    # Get current branch
    $currentBranch = (git branch --show-current).Trim()
    
    # Get all local branches
    $branches = git for-each-ref --format='%(refname:short)' refs/heads/
    if ($null -eq $branches -or $branches.Count -eq 0) {
        Write-TrackerLog 'wrn' "No local branches found." "Branches"
        return
    }

    # Calculate max branch name length dynamically (minimum 25)
    $maxBranchLen = 25
    foreach ($b in $branches) {
        $len = Get-StringDisplayWidth $b
        if ($len -gt $maxBranchLen) {
            $maxBranchLen = $len
        }
    }

    # Dynamic TUI Box width calculation
    # columns: currFlag(3) + branchName(maxBranchLen) + spaces(3) + lastActive(16) + diffText(14) + lastCommitMsg(28)
    $boxWidth = 3 + $maxBranchLen + 1 + 16 + 1 + 14 + 1 + 28

    # Parallelize git calls using a RunspacePool for extreme performance
    $sessionState = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
    $pool = [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspacePool(1, 8, $sessionState, $Host)
    $pool.Open()
    
    $jobs = [System.Collections.Generic.List[PSCustomObject]]::new()
    
    foreach ($b in $branches) {
        $powershell = [PowerShell]::Create().AddScript({
            param($b, $baseBranch)
            $lastCommitTime = (git log -1 --format="%cr" $b 2>$null)
            $lastCommitTime = if ($lastCommitTime) { $lastCommitTime.Trim() } else { "Unknown" }
            
            $lastCommitMsg = (git log -1 --format="%s" $b 2>$null)
            $lastCommitMsg = if ($lastCommitMsg) { $lastCommitMsg.Trim() } else { "No message" }
            
            $ahead = 0
            $behind = 0
            if ($b -ne $baseBranch) {
                $aheadStr = (git rev-list --count "$baseBranch..$b" 2>$null)
                $behindStr = (git rev-list --count "$b..$baseBranch" 2>$null)
                if ($aheadStr -and $aheadStr.Trim() -match '^\d+$') { $ahead = [int]($aheadStr.Trim()) }
                if ($behindStr -and $behindStr.Trim() -match '^\d+$') { $behind = [int]($behindStr.Trim()) }
            }
            
            return [PSCustomObject]@{
                Branch = $b
                LastCommitTime = $lastCommitTime
                LastCommitMsg = $lastCommitMsg
                Ahead = $ahead
                Behind = $behind
            }
        }).AddArgument($b).AddArgument($baseBranch)
        
        $powershell.RunspacePool = $pool
        $handle = $powershell.BeginInvoke()
        
        $jobs.Add([PSCustomObject]@{
            PowerShell = $powershell
            Handle = $handle
        })
    }
    
    # Gather parallel results
    $branchMetadataList = [System.Collections.Generic.List[PSCustomObject]]::new()
    foreach ($job in $jobs) {
        $res = $job.PowerShell.EndInvoke($job.Handle)
        $branchMetadataList.Add($res)
        $job.PowerShell.Dispose()
    }
    $pool.Close()
    
    $boldWhite = 15
    $cyan = 81
    $green = 46
    $yellow = 214
    $gray = 244
    
    # Draw TUI dashboard header
    $titleText = " ◆ REPOSITORY BRANCH DASHBOARD (Base: $baseBranch) ◆ "
    $topLine = "┌" + ("─" * $boxWidth) + "┐"
    $midLine = "├" + ("─" * $boxWidth) + "┤"
    $bottomLine = "└" + ("─" * $boxWidth) + "┘"
    
    $titlePadding = [Math]::Max(0, [int][Math]::Floor(($boxWidth - $titleText.Length) / 2))
    $titlePadded = (" " * $titlePadding) + $titleText + (" " * ($boxWidth - $titleText.Length - $titlePadding))
    
    $steps = @(51, 93, 201)
    
    Write-Host ""
    Write-Host (New-AsciiGradient -Type fg -Steps $steps -String $topLine)
    $borderChar = New-AsciiGradient -Type fg -Steps $steps -String "│"
    Write-Host "$borderChar$titlePadded$borderChar"
    Write-Host (New-AsciiGradient -Type fg -Steps $steps -String $midLine)
    
    # Render table headers using Format-TuiRow
    $hCols = @("   ", "Branch Name", "Last Active", "Ahead/Behind", "Last Commit Message")
    $hWidths = @(3, $maxBranchLen, 16, 14, 28)
    $hColors = @(244, $boldWhite, $boldWhite, $boldWhite, $boldWhite)
    $headerRow = Format-TuiRow -Columns $hCols -Widths $hWidths -Colors $hColors -BorderChar $borderChar -BoxWidth $boxWidth
    Write-Host $headerRow
    Write-Host (New-AsciiGradient -Type fg -Steps $steps -String $midLine)
    
    foreach ($meta in $branchMetadataList) {
        $b = $meta.Branch
        $isCurrent = ($b -eq $currentBranch)
        $currFlag = if ($isCurrent) { " * " } else { "   " }
        
        $ahead = $meta.Ahead
        $behind = $meta.Behind
        
        # Colors
        $colorBranchName = 81
        $branchFormat = @()
        if ($isCurrent) {
            $colorBranchName = 46
            $branchFormat = @('Bold')
        }
        
        $diffText = "+$ahead / -$behind"
        $diffColor = 244
        if ($ahead -gt 0 -and $behind -eq 0) { $diffColor = 46 }
        elseif ($ahead -eq 0 -and $behind -gt 0) { $diffColor = 196 }
        elseif ($ahead -gt 0 -and $behind -gt 0) { $diffColor = 214 }
        
        $maxMsgLen = 28
        $truncatedMsg = $meta.LastCommitMsg
        if ($meta.LastCommitMsg.Length -gt $maxMsgLen) {
            $truncatedMsg = $meta.LastCommitMsg.Substring(0, $maxMsgLen - 3) + "..."
        }
        
        # Render row using Format-TuiRow
        $flagColor = if ($isCurrent) { 46 } else { 244 }
        
        $rowCols = @($currFlag, $b, $meta.LastCommitTime, $diffText, $truncatedMsg)
        $rowWidths = @(3, $maxBranchLen, 16, 14, 28)
        $rowColors = @($flagColor, $colorBranchName, 244, $diffColor, 15)
        
        $row = Format-TuiRow -Columns $rowCols -Widths $rowWidths -Colors $rowColors -BorderChar $borderChar -BoxWidth $boxWidth
        Write-Host $row
    }
    
    Write-Host (New-AsciiGradient -Type fg -Steps $steps -String $bottomLine)
    Write-Host ""
}

function Invoke-GitDiffModeHelper {
    param (
        [string]$compareBranch = $null
    )
    
    # Determine base branch if not specified
    if (-not $compareBranch) {
        $compareBranch = "develop"
        $hasDevelop = git branch --list "develop"
        if (-not $hasDevelop) {
            $compareBranch = "main"
            $hasMain = git branch --list "main"
            if (-not $hasMain) {
                $compareBranch = "master"
            }
        }
    }
    
    $currentBranch = (git branch --show-current).Trim()
    Write-TrackerLog 'act' "Comparing branch '$currentBranch' with base '$compareBranch'..." "GitDiff"
    
    # Check if there are any commits ahead
    $commitsAhead = git log "$compareBranch..HEAD" --oneline
    if ($null -eq $commitsAhead -or @($commitsAhead).Count -eq 0) {
        Write-Host "No commits on '$currentBranch' ahead of '$compareBranch'." -ForegroundColor Gray
    } else {
        Write-Host "`nCommits Ahead of '$compareBranch':" -ForegroundColor Green
        foreach ($c in $commitsAhead) {
            Write-Host "  $c" -ForegroundColor Yellow
        }
    }
    
    # Show diff stat
    Write-Host "`nChanged Files Summary:" -ForegroundColor Cyan
    git diff --stat "$compareBranch..HEAD"
    
    # Show detailed code diff preview
    Write-Host "`nDetailed code diff (first 50 lines):" -ForegroundColor Cyan
    git diff "$compareBranch..HEAD" | Select-Object -First 50
    
    Write-Host "`n(Tip: Run 'git diff $compareBranch..HEAD' in your terminal for the full interactive diff.)" -ForegroundColor Gray
}

