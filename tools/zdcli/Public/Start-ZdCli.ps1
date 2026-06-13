# Zero-Dark CLI - Main Entry Point

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Start-ZdCli {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromRemainingArguments)]
        [string[]]$RawArgs
    )

    # Initialize dynamic theme variables
    $workspaceRoot = $PSScriptRoot
    # Traverse up to find root of repo
    while ($workspaceRoot -and -not [System.IO.File]::Exists([System.IO.Path]::Combine($workspaceRoot, "_config.yml"))) {
        $parent = [System.IO.Path]::GetDirectoryName($workspaceRoot)
        if ($parent -eq $workspaceRoot -or [string]::IsNullOrEmpty($parent)) { break }
        $workspaceRoot = $parent
    }
    if (-not $workspaceRoot) { $workspaceRoot = "." }
    Initialize-ZdTheme -WorkspaceRoot $workspaceRoot

    # Parse parameters
    $devMode = $false
    $command = $null
    $cmdArgs = [System.Collections.Generic.List[string]]::new()

    for ($i = 0; $i -lt $RawArgs.Count; $i++) {
        $arg = $RawArgs[$i]
        if ($arg -eq "-d" -or $arg -eq "--developer") {
            $devMode = $true
        } elseif (-not $command) {
            # Translate flags to commands where possible
            if ($arg -eq "-s" -or $arg -eq "--dev") {
                $command = "dev"
            } elseif ($arg -eq "-c" -or $arg -eq "--config") {
                $command = "config"
            } elseif ($arg -eq "-a" -or $arg -eq "--artisan") {
                $command = "artisan"
            } elseif ($arg -eq "-h" -or $arg -eq "--help" -or $arg -eq "help") {
                $command = "help"
            } else {
                $command = $arg.ToLower()
            }
        } else {
            $cmdArgs.Add($arg)
        }
    }

    if ($devMode) {
        $global:ZdDeveloperMode = $true
        Write-ZdLog -Level "act" -Message "Developer mode active - targeting local theme repository root" -Context "zdcli"
    } else {
        $global:ZdDeveloperMode = $false
    }

    if (-not $command -or $command -eq "help") {
        Show-ZdHelp
        return
    }

    # Command Router
    switch ($command) {
        "init" {
            Invoke-ZdBootstrap -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "dev" {
            Invoke-ZdDev -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "serve" {
            Invoke-ZdDev -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "config" {
            Invoke-ZdConfig -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "artisan" {
            Invoke-ZdArtisan -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "lint" {
            Invoke-ZdLinter -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "check" {
            Invoke-ZdLinter -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "doctor" {
            Invoke-ZdDoctor -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "metadata" {
            Invoke-ZdMetadata -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "search-index" {
            Invoke-ZdSearchIndex -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "variant" {
            Invoke-ZdVariant -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "variants" {
            Invoke-ZdVariant -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        default {
            Write-ZdLog -Level "fail" -Message "Unknown command '$command'. Run 'zdcli --help' for details." -Context "router"
        }
    }
}

function Show-ZdHelp {
    $esc = [char]27
    $palette = Get-ZdPalette
    $cAcc = "$esc[$($palette.Accent)m"
    $cMut = "$esc[$($palette.Muted)m"
    $cPri = "$esc[$($palette.Primary)m"
    $cRst = "$esc[0m"

    # Print ASCII Logo
    Write-Host "$cAcc"
    Write-Host ' ███████╗███████╗██████╗  ██████╗     ██████╗  █████╗ ██████╗ ██╗  ██╗'
    Write-Host ' ╚══███╔╝██╔════╝██╔══██╗██╔═══██╗    ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝'
    Write-Host '   ███╔╝ █████╗  ██████╔╝██║   ██║    ██║  ██║███████║██████╔╝█████╔╝ '
    Write-Host '  ███╔╝  ██╔══╝  ██╔══██╗██║   ██║    ██║  ██║██╔══██║██╔══██╗██╔═██╗ '
    Write-Host ' ███████╗███████╗██║  ██║╚██████╔╝    ██████╔╝██║  ██║██║  ██║██║  ██╗'
    Write-Host ' ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝     ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝'
    Write-Host "                             $cMut// Zero-Dark CLI & TUI Companion$cRst"
    Write-Host ""

    $helpLines = @(
        "{ct:header:b:NAME}",
        "    {ct:accent:zdcli} - Dynamic developer companion and workspace manager for Zero-Dark.",
        "",
        "{ct:header:b:USAGE}",
        "    {ct:primary:zdcli} <command> [options]",
        "",
        "{ct:header:b:COMMANDS}",
        "    {ct:accent:init}         Bootstrap a new documentation site using the Zero-Dark Starter Template.",
        "    {ct:accent:dev, serve}   Start a local development server with port collision check & hot reloading.",
        "    {ct:accent:config}       Configure _config.yml properties interactively.",
        "    {ct:accent:artisan}      Scaffold a new layout, include component, or markdown document template.",
        "    {ct:accent:lint, check}  Audit component directories and validate markdown bold headings styling.",
        "    {ct:accent:doctor}       Diagnose environment dependencies (Ruby, Node, Pagefind, Jekyll).",
        "    {ct:accent:metadata}     Generate a hierarchical visual dependency tree from component comments.",
        "    {ct:accent:search-index} Compile Pagefind / Lyra indices using a single command.",
        "    {ct:accent:variant}      Automate packaging of site distributions (e.g. Minimalist layout).",
        "",
        "{ct:header:b:OPTIONS}",
        "    {ct:primary:-d, --developer}  Enable developer mode targeting theme repo root (instead of site starter).",
        "    {ct:primary:-h, --help}       Render this man-page style help information."
    )

    foreach ($line in $helpLines) {
        Write-Host (New-CTString $line)
    }
}
