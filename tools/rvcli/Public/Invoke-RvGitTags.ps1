# RavenUI CLI - Git Tag History to YAML Generator
# [Compliance: .NET classes, StringBuilder, Write-RvLog, file-per-cmdlet]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvGitTags {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    # -- Parse flags -----------------------------------------------------------
    $limit      = 50
    $outputPath = $null
    $dryRun     = $false

    for ($i = 0; $i -lt $Args.Count; $i++) {
        switch ($Args[$i]) {
            '--limit' {
                if ($i + 1 -lt $Args.Count) {
                    $limit = [int]$Args[++$i]
                }
            }
            '--output' {
                if ($i + 1 -lt $Args.Count) {
                    $outputPath = $Args[++$i]
                }
            }
            '--dry-run' { $dryRun = $true }
        }
    }

    if (-not $outputPath) {
        $outputPath = [System.IO.Path]::Combine($WorkspaceRoot, 'docs', '_data', 'git-tags.yml')
    }

    # -- Resolve absolute workspace path ---------------------------------------
    $repoRoot = [System.IO.Path]::GetFullPath($WorkspaceRoot)

    Write-RvLog -Level 'act' -Message "Reading git tag history (limit: $limit)..." -Context 'git-tags'

    # -- Collect sorted tags ---------------------------------------------------
    $tagList = Invoke-RvGitCmd -Arguments @('tag', '--sort=-version:refname') -WorkspaceRoot $repoRoot

    if ([string]::IsNullOrWhiteSpace($tagList)) {
        Write-RvLog -Level 'wrn' -Message 'No tags found in this repository.' -Context 'git-tags'
        return
    }

    $tags = ($tagList -split "`n") | Where-Object { $_ -match '\S' } | Select-Object -First $limit

    Write-RvLog -Level 'inf' -Message "Found $($tags.Count) tag(s). Building YAML..." -Context 'git-tags'

    # -- Build YAML via StringBuilder ------------------------------------------
    $sb = [System.Text.StringBuilder]::new()

    foreach ($tag in $tags) {
        $tagName = $tag.Trim()

        # Resolve commit hash for this tag
        $hash = (Invoke-RvGitCmd -Arguments @('rev-list', '-n', '1', $tagName) -WorkspaceRoot $repoRoot).Trim()

        if ([string]::IsNullOrWhiteSpace($hash)) {
            Write-RvLog -Level 'wrn' -Message "Could not resolve hash for tag '$tagName'. Skipping." -Context 'git-tags'
            continue
        }

        # ISO 8601 date: trim to date portion only (YYYY-MM-DD)
        $rawDate = (Invoke-RvGitCmd -Arguments @('log', '-1', '--format=%ci', $hash) -WorkspaceRoot $repoRoot).Trim()
        $date    = if ($rawDate -match '^(\d{4}-\d{2}-\d{2})') { $Matches[1] } else { $rawDate }

        # Commit subject: replace double-quotes to avoid YAML parse issues
        $message = (Invoke-RvGitCmd -Arguments @('log', '-1', '--format=%s', $hash) -WorkspaceRoot $repoRoot).Trim()
        $message = ([string]$message).Replace('"', "'")

        [void]$sb.AppendLine("- name: `"$tagName`"")
        [void]$sb.AppendLine("  hash: `"$hash`"")
        [void]$sb.AppendLine("  date: `"$date`"")
        [void]$sb.AppendLine("  message: `"$message`"")
        [void]$sb.AppendLine("")
    }

    $yaml = $sb.ToString()

    # -- Dry-run: print to stdout ----------------------------------------------
    if ($dryRun) {
        Write-RvLog -Level 'inf' -Message '[dry-run] Output (not written to disk):' -Context 'git-tags'
        Write-Host $yaml
        return
    }

    # -- Write file ------------------------------------------------------------
    $dir = [System.IO.Path]::GetDirectoryName($outputPath)
    if (-not [System.IO.Directory]::Exists($dir)) {
        [System.IO.Directory]::CreateDirectory($dir) | Out-Null
    }

    [System.IO.File]::WriteAllText($outputPath, $yaml, [System.Text.Encoding]::UTF8)

    Write-RvLog -Level 'suc' -Message "Wrote $($tags.Count) tag(s) to: $outputPath" -Context 'git-tags'
}



