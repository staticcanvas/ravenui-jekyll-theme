# Request-RvRelease Cmdlet
# Queries and downloads release archives from GitHub or GitLab repository natively using HttpClient.
# [Compliance: public cmdlet | .NET classes | HttpClient | zero external dependencies]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Request-RvRelease {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$Repository = "",

        [Parameter(Mandatory = $false)]
        [string]$Platform = "",

        [Parameter(Mandatory = $false)]
        [string]$Tag = "",

        [Parameter(Mandatory = $false)]
        [switch]$Download,

        [Parameter(Mandatory = $false)]
        [switch]$List,

        [Parameter(Mandatory = $false)]
        [string]$OutFile = "",

        [Parameter(Mandatory = $false)]
        [string]$WorkspaceRoot = "."
    )

    # 1. Resolve Repository and Platform from _config.yml or git if not provided
    $repoUser = $null
    $repoName = $null
    $resolvedPlatform = $Platform

    if ([string]::IsNullOrEmpty($Repository) -or [string]::IsNullOrEmpty($Platform)) {
        $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
        if ([System.IO.File]::Exists($configPath)) {
            try {
                $configText = [System.IO.File]::ReadAllText($configPath)
                $config = ConvertFrom-AuspexYaml -YamlText $configText
                if ($config.Contains("repository") -and $config["repository"] -is [System.Collections.IDictionary]) {
                    $repoConf = $config["repository"]
                    if ([string]::IsNullOrEmpty($Repository)) {
                        if ($repoConf.Contains("user") -and $repoConf.Contains("repo")) {
                            $repoUser = $repoConf["user"].ToString()
                            $repoName = $repoConf["repo"].ToString()
                        }
                    }
                    if ([string]::IsNullOrEmpty($resolvedPlatform) -and $repoConf.Contains("platform")) {
                        $resolvedPlatform = $repoConf["platform"].ToString()
                    }
                }
            } catch {
                # Ignore configuration read errors, fall back to git remote
            }
        }
    }

    # Parse Repository if provided manually
    if (-not [string]::IsNullOrEmpty($Repository)) {
        if ($Repository -match "^([^/]+)/([^/]+)$") {
            $repoUser = $Matches[1]
            $repoName = $Matches[2]
        } else {
            Write-RvLog -Level "fail" -Message "Invalid repository format. Must be 'owner/repo'." -Context "release-fetch"
            return
        }
    }

    # Attempt to parse from git remote if still unresolved
    if ([string]::IsNullOrEmpty($repoUser) -or [string]::IsNullOrEmpty($repoName)) {
        try {
            $gitOutput = (git remote get-url origin 2>$null)
            if ($gitOutput -match 'github\.com[:/]([^/]+)/([^.]+)') {
                $repoUser = $Matches[1]
                $repoName = $Matches[2]
                if ([string]::IsNullOrEmpty($resolvedPlatform)) { $resolvedPlatform = "github" }
            } elseif ($gitOutput -match 'gitlab\.com[:/]([^/]+)/([^.]+)') {
                $repoUser = $Matches[1]
                $repoName = $Matches[2]
                if ([string]::IsNullOrEmpty($resolvedPlatform)) { $resolvedPlatform = "gitlab" }
            }
        } catch {
            # Ignore git error
        }
    }

    # Fallback default values
    if ([string]::IsNullOrEmpty($repoUser)) { $repoUser = "staticcanvas" }
    if ([string]::IsNullOrEmpty($repoName)) { $repoName = "ravenui-jekyll-theme" }
    if ([string]::IsNullOrEmpty($resolvedPlatform)) { $resolvedPlatform = "github" }

    $resolvedPlatform = $resolvedPlatform.ToLower()

    # 2. Build Request URL
    $url = $null
    if ($resolvedPlatform -eq "github") {
        $url = "https://api.github.com/repos/$repoUser/$repoName/releases"
    } elseif ($resolvedPlatform -eq "gitlab") {
        # GitLab expects URL-encoded project path
        $projectPathEncoded = [System.Uri]::EscapeDataString("$repoUser/$repoName")
        $url = "https://gitlab.com/api/v4/projects/$projectPathEncoded/releases"
    } else {
        Write-RvLog -Level "fail" -Message "Unsupported platform '$resolvedPlatform'. Must be 'github' or 'gitlab'." -Context "release-fetch"
        return
    }

    # 3. Query releases using HttpClient
    Write-RvLog -Level "act" -Message "Querying releases from $resolvedPlatform ($repoUser/$repoName)..." -Context "release-fetch"
    
    $client = [System.Net.Http.HttpClient]::new()
    try {
        $request = [System.Net.Http.HttpRequestMessage]::new([System.Net.Http.HttpMethod]::Get, $url)
        # GitHub API requires a User-Agent header
        $request.Headers.UserAgent.ParseAdd("Mozilla/5.0 (Windows NT 10.0; Win64; x64) RavenUI-CLI/1.0")

        $response = $client.SendAsync($request).GetAwaiter().GetResult()
        $content = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()

        if (-not $response.IsSuccessStatusCode) {
            Write-RvLog -Level "fail" -Message "HTTP request failed: $($response.StatusCode) - $content" -Context "release-fetch"
            return
        }

        $releases = ConvertFrom-Json $content

        if (-not $releases -or $releases.Count -eq 0) {
            Write-RvLog -Level "warn" -Message "No releases found for $repoUser/$repoName." -Context "release-fetch"
            return
        }

        # 4. List mode
        if ($List -or (-not $Download)) {
            $lines = [System.Collections.Generic.List[string]]::new()
            foreach ($rel in $releases) {
                $tagName = $rel.tag_name
                $relName = if ($rel.name) { $rel.name } else { "(No Name)" }
                $dateStr = if ($rel.published_at) { $rel.published_at } else { $rel.released_at }
                $lines.Add("• {ct:accent:b:$tagName} - $relName")
                $lines.Add("  Published: $dateStr")
            }
            Write-RvBox -Title "Releases: $repoUser/$repoName" -Lines $lines.ToArray() -BorderColor "accent"
            if (-not $Download) { return }
        }

        # 5. Download mode
        # Match specific tag or choose the latest release
        $selectedRelease = $null
        if (-not [string]::IsNullOrEmpty($Tag)) {
            foreach ($rel in $releases) {
                if ($rel.tag_name -eq $Tag -or $rel.tag_name.ToLower() -eq $Tag.ToLower()) {
                    $selectedRelease = $rel
                    break
                }
            }
            if (-not $selectedRelease) {
                Write-RvLog -Level "fail" -Message "Release tag '$Tag' not found." -Context "release-fetch"
                return
            }
        } else {
            $selectedRelease = $releases[0] # First is latest
        }

        # Determine download URL
        $downloadUrl = $null
        if ($resolvedPlatform -eq "github") {
            # Check custom zip/tarball assets uploaded to release
            if ($selectedRelease.assets -and $selectedRelease.assets.Count -gt 0) {
                $zipAsset = $selectedRelease.assets | Where-Object { $_.name -like "*.zip" -or $_.name -like "*.tar.gz" -or $_.name -like "*.tgz" } | Select-Object -First 1
                if ($zipAsset) {
                    $downloadUrl = $zipAsset.browser_download_url
                }
            }
            if (-not $downloadUrl) {
                # Fall back to source code zipball
                $downloadUrl = $selectedRelease.zipball_url
            }
        } elseif ($resolvedPlatform -eq "gitlab") {
            if ($selectedRelease.assets -and $selectedRelease.assets.sources -and $selectedRelease.assets.sources.Count -gt 0) {
                $zipSource = $selectedRelease.assets.sources | Where-Object { $_.format -eq "zip" } | Select-Object -First 1
                if ($zipSource) {
                    $downloadUrl = $zipSource.url
                } else {
                    $downloadUrl = $selectedRelease.assets.sources[0].url
                }
            }
        }

        if ([string]::IsNullOrEmpty($downloadUrl)) {
            Write-RvLog -Level "fail" -Message "Could not resolve download URL for release tag '$($selectedRelease.tag_name)'." -Context "release-fetch"
            return
        }

        # Determine output file path
        $resolvedOutFile = $OutFile
        if ([string]::IsNullOrEmpty($resolvedOutFile)) {
            $ext = if ($downloadUrl -match '\.tar\.gz$' -or $downloadUrl -match '/tarball/') { ".tar.gz" } else { ".zip" }
            $tempDir = [System.IO.Path]::GetTempPath()
            $resolvedOutFile = [System.IO.Path]::Combine($tempDir, "release-$($selectedRelease.tag_name)$ext")
        }

        Write-RvLog -Level "act" -Message "Downloading release archive from $downloadUrl..." -Context "release-fetch"

        $downloadRequest = [System.Net.Http.HttpRequestMessage]::new([System.Net.Http.HttpMethod]::Get, $downloadUrl)
        $downloadRequest.Headers.UserAgent.ParseAdd("Mozilla/5.0 (Windows NT 10.0; Win64; x64) RavenUI-CLI/1.0")

        # Handle redirects manually if needed, but HttpClient does it by default
        $downloadResponse = $client.SendAsync($downloadRequest).GetAwaiter().GetResult()
        
        if (-not $downloadResponse.IsSuccessStatusCode) {
            Write-RvLog -Level "fail" -Message "Download request failed: $($downloadResponse.StatusCode)" -Context "release-fetch"
            return
        }

        # Write stream to disk
        $fileStream = [System.IO.FileStream]::new($resolvedOutFile, [System.IO.FileMode]::Create, [System.IO.FileAccess]::Write, [System.IO.FileShare]::None)
        try {
            [void]$downloadResponse.Content.CopyToAsync($fileStream).GetAwaiter().GetResult()
        } finally {
            $fileStream.Dispose()
        }

        Write-RvLog -Level "suc" -Message "Release archive downloaded: $resolvedOutFile" -Context "release-fetch"
        return $resolvedOutFile
    } finally {
        $client.Dispose()
    }
}
