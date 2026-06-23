# RavenUI CLI - Show-RvThemeMetadata Cmdlet
# Renders detailed metadata about a custom theme.
# [Compliance: file-per-cmdlet | Write-RvLog | Write-RvBox]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Show-RvThemeMetadata {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Name,
        [string]$WorkspaceRoot = "."
    )

    $themes = Get-RvTheme -Name $Name -WorkspaceRoot $WorkspaceRoot
    if ($themes.Count -eq 0) {
        Write-RvLog -Level "fail" -Message "Theme matching '$Name' not found under '_ravenui-themes/'." -Context "metadata"
        return
    }

    $t = $themes[0]
    $lines = @(
        "Theme Key   : {ct:accent:$($t.Name)}",
        "Name        : $($t.DisplayName)",
        "Version     : $($t.Version)",
        "Author      : $($t.Author)",
        "Path        : $($t.Path)",
        "Description :",
        "  $($t.Description)"
    )

    Write-RvBox -Title "Theme Variant: $($t.DisplayName)" -Lines $lines -BorderColor "accent"
}
