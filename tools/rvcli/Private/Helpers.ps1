# RavenUI CLI - Core Helpers

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Structured CLI Logging
function Write-RvLog {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('inf', 'wrn', 'err', 'suc', 'act', 'fail')]
        [string]$Level,
        
        [Parameter(Mandatory)]
        [string]$Message,
        
        [string]$Context = ""
    )

    process {
        $levelConfig = @{
            inf  = @{ Label = ' INF '; FG = 'cyan'; BG = '38;5;23' }
            wrn  = @{ Label = ' WRN '; FG = 'yellow'; BG = '38;5;94' }
            err  = @{ Label = ' ERR '; FG = 'red'; BG = '38;5;88' }
            suc  = @{ Label = ' SUC '; FG = 'green'; BG = '38;5;22' }
            act  = @{ Label = ' ACT '; FG = 'magenta'; BG = '38;5;53' }
            fail = @{ Label = 'FAIL '; FG = 'white'; BG = '38;5;88' }
        }

        $cfg = $levelConfig[$Level]
        $palette = Get-RvPalette
        $esc = [char]27
        
        # Color codes from palette
        $fgAnsi = $palette[$cfg.FG]
        $bgAnsi = $cfg.BG
        
        # Assemble log prefix
        $titleStr = "$esc[1;30mRV$esc[0m $esc[90m>$esc[0m "
        $badgeStr = "$esc[${bgAnsi};37;1m$($cfg.Label)$esc[0m "
        
        $contextStr = ""
        if ($Context) {
            $contextStr = "$esc[90m[$Context]$esc[0m "
        }
        
        # Final message with level color
        $msgStr = "$esc[${fgAnsi}m${Message}$esc[0m"
        
        Write-Host "$titleStr$badgeStr$contextStr$msgStr"
    }
}

# Check TCP listeners using cross-platform .NET classes
function Test-RvPort {
    param(
        [int]$Port
    )
    try {
        $properties = [System.Net.NetworkInformation.IPGlobalProperties]::GetIPGlobalProperties()
        $listeners = $properties.GetActiveTcpListeners()
        foreach ($l in $listeners) {
            if ($l.Port -eq $Port) {
                return $false # In use
            }
        }
        return $true # Free
    } catch {
        # Fallback to TcpListener binding test if permissions allow
        try {
            $listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Any, $Port)
            $listener.Start()
            $listener.Stop()
            return $true
        } catch {
            return $false
        }
    }
}

# Search and resolve port collisions
function Find-RvFreePort {
    param(
        [int]$StartPort = 4000
    )
    $port = $StartPort
    while (-not (Test-RvPort $port)) {
        $port++
    }
    return $port
}

# TUI Box Generator (respects the padding rule by calculating length pre-ANSI)
function Write-RvBox {
    param(
        [string]$Title = "",
        [string[]]$Lines = @(),
        [string]$BorderColor = "muted",
        [int]$Width = 70
    )
    
    $ui = Get-RvUI
    
    # Construct formatting codes
    $cBorder = "{ct:${BorderColor}:}"
    $cTitle = "{ct:header:b:}"
    $cReset = "{ct:default:}"
    
    # Top Border
    $titleLen = Get-RvTextLength $Title
    if ($titleLen -gt 0) {
        $leftDashCount = 3
        $rightDashCount = $Width - $titleLen - 6 - $leftDashCount
        if ($rightDashCount -lt 0) { $rightDashCount = 0 }
        
        $leftDash = $ui.Horizontal * $leftDashCount
        $rightDash = $ui.Horizontal * $rightDashCount
        $topStr = "$cBorder$($ui.TopLeft)$leftDash$cReset$cTitle $Title $cReset$cBorder$rightDash$($ui.TopRight)$cReset"
        Write-Host (New-CTString $topStr)
    } else {
        $topStr = "$cBorder$($ui.TopLeft)$($ui.Horizontal * ($Width - 2))$($ui.TopRight)$cReset"
        Write-Host (New-CTString $topStr)
    }
    
    # Body Lines
    foreach ($line in $Lines) {
        $lineLen = Get-RvTextLength $line
        $padCount = $Width - $lineLen - 4 # account for borders and spacing
        if ($padCount -lt 0) { $padCount = 0 }
        $pad = " " * $padCount
        
        $boxLine = "$cBorder$($ui.Vertical)$cReset $line$pad $cBorder$($ui.Vertical)$cReset"
        Write-Host (New-CTString $boxLine)
    }
    
    # Bottom Border
    $bottomStr = "$cBorder$($ui.BottomLeft)$($ui.Horizontal * ($Width - 2))$($ui.BottomRight)$cReset"
    Write-Host (New-CTString $bottomStr)
}

# Internal helper: run a git command, capture and return stdout.
# Used by Invoke-RvGitTags and Invoke-RvReleases.
function Invoke-RvGitCmd {
    param(
        [string[]]$Arguments,
        [string]$WorkspaceRoot
    )

    $psi = [System.Diagnostics.ProcessStartInfo]::new()
    $psi.FileName               = 'git'
    $psi.WorkingDirectory       = $WorkspaceRoot
    $psi.UseShellExecute        = $false
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError  = $true

    foreach ($a in $Arguments) {
        $psi.ArgumentList.Add($a)
    }

    $proc = [System.Diagnostics.Process]::new()
    $proc.StartInfo = $psi
    $proc.Start() | Out-Null

    $stdout = $proc.StandardOutput.ReadToEnd()
    $proc.WaitForExit()

    return $stdout
}
