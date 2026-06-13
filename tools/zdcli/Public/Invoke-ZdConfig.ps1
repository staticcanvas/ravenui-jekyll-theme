# Zero-Dark CLI - Interactive Config Wizard

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-ZdConfig {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
    if (-not [System.IO.File]::Exists($configPath)) {
        Write-ZdLog -Level "fail" -Message "_config.yml not found at $WorkspaceRoot. Cannot configure." -Context "config"
        return
    }

    Write-ZdLog -Level "act" -Message "Loading _config.yml..." -Context "config"

    while ($true) {
        $content = [System.IO.File]::ReadAllText($configPath)

        # Extract current settings
        $title = if ($content -match '(?im)^title\s*:\s*["'']?(.*?)["'']?\s*$') { $Matches[1] } else { "Unknown" }
        $logoText = if ($content -match '(?im)^logo_text\s*:\s*["'']?(.*?)["'']?\s*$') { $Matches[1] } else { "Unknown" }
        $logoSubtext = if ($content -match '(?im)^logo_subtext\s*:\s*["'']?(.*?)["'']?\s*$') { $Matches[1] } else { "Unknown" }
        $accent = if ($content -match '(?im)^zd_accent_color\s*:\s*["'']?(.*?)["'']?\s*$') { $Matches[1] } else { "Unknown" }
        $spacing = if ($content -match '(?im)^zd_nav_spacing\s*:\s*["'']?(.*?)["'']?\s*$') { $Matches[1] } else { "Unknown" }

        # TUI Menu Content
        $menuLines = @(
            " {ct:accent:b:Zero-Dark Configuration Wizard}",
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
        Write-ZdBox -Title "Interactive Setup Wizard" -Lines $menuLines -BorderColor "accent"
        Write-Host ""
        Write-Host "Select an option to edit: " -NoNewline
        Write-Host " > " -ForegroundColor Gray -NoNewline
        
        $choice = [Console]::ReadLine().Trim().ToUpper()
        if ($choice -eq "Q" -or [string]::IsNullOrEmpty($choice)) {
            Write-ZdLog -Level "suc" -Message "Configuration saved." -Context "config"
            break
        }

        switch ($choice) {
            "1" {
                Write-Host "Enter new Site Title: " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                $content = Update-ConfigRegex -Content $content -Key "title" -Value $newVal
            }
            "2" {
                Write-Host "Enter new Logo Text: " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                $content = Update-ConfigRegex -Content $content -Key "logo_text" -Value $newVal
            }
            "3" {
                Write-Host "Enter new Logo Subtext: " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                $content = Update-ConfigRegex -Content $content -Key "logo_subtext" -Value $newVal
            }
            "4" {
                Write-Host "Enter new Accent Color Code (e.g. #00ff9d): " -NoNewline
                $newVal = [Console]::ReadLine().Trim()
                if ($newVal -match '^#?[0-9a-f]{6}$') {
                    if (-not $newVal.StartsWith("#")) { $newVal = "#$newVal" }
                    $content = Update-ConfigRegex -Content $content -Key "zd_accent_color" -Value $newVal
                } else {
                    Write-ZdLog -Level "fail" -Message "Invalid Hex Color code format." -Context "config"
                    Start-Sleep -Seconds 2
                }
            }
            "5" {
                Write-Host "Select Spacing (compact, tight, comfy, spacy): " -NoNewline
                $newVal = [Console]::ReadLine().Trim().ToLower()
                if ($newVal -in @('compact', 'tight', 'comfy', 'spacy')) {
                    $content = Update-ConfigRegex -Content $content -Key "zd_nav_spacing" -Value $newVal
                } else {
                    Write-ZdLog -Level "fail" -Message "Invalid spacing preset." -Context "config"
                    Start-Sleep -Seconds 2
                }
            }
            default {
                Write-ZdLog -Level "wrn" -Message "Invalid selection. Please try again." -Context "config"
                Start-Sleep -Seconds 1
            }
        }

        # Write updated content to disk
        try {
            [System.IO.File]::WriteAllText($configPath, $content)
        } catch {
            Write-ZdLog -Level "fail" -Message "Failed to write changes to _config.yml: $_" -Context "config"
            Start-Sleep -Seconds 2
        }
    }
}

function Update-ConfigRegex {
    param(
        [string]$Content,
        [string]$Key,
        [string]$Value
    )

    $pattern = "(?im)^($Key\s*:\s*)(.*)$"
    if ($Content -match $pattern) {
        $oldVal = $Matches[2].Trim()
        
        # Keep quotes if present
        if ($oldVal -match '^"(.*)"$') {
            $replacement = "`$1`"$Value`""
        } elseif ($oldVal -match "^'(.*)'$") {
            $replacement = "`$1'$Value'"
        } else {
            $replacement = "`$1$Value"
        }
        return [regex]::Replace($Content, $pattern, $replacement)
    } else {
        # Append to end of file if not found
        return $Content + "`n${Key}: `"$Value`""
    }
}
