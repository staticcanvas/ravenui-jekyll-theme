# RavenUI CLI - Main Entry Point

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Start-RvCli {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromRemainingArguments)]
        [string[]]$RawArgs
    )

    # Initialize dynamic theme variables
    $workspaceRoot = [System.IO.Directory]::GetCurrentDirectory()
    # Traverse up to find root of repo
    while ($workspaceRoot -and -not [System.IO.File]::Exists([System.IO.Path]::Combine($workspaceRoot, "_config.yml"))) {
        $parent = [System.IO.Path]::GetDirectoryName($workspaceRoot)
        if ($parent -eq $workspaceRoot -or [string]::IsNullOrEmpty($parent)) { break }
        $workspaceRoot = $parent
    }
    if (-not $workspaceRoot) { $workspaceRoot = "." }
    Initialize-RvTheme -WorkspaceRoot $workspaceRoot

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
        $global:RvDeveloperMode = $true
        Write-RvLog -Level "act" -Message "Developer mode active - targeting local theme repository root" -Context "rvcli"
    } else {
        $global:RvDeveloperMode = $false
    }

    # Intercept Command Help requests
    if ($command -eq "help" -and $cmdArgs.Count -gt 0) {
        Show-RvCommandHelp -Command $cmdArgs[0]
        return
    } elseif ($command -and ($cmdArgs -contains "-h" -or $cmdArgs -contains "--help")) {
        Show-RvCommandHelp -Command $command
        return
    }

    if (-not $command -or $command -eq "help") {
        Show-RvHelp
        return
    }

    # Command Router
    switch ($command) {
        "init" {
            Invoke-RvBootstrap -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "dev" {
            Invoke-RvDev -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "serve" {
            Invoke-RvDev -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "config" {
            Invoke-RvConfig -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "artisan" {
            Invoke-RvArtisan -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "lint" {
            Invoke-RvLinter -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "check" {
            Invoke-RvLinter -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "doctor" {
            Invoke-RvDoctor -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "metadata" {
            Invoke-RvMetadata -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "search-index" {
            Invoke-RvSearchIndex -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "variant" {
            Invoke-RvVariant -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "variants" {
            Invoke-RvVariant -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "minify" {
            Invoke-RvMinify -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "git-tags" {
            Invoke-RvGitTags -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "releases" {
            Invoke-RvReleases -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        { $_ -eq 'version' -or $_ -eq 'ver' } {
            Invoke-RvVersion -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "theme" {
            Invoke-RvMultiTheme -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "themes" {
            Invoke-RvMultiTheme -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "toggle" {
            Invoke-RvFeatureToggle -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "toggles" {
            Invoke-RvFeatureToggle -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "permalink" {
            Invoke-RvPermalinkPreview -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        "permalink-preview" {
            Invoke-RvPermalinkPreview -Args $cmdArgs -WorkspaceRoot $workspaceRoot
        }
        default {
            Write-RvLog -Level "fail" -Message "Unknown command '$command'. Run 'rvcli --help' for details." -Context "router"
        }
    }
}

function Show-RvHelp {
    $esc = [char]27
    $palette = Get-RvPalette
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
    Write-Host "                             $cMut// RavenUI CLI & TUI Companion$cRst"
    Write-Host ""

    $helpLines = @(
        "{ct:header:b:NAME}",
        "    {ct:accent:rvcli} - Dynamic developer companion and workspace manager for RavenUI.",
        "",
        "{ct:header:b:USAGE}",
        "    {ct:primary:rvcli} <command> [options]",
        "",
        "{ct:header:b:COMMANDS}",
        "    {ct:accent:init}         Bootstrap a new documentation site using the RavenUI Starter Template.",
        "    {ct:accent:dev, serve}   Start a local development server with port collision check & hot reloading.",
        "    {ct:accent:config}       Configure _config.yml properties interactively.",
        "    {ct:accent:artisan}      Scaffold a new layout, include component, or markdown document template.",
        "    {ct:accent:lint, check}  Audit component directories and validate markdown bold headings styling.",
        "    {ct:accent:doctor}       Diagnose environment dependencies (Ruby, Node, Pagefind, Jekyll).",
        "    {ct:accent:metadata}     Generate a hierarchical visual dependency tree from component comments.",
        "    {ct:accent:search-index} Compile Pagefind / Lyra indices using a single command.",
        "    {ct:accent:variant}      Automate packaging of site distributions (e.g. Minimalist layout).",
        "    {ct:accent:minify}       Minify HTML, CSS, and JS in a compiled site directory.",
        "    {ct:accent:theme}        Manage custom theme variants: list, show, or pack.",
        "    {ct:accent:toggle}       Manage global feature switches and dynamic plugin dependencies.",
        "    {ct:accent:permalink}    Preview the compiled output URL and front-matter of a file.",
        "",
        "{ct:header:b:DATA & VERSIONING}",
        "    {ct:accent:git-tags}     Generate _data/git-tags.yml from sorted git tag history.",
        "    {ct:accent:releases}     Generate / append a _data/releases.yml entry from commit log.",
        "    {ct:accent:version, ver} Read, set, bump (major/minor/patch), or sync the site version.",
        "",
        "{ct:header:b:OPTIONS}",
        "    {ct:primary:-d, --developer}  Enable developer mode targeting theme repo root (instead of site starter).",
        "    {ct:primary:-h, --help}       Render this man-page style help information."
    )

    foreach ($line in $helpLines) {
        Write-Host (New-CTString $line)
    }
}
