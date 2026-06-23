# RavenUI CLI - Interactive Config Wizard
# Uses the Auspex configuration parser to read, query, set, toggle, and save YAML configurations.
# [Compliance: file-per-cmdlet | Write-RvLog | UI Box | Auspex integration]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvConfig {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
    if (-not [System.IO.File]::Exists($configPath)) {
        Write-RvLog -Level "fail" -Message "_config.yml not found at $WorkspaceRoot. Cannot configure." -Context "config"
        return
    }

    # Non-interactive CLI subcommand routing using Auspex traversal
    if ($Args.Count -gt 0) {
        $subcommand = $Args[0].ToLower()
        if ($subcommand -eq "get") {
            if ($Args.Count -lt 2) {
                Write-RvLog -Level "fail" -Message "Usage: ./rvcli config get <path.to.key>" -Context "config"
                return
            }
            $path = $Args[1]
            $yamlText = [System.IO.File]::ReadAllText($configPath)
            $config = ConvertFrom-AuspexYaml -YamlText $yamlText
            $val = Get-AuspexConfig -Config $config -Path $path
            if ($null -eq $val) {
                Write-RvLog -Level "wrn" -Message "Key '$path' not found or is null." -Context "config"
            } else {
                # Format output values cleanly
                if ($val -is [bool]) {
                    Write-Host ($(if ($val) { "true" } else { "false" }))
                } elseif ($val -is [System.Collections.IDictionary]) {
                    (ConvertTo-AuspexYaml -Config $val) -join "`n" | Write-Host
                } elseif ($val -is [System.Collections.IList]) {
                    $val -join ", " | Write-Host
                } else {
                    Write-Host "$val"
                }
            }
            return
        }
        
        if ($subcommand -eq "set" -or $subcommand -eq "toggle") {
            if ($subcommand -eq "set" -and $Args.Count -lt 3) {
                Write-RvLog -Level "fail" -Message "Usage: ./rvcli config set <path.to.key> <value>" -Context "config"
                return
            }
            if ($subcommand -eq "toggle" -and $Args.Count -lt 2) {
                Write-RvLog -Level "fail" -Message "Usage: ./rvcli config toggle <path.to.key>" -Context "config"
                return
            }
            
            $path = $Args[1]
            $yamlText = [System.IO.File]::ReadAllText($configPath)
            $config = ConvertFrom-AuspexYaml -YamlText $yamlText
            
            if ($subcommand -eq "toggle") {
                $curr = Get-AuspexConfig -Config $config -Path $path
                if ($curr -is [bool]) {
                    $newVal = -not $curr
                } else {
                    $newVal = if ($curr -eq $true) { $false } else { $true }
                }
                Set-AuspexConfig -Config $config -Path $path -Value $newVal
                Write-RvLog -Level "suc" -Message "Toggled '$path' to $newVal." -Context "config"
            } else {
                $newVal = $Args[2]
                if ($newVal -eq "true") { $newVal = $true }
                elseif ($newVal -eq "false") { $newVal = $false }
                
                Set-AuspexConfig -Config $config -Path $path -Value $newVal
                Write-RvLog -Level "suc" -Message "Set '$path' to '$newVal'." -Context "config"
            }
            
            $newYaml = (ConvertTo-AuspexYaml -Config $config) -join "`n"
            [System.IO.File]::WriteAllText($configPath, $newYaml)
            return
        }
        
        Write-RvLog -Level "fail" -Message "Unknown config subcommand '$subcommand'. Use: get | set | toggle" -Context "config"
        return
    }

    # Interactive Wizard Mode
    Write-RvLog -Level "act" -Message "Loading _config.yml..." -Context "config"

    while ($true) {
        $content = [System.IO.File]::ReadAllText($configPath)
        $config = ConvertFrom-AuspexYaml -YamlText $content

        # Extract current settings
        $title = Get-AuspexConfig -Config $config -Path "title"
        if ($null -eq $title) { $title = "Unknown" }
        
        $logoText = Get-AuspexConfig -Config $config -Path "logo_text"
        if ($null -eq $logoText) { $logoText = "Unknown" }
        
        $logoSubtext = Get-AuspexConfig -Config $config -Path "logo_subtext"
        if ($null -eq $logoSubtext) { $logoSubtext = "Unknown" }
        
        $accent = Get-AuspexConfig -Config $config -Path "rd_accent_color"
        if ($null -eq $accent) { $accent = "Unknown" }
        
        $spacing = Get-AuspexConfig -Config $config -Path "rd_nav_spacing"
        if ($null -eq $spacing) { $spacing = "Unknown" }

        # TUI Menu Content
        $menuLines = @(
            " {ct:accent:b:RavenUI Configuration Wizard}",
            " Configure primary settings for your Jekyll site.",
            "",
            " [1] Site Title        : {ct:white:$title}",
            " [2] Logo Text        : {ct:white:$logoText}",
            " [3] Logo Subtext     : {ct:white:$logoSubtext}",
            " [4] Accent Color Code : {ct:white:$accent}",
            " [5] Navigation Spacing: {ct:white:$spacing}",
            "",
            " [Q] Save and Exit Wizard"
        )

        Write-Host ""
        Write-RvBox -Title "Interactive Setup Wizard" -Lines $menuLines -BorderColor "accent"
        Write-Host ""
        Write-Host "Select an option to edit: " -NoNewline
        Write-Host " > " -ForegroundColor Gray -NoNewline
        
        $choice = [Console]::ReadLine().Trim().ToUpper()
        if ($choice -eq "Q" -or [string]::IsNullOrEmpty($choice)) {
            Write-RvLog -Level "suc" -Message "Configuration saved." -Context "config"
            break
        }

        $modified = $true
        switch ($choice) {
            "1" {
                Write-Host "Enter new Site Title: " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                Set-AuspexConfig -Config $config -Path "title" -Value $newVal
            }
            "2" {
                Write-Host "Enter new Logo Text: " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                Set-AuspexConfig -Config $config -Path "logo_text" -Value $newVal
            }
            "3" {
                Write-Host "Enter new Logo Subtext: " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                Set-AuspexConfig -Config $config -Path "logo_subtext" -Value $newVal
            }
            "4" {
                Write-Host "Enter new Accent Color Code (e.g. #00ff9d): " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                if ($newVal -match '^#?[0-9a-f]{6}$') {
                    if (-not $newVal.StartsWith("#")) { $newVal = "#$newVal" }
                    Set-AuspexConfig -Config $config -Path "rd_accent_color" -Value $newVal
                } else {
                    Write-RvLog -Level "fail" -Message "Invalid Hex Color code format." -Context "config"
                    $modified = $false
                    Start-Sleep -Seconds 2
                }
            }
            "5" {
                Write-Host "Select Spacing (compact, tight, comfy, spacy): " -NoNewline
                $newVal = [Console]::ReadLine().Trim().ToLower()
                if ($newVal -in @('compact', 'tight', 'comfy', 'spacy')) {
                    Set-AuspexConfig -Config $config -Path "rd_nav_spacing" -Value $newVal
                } else {
                    Write-RvLog -Level "fail" -Message "Invalid spacing preset." -Context "config"
                    $modified = $false
                    Start-Sleep -Seconds 2
                }
            }
            default {
                Write-RvLog -Level "wrn" -Message "Invalid selection. Please try again." -Context "config"
                $modified = $false
                Start-Sleep -Seconds 1
            }
        }

        # Write updated content to disk if modified
        if ($modified) {
            try {
                $newYaml = (ConvertTo-AuspexYaml -Config $config) -join "`n"
                [System.IO.File]::WriteAllText($configPath, $newYaml)
            } catch {
                Write-RvLog -Level "fail" -Message "Failed to write changes to _config.yml: $_" -Context "config"
                Start-Sleep -Seconds 2
            }
        }
    }
}
