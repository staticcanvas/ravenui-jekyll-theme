# RavenUI CLI - UI and Theme Engine

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Define standard and fallback palette colors
$script:Palette = @{
    Primary   = '38;5;39'     # Bright cyan/blue
    Accent    = '38;5;51'     # Fallback Accent (Cyan)
    Success   = '38;5;76'     # Green
    Warning   = '38;5;214'    # Orange
    Critical  = '38;5;196'    # Red
    Muted     = '38;5;244'    # Slate Gray
    Header    = '38;5;255;1'  # Bold White
    Reset     = '0'
}

# Dynamic Accent Loader from _config.yml
function Initialize-RvTheme {
    param(
        [string]$WorkspaceRoot = "."
    )
    
    $configPath = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
    if ([System.IO.File]::Exists($configPath)) {
        try {
            $content = [System.IO.File]::ReadAllText($configPath)
            # Find rd_accent_color: "#00ff9d" or rd_accent_color: #00ff9d
            if ($content -match '(?i)rd_accent_color\s*:\s*["'']?#?([0-9a-f]{6})["'']?') {
                $hex = $Matches[1]
                $r = [System.Convert]::ToInt32($hex.Substring(0, 2), 16)
                $g = [System.Convert]::ToInt32($hex.Substring(2, 2), 16)
                $b = [System.Convert]::ToInt32($hex.Substring(4, 2), 16)
                
                # TrueColor ANSI Foreground sequence
                $script:Palette['Accent'] = "38;2;$r;$g;$b"
            }
        } catch {
            # Fallback to default Accent
            $script:Palette['Accent'] = '38;5;51'
        }
    }
}

# ASCII/Unicode border elements
$script:UIElements = @{
    TopLeft      = '┌'
    TopRight     = '┐'
    BottomLeft   = '└'
    BottomRight  = '┘'
    Horizontal   = '─'
    Vertical     = '│'
    SeparatorL   = '├'
    SeparatorR   = '┤'
    Bullet       = '🔹'
    Success      = '🟩'
    Error        = '🟥'
    Warning      = '🟧'
    Info         = '🟦'
}

function Get-RvPalette {
    return $script:Palette
}

function Get-RvUI {
    return $script:UIElements
}

# Removes color tags and ANSI escape sequences to measure raw visible text length
function Get-RvTextLength {
    param([string]$Text)
    if ([string]::IsNullOrEmpty($Text)) { return 0 }
    
    # 1. Recursively replace {ct:color:flags:string} or {ct:color:string} with just 'string'
    $pattern = '(?i)\{ct:(?:[^:{}]+)(?::(?:[ubi](?::[ubi])*))?:(?<String>[^{}]*?)\}'
    $clean = $Text
    while ($clean -match $pattern) {
        $clean = [regex]::Replace($clean, $pattern, '${String}')
    }

    # 2. Strip raw ANSI escape sequences (e.g. \e[38;5;39m, \e[0m)
    $esc = [char]27
    $clean = $clean -replace "$([regex]::Escape($esc))\[[0-9;]*[a-zA-Z]", ""

    return $clean.Length
}

# Formats color codes like {ct:accent:b:text} into ANSI escape sequences
function New-CTString {
    [CmdletBinding()]
    [Alias('ctstr', 'ctstring')]
    param(
        [Parameter(Position = 0)]
        [AllowEmptyString()]
        [string]$String = ""
    )

    process {
        if ([string]::IsNullOrEmpty($String)) { return '' }

        $stdColors = @{
            'black'        = '30'
            'white'        = '37'
            'gray'         = '90'
            'lightgray'    = '37'
            'red'          = '31'
            'lightred'     = '91'
            'green'        = '32'
            'lightgreen'   = '92'
            'yellow'       = '33'
            'lightyellow'  = '93'
            'blue'         = '34'
            'lightblue'    = '94'
            'magenta'      = '35'
            'lightmagenta' = '95'
            'cyan'         = '36'
            'lightcyan'    = '96'
            'default'      = '39'
        }

        # Regex to match: {ct:color:flags:string} or {ct:color:string}
        $pattern = '(?i)\{ct:(?<Color>[^:{}]+)(?::(?<Flags>[ubi](?::[ubi])*))?:(?<String>[^{}]*?)\}'
        $finalString = $String
        $ESC = [char]27

        # Keep matching until all tags are replaced
        while ($true) {
            $allMatches = [regex]::Matches($finalString, $pattern)
            if ($allMatches.Count -eq 0) { break }

            # Process right-to-left to prevent index shifting
            for ($i = $allMatches.Count - 1; $i -ge 0; $i--) {
                $match = $allMatches[$i]
                $rawColor = $match.Groups['Color'].Value.ToLower()
                $content = $match.Groups['String'].Value
                $flagsStr = $match.Groups['Flags'].Value

                $codes = [System.Collections.Generic.List[string]]::new()

                # A. Handle Flags
                if ($flagsStr -match 'b') { $codes.Add('1') }
                if ($flagsStr -match 'i') { $codes.Add('3') }
                if ($flagsStr -match 'u') { $codes.Add('4') }

                # B. Handle Color
                if ($script:Palette.ContainsKey($rawColor)) {
                    $codes.Add($script:Palette[$rawColor])
                }
                elseif ($rawColor -match '^\d+$') {
                    $codes.Add("38;5;$rawColor")
                }
                elseif ($stdColors.ContainsKey($rawColor)) {
                    $codes.Add($stdColors[$rawColor])
                }
                else {
                    $codes.Add('39') # Default foreground
                }

                $ansiSequence = "$ESC[" + ($codes -join ';') + "m"
                $replacement = "$ansiSequence$content$ESC[0m"

                $finalString = $finalString.Remove($match.Index, $match.Length).Insert($match.Index, $replacement)
            }
        }

        return $finalString
    }
}

# Repair-Terminal Panic Button
function Repair-Terminal {
    [CmdletBinding()]
    param()
    process {
        Write-Host "$([char]27)[0m" -NoNewline
        [Console]::ResetColor()
        Write-Host "Terminal state repaired." -ForegroundColor Gray
    }
}
