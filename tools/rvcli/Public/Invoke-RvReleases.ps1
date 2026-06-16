# RavenUI CLI - Release Notes Generator from Git Commit Log
# [Compliance: .NET classes, StringBuilder, Write-RvLog, file-per-cmdlet]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvReleases {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    # -- Parse flags -----------------------------------------------------------
    $appendMode  = $false
    $tagName     = $null
    $outputPath  = $null
    $dryRun      = $false

    for ($i = 0; $i -lt $Args.Count; $i++) {
        switch ($Args[$i]) {
            '--append'  { $appendMode = $true }
            '--dry-run' { $dryRun = $true }
            '--tag' {
                if ($i + 1 -lt $Args.Count) {
                    $tagName = $Args[++$i]
                }
            }
            '--output' {
                if ($i + 1 -lt $Args.Count) {
                    $outputPath = $Args[++$i]
                }
            }
        }
    }

    if (-not $outputPath) {
        $outputPath = [System.IO.Path]::Combine($WorkspaceRoot, 'docs', '_data', 'releases.yml')
    }

    $repoRoot = [System.IO.Path]::GetFullPath($WorkspaceRoot)

    # -- Resolve release tag name ----------------------------------------------
    if (-not $tagName) {
        $latestTag = (Invoke-RvGitCmd -Arguments @('describe', '--tags', '--abbrev=0') -WorkspaceRoot $repoRoot).Trim()
        $tagName   = if ([string]::IsNullOrWhiteSpace($latestTag)) { 'unreleased' } else { $latestTag }
    }

    Write-RvLog -Level 'act' -Message "Generating release entry for tag: $tagName" -Context 'releases'

    # -- Determine commit range ------------------------------------------------
    # Range: last tag..HEAD (commits since last tag), or all commits for 'unreleased'
    $prevTag = (Invoke-RvGitCmd -Arguments @('describe', '--tags', '--abbrev=0', '--always', 'HEAD^') -WorkspaceRoot $repoRoot).Trim()

    $logRange = if (-not [string]::IsNullOrWhiteSpace($prevTag) -and $prevTag -ne $tagName) {
        "${prevTag}..HEAD"
    } else {
        'HEAD'
    }

    Write-RvLog -Level 'inf' -Message "Parsing commit range: $logRange" -Context 'releases'

    # -- Fetch commit subjects from log ----------------------------------------
    $logOutput = Invoke-RvGitCmd `
        -Arguments @('log', $logRange, '--format=%s', '--no-merges') `
        -WorkspaceRoot $repoRoot

    $subjects = ($logOutput -split "`n") | Where-Object { $_ -match '\S' }

    # -- Group by Conventional Commit type -------------------------------------
    # Map: key = type label displayed in YAML body, value = list of messages
    $groups = [System.Collections.Generic.Dictionary[string, System.Collections.Generic.List[string]]]::new()

    $typeMap = @{
        feat     = 'Features'
        fix      = 'Fixes'
        refactor = 'Refactoring'
        perf     = 'Performance'
        docs     = 'Documentation'
        style    = 'Style'
        test     = 'Tests'
        chore    = 'Chores'
        build    = 'Build'
        ci       = 'CI'
        revert   = 'Reverts'
    }

    # Ordered output sequence for YAML body
    $typeOrder = @('feat', 'fix', 'refactor', 'perf', 'docs', 'style', 'test', 'chore', 'build', 'ci', 'revert')

    foreach ($subject in $subjects) {
        $matched = $false
        foreach ($type in $typeOrder) {
            if ($subject -match "^${type}(\(.+?\))?(\!)?:") {
                if (-not $groups.ContainsKey($type)) {
                    $groups[$type] = [System.Collections.Generic.List[string]]::new()
                }
                $groups[$type].Add($subject.Trim())
                $matched = $true
                break
            }
        }
        if (-not $matched) {
            # Uncategorised commits fall under 'chore'
            if (-not $groups.ContainsKey('chore')) {
                $groups['chore'] = [System.Collections.Generic.List[string]]::new()
            }
            $groups['chore'].Add($subject.Trim())
        }
    }

    # -- Resolve published_at timestamp ----------------------------------------
    # Use the tag's author date if available; otherwise use now (UTC ISO 8601)
    $tagDate = (Invoke-RvGitCmd `
        -Arguments @('log', '-1', '--format=%aI', $tagName) `
        -WorkspaceRoot $repoRoot).Trim()

    $publishedAt = if ([string]::IsNullOrWhiteSpace($tagDate)) {
        [System.DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ')
    } else {
        $tagDate
    }

    # -- Derive a human release name from tag ----------------------------------
    # Strategy: strip leading 'v' and capitalise; e.g. 'v1.4.0' -> '1.4.0 Release'
    $releaseName = ([string]$tagName).TrimStart('v') + ' Release'

    # -- Build YAML body block using StringBuilder ----------------------------
    $bodySb = [System.Text.StringBuilder]::new()

    foreach ($type in $typeOrder) {
        if (-not $groups.ContainsKey($type)) { continue }
        $label = $typeMap[$type]
        [void]$bodySb.AppendLine("    ### $label")
        foreach ($msg in $groups[$type]) {
            # Escape single-quote YAML risk: wrap message safely
            $safe = ([string]$msg).Replace('"', "'")
            [void]$bodySb.AppendLine("    - $safe")
        }
        [void]$bodySb.AppendLine("")
    }

    $bodyContent = $bodySb.ToString().TrimEnd()

    # -- Assemble full YAML entry ---------------------------------------------
    $repoUrl    = 'https://github.com/staticcanvas/ravenui-jekyll-theme'
    $htmlUrl    = "$repoUrl/releases/tag/$tagName"

    $entrySb = [System.Text.StringBuilder]::new()
    [void]$entrySb.AppendLine("- tag_name: `"$tagName`"")
    [void]$entrySb.AppendLine("  published_at: `"$publishedAt`"")
    [void]$entrySb.AppendLine("  name: `"$releaseName`"")
    [void]$entrySb.AppendLine("  body: |")
    foreach ($bodyLine in ($bodyContent -split "`n")) {
        [void]$entrySb.AppendLine("  $bodyLine")
    }
    [void]$entrySb.AppendLine("  html_url: `"$htmlUrl`"")
    [void]$entrySb.AppendLine("")

    $newEntry = $entrySb.ToString()

    # -- Dry-run: print to stdout ----------------------------------------------
    if ($dryRun) {
        Write-RvLog -Level 'inf' -Message '[dry-run] Release entry (not written to disk):' -Context 'releases'
        Write-Host $newEntry
        return
    }

    # -- Append or replace -----------------------------------------------------
    $dir = [System.IO.Path]::GetDirectoryName($outputPath)
    if (-not [System.IO.Directory]::Exists($dir)) {
        [System.IO.Directory]::CreateDirectory($dir) | Out-Null
    }

    if ($appendMode -and [System.IO.File]::Exists($outputPath)) {
        $existing = [System.IO.File]::ReadAllText($outputPath, [System.Text.Encoding]::UTF8)
        $final    = $newEntry + $existing
        [System.IO.File]::WriteAllText($outputPath, $final, [System.Text.Encoding]::UTF8)
        Write-RvLog -Level 'suc' -Message "Prepended release '$tagName' to existing: $outputPath" -Context 'releases'
    } else {
        [System.IO.File]::WriteAllText($outputPath, $newEntry, [System.Text.Encoding]::UTF8)
        Write-RvLog -Level 'suc' -Message "Wrote release '$tagName' to: $outputPath" -Context 'releases'
    }

    $commitCount = $subjects.Count
    Write-RvLog -Level 'inf' -Message "Parsed $commitCount commit(s) across $($groups.Count) group(s)." -Context 'releases'
}



