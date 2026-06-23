# RavenUI CLI - Feature Toggle Manager
# Lists, enables, disables, or toggles feature flags in _config.yml, and dynamically manages plugin dependencies.
# [Compliance: file-per-cmdlet | Write-RvLog | UI Box | Auspex integration]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvFeatureToggle {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    $flagsPath = [System.IO.Path]::Combine($WorkspaceRoot, "_data/feature_flags.yml")
    $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")

    if (-not [System.IO.File]::Exists($flagsPath)) {
        Write-RvLog -Level "fail" -Message "feature_flags.yml not found under _data/." -Context "toggle"
        return
    }
    if (-not [System.IO.File]::Exists($configPath)) {
        Write-RvLog -Level "fail" -Message "_config.yml not found at $WorkspaceRoot." -Context "toggle"
        return
    }

    # Load feature flags definition and current config
    $flagsText = [System.IO.File]::ReadAllText($flagsPath)
    $parsedFlags = ConvertFrom-AuspexYaml -YamlText $flagsText
    $flagsList = $parsedFlags["items"]

    if ($null -eq $flagsList -or $flagsList.Count -eq 0) {
        Write-RvLog -Level "fail" -Message "No feature flags defined in _data/feature_flags.yml." -Context "toggle"
        return
    }

    $configText = [System.IO.File]::ReadAllText($configPath)
    $config = ConvertFrom-AuspexYaml -YamlText $configText

    # Subcommand routing
    $subcommand = if ($Args.Count -gt 0) { $Args[0].ToLower() } else { "list" }

    if ($subcommand -eq "list") {
        Write-RvLog -Level "inf" -Message "Scanning workspace feature flags..." -Context "toggle"
        
        $lines = [System.Collections.Generic.List[string]]::new()
        foreach ($flag in $flagsList) {
            $name = $flag["name"]
            $path = $flag["path"]
            $cat = $flag["category"]
            $desc = $flag["description"]
            
            # Query current value
            $val = Get-AuspexConfig -Config $config -Path $path
            $statusText = if ($null -eq $val) {
                $flag["default"]
            } else {
                if ($val -is [bool]) { if ($val) { "true" } else { "false" } } else { "$val" }
            }
            
            $badgeColor = if ($statusText -eq "true") { "green" } else { "muted" }
            $statusBadge = "{ct:${badgeColor}:}[$($statusText.ToString().ToUpper())]{ct:default:}"
            
            $lines.Add("• {ct:accent:b:$name} - $statusBadge")
            $lines.Add("  Path: {ct:primary:$path} | Cat: $cat")
            $lines.Add("  $desc")
            $lines.Add("")
        }
        if ($lines.Count -gt 0) { $lines.RemoveAt($lines.Count - 1) }

        Write-RvBox -Title "RavenUI Feature Toggles" -Lines $lines.ToArray() -BorderColor "accent"
        return
    }

    if ($subcommand -eq "enable" -or $subcommand -eq "disable" -or $subcommand -eq "toggle") {
        if ($Args.Count -lt 2) {
            Write-RvLog -Level "fail" -Message "Please specify a feature name or path. Example: './rvcli toggle enable theme_settings.sidebar.enabled'" -Context "toggle"
            return
        }
        
        $target = $Args[1]
        
        # Find the feature flag definition
        $matchedFlag = $null
        foreach ($flag in $flagsList) {
            if ($flag["path"] -eq $target -or $flag["name"] -eq $target -or $flag["name"].ToLower() -eq $target.ToLower()) {
                $matchedFlag = $flag
                break
            }
        }
        
        if ($null -eq $matchedFlag) {
            Write-RvLog -Level "fail" -Message "Feature matching '$target' not found in _data/feature_flags.yml." -Context "toggle"
            return
        }
        
        $path = $matchedFlag["path"]
        $name = $matchedFlag["name"]
        
        # Determine current value and new value
        $curr = Get-AuspexConfig -Config $config -Path $path
        if ($null -eq $curr) {
            $currStr = $matchedFlag["default"]
            $curr = if ($currStr -eq "true") { $true } else { $false }
        }
        
        $newVal = $curr
        if ($subcommand -eq "enable") { $newVal = $true }
        elseif ($subcommand -eq "disable") { $newVal = $false }
        elseif ($subcommand -eq "toggle") { $newVal = -not $curr }
        
        # Update config path
        Set-AuspexConfig -Config $config -Path $path -Value $newVal
        
        # Configure plugin dependencies dynamically
        $pluginMap = @{
            "theme_settings.feedback.comments.enabled" = "jekyll-comments"
            "theme_settings.page_navigation.enabled"   = "jekyll-paginate"
            "theme_settings.search.enabled"            = "jekyll-search"
        }
        
        if ($pluginMap.Contains($path)) {
            $targetPlugin = $pluginMap[$path]
            $plugins = $config["plugins"]
            if ($null -eq $plugins) {
                $plugins = [System.Collections.Generic.List[System.Object]]::new()
                $config["plugins"] = $plugins
            }
            
            if ($newVal) {
                # Add plugin if not present
                if (-not $plugins.Contains($targetPlugin)) {
                    $plugins.Add($targetPlugin)
                    Write-RvLog -Level "suc" -Message "Added plugin dependency: $targetPlugin" -Context "toggle"
                }
            } else {
                # Remove plugin if present
                if ($plugins.Contains($targetPlugin)) {
                    $plugins.Remove($targetPlugin) | Out-Null
                    Write-RvLog -Level "suc" -Message "Removed plugin dependency: $targetPlugin" -Context "toggle"
                }
            }
        }
        
        # Write config back
        $newYaml = (ConvertTo-AuspexYaml -Config $config) -join "`n"
        [System.IO.File]::WriteAllText($configPath, $newYaml)
        
        $statusStr = if ($newVal) { "ENABLED" } else { "DISABLED" }
        Write-RvLog -Level "suc" -Message "Feature '$name' has been $statusStr ($path)." -Context "toggle"
        return
    }

    Write-RvLog -Level "fail" -Message "Unknown toggle subcommand '$subcommand'. Use: list | enable | disable | toggle" -Context "toggle"
}
