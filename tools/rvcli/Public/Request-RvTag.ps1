# Request-RvTag Cmdlet
# Queries and displays tags from a GitHub repository natively using HttpClient.
# [Compliance: public cmdlet | .NET classes | HttpClient | zero external dependencies]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Request-RvTag {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$Repository = "",

        [Parameter(Mandatory = $false)]
        [int]$Limit = 10,

        [Parameter(Mandatory = $false)]
        [switch]$Json,

        [Parameter(Mandatory = $false)]
        [string]$WorkspaceRoot = "."
    )

    # 1. Resolve Repository from _config.yml or git if not provided
    $repoUser = $null
    $repoName = $null

    if ([string]::IsNullOrEmpty($Repository)) {
        $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
        if ([System.IO.File]::Exists($configPath)) {
            try {
                $configText = [System.IO.File]::ReadAllText($configPath)
                $config = ConvertFrom-AuspexYaml -YamlText $configText
                if ($config.Contains("repository") -and $config["repository"] -is [System.Collections.IDictionary]) {
                    $repoConf = $config["repository"]
                    if ($repoConf.Contains("user") -and $repoConf.Contains("repo")) {
                        $repoUser = $repoConf["user"].ToString()
                        $repoName = $repoConf["repo"].ToString()
                    }
                }
            } catch {
                # Ignore configuration errors
            }
        }
    }

    # Parse Repository if provided manually
    if (-not [string]::IsNullOrEmpty($Repository)) {
        if ($Repository -match "^([^/]+)/([^/]+)$") {
            $repoUser = $Matches[1]
            $repoName = $Matches[2]
        } else {
            Write-RvLog -Level "fail" -Message "Invalid repository format. Must be 'owner/repo'." -Context "tag-fetch"
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
            }
        } catch {
            # Ignore git error
        }
    }

    # Fallback default values
    if ([string]::IsNullOrEmpty($repoUser)) { $repoUser = "staticcanvas" }
    if ([string]::IsNullOrEmpty($repoName)) { $repoName = "ravenui-jekyll-theme" }

    # 2. Build GitHub API URL for tags
    $url = "https://api.github.com/repos/$repoUser/$repoName/tags"

    Write-RvLog -Level "act" -Message "Querying tags from GitHub ($repoUser/$repoName)..." -Context "tag-fetch"

    $client = [System.Net.Http.HttpClient]::new()
    try {
        $request = [System.Net.Http.HttpRequestMessage]::new([System.Net.Http.HttpMethod]::Get, $url)
        # GitHub API requires User-Agent header
        $request.Headers.UserAgent.ParseAdd("Mozilla/5.0 (Windows NT 10.0; Win64; x64) RavenUI-CLI/1.0")

        $response = $client.SendAsync($request).GetAwaiter().GetResult()
        $content = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()

        if (-not $response.IsSuccessStatusCode) {
            Write-RvLog -Level "fail" -Message "HTTP request failed: $($response.StatusCode) - $content" -Context "tag-fetch"
            return
        }

        $tags = ConvertFrom-Json $content
        if (-not $tags -or $tags.Count -eq 0) {
            Write-RvLog -Level "warn" -Message "No tags found for $repoUser/$repoName." -Context "tag-fetch"
            return
        }

        # Apply limit
        $outputTags = $tags
        if ($tags.Count -gt $Limit) {
            $outputTags = $tags[0..($Limit - 1)]
        }

        # 3. Output results
        if ($Json) {
            $outputTags | ConvertTo-Json -Depth 5 | Write-Output
            return
        }

        $lines = [System.Collections.Generic.List[string]]::new()
        foreach ($tag in $outputTags) {
            $name = $tag.name
            $sha = $tag.commit.sha.Substring(0, 8)
            $lines.Add("• {ct:success:b:$name} (commit: {ct:primary:$sha})")
        }

        Write-RvBox -Title "GitHub Tags: $repoUser/$repoName" -Lines $lines.ToArray() -BorderColor "accent"
    } finally {
        $client.Dispose()
    }
}
