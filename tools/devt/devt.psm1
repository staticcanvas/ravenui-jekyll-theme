# RavenUI Task Tracker Module - Root Loader

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Load Private Helpers
$privateDir = [System.IO.Path]::Combine($PSScriptRoot, "Private")
if ([System.IO.Directory]::Exists($privateDir)) {
    $privateFiles = [System.IO.Directory]::GetFiles($privateDir, "*.ps1", [System.IO.SearchOption]::AllDirectories)
    foreach ($file in $privateFiles) {
        . $file
    }
}

# Load Public Cmdlets
$publicDir = [System.IO.Path]::Combine($PSScriptRoot, "Public")
if ([System.IO.Directory]::Exists($publicDir)) {
    $publicFiles = [System.IO.Directory]::GetFiles($publicDir, "*.ps1", [System.IO.SearchOption]::AllDirectories)
    foreach ($file in $publicFiles) {
        . $file
    }
}

# Define and Export Public Functions and Aliases
Set-Alias -Name devt -Value Invoke-Devt -Description "RavenUI Task Tracker CMD shortcut"

if ($publicFiles) {
    $publicFunctions = foreach ($f in $publicFiles) {
        [System.IO.Path]::GetFileNameWithoutExtension($f)
    }
    Export-ModuleMember -Function $publicFunctions -Alias devt
}
