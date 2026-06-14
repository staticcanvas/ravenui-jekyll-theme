# RavenUI CLI - Command Help Generator
# [Compliance: UI Object & Palette Object via Get-RvPalette and Get-RvUI]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Show-RvCommandHelp {
    param(
        [Parameter(Mandatory)]
        [string]$Command
    )

    $ui = Get-RvUI
    $palette = Get-RvPalette
    $esc = [char]27
    $cAcc = "$esc[$($palette.Accent)m"
    $cMut = "$esc[$($palette.Muted)m"
    $cPri = "$esc[$($palette.Primary)m"
    $cRst = "$esc[0m"

    $lines = [System.Collections.Generic.List[string]]::new()

    switch ($Command) {
        "init" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Bootstrap a new documentation site using the RavenUI Starter Template.")
            $lines.Add("    Downloads the starter template structure or falls back to local scaffolding.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli init} [target-directory]")
            $lines.Add("")
            $lines.Add("{ct:header:b:ARGUMENTS}")
            $lines.Add("    {ct:primary:target-directory}  The folder to initialize. Defaults to current directory ('.').")
            $lines.Add("")
            $lines.Add("{ct:header:b:EXAMPLES}")
            $lines.Add("    {ct:primary:rvcli init}          Initialize RavenUI in the current directory.")
            $lines.Add("    {ct:primary:rvcli init my-docs}   Initialize RavenUI in a new folder named 'my-docs'.")
        }
        "dev" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Start a local watch and hot-reloading development server.")
            $lines.Add("    Checks for port collisions and serves the site with automatic build triggers.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli dev} [options]")
            $lines.Add("")
            $lines.Add("{ct:header:b:OPTIONS}")
            $lines.Add("    {ct:primary:-I, --incremental}  Enable incremental builds for faster regeneration.")
            $lines.Add("")
            $lines.Add("{ct:header:b:EXAMPLES}")
            $lines.Add("    {ct:primary:rvcli dev}           Start the dev server on port 4000 (or next free port).")
            $lines.Add("    {ct:primary:rvcli dev -I}        Start the dev server with incremental building enabled.")
        }
        "serve" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Alias for {ct:accent:dev} command. Starts the local watch / serve server.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli serve} [options]")
        }
        "config" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Launches an interactive wizard to configure _config.yml settings.")
            $lines.Add("    Allows visual adjustments to site metadata, layout options, and components.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli config}")
        }
        "artisan" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Scaffolds layout templates, include components, or documentation pages.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli artisan} <type> <name>")
            $lines.Add("")
            $lines.Add("{ct:header:b:TYPES}")
            $lines.Add("    {ct:primary:component}  Scaffolds a new include component in _includes/comps/")
            $lines.Add("    {ct:primary:page}       Scaffolds a new Markdown documentation page in docs/")
            $lines.Add("    {ct:primary:layout}     Scaffolds a new layout file in _layouts/")
            $lines.Add("")
            $lines.Add("{ct:header:b:EXAMPLES}")
            $lines.Add("    {ct:primary:rvcli artisan component progress-ring}")
            $lines.Add("    {ct:primary:rvcli artisan page advanced-usage}")
        }
        "lint" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Audit component directories, validation of header formatting, and syntax checking.")
            $lines.Add("    Ensures a 1:1 atomic mapping between component includes and docs.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli lint}")
        }
        "check" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Alias for {ct:accent:lint} command. Audits the workspace structure.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli check}")
        }
        "doctor" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Diagnose system environment dependencies (Ruby, Node.js, Pagefind, Jekyll).")
            $lines.Add("    Ensures all tools required for RavenUI are correctly in PATH.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli doctor}")
        }
        "metadata" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Parse component source headers to generate hierarchical dependency tree.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli metadata}")
        }
        "search-index" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Compile search indices (Pagefind, Lyra, Algolia) for local/production search.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli search-index}")
        }
        "variant" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Automate the generation and packaging of site variant distributions.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli variant}")
        }
        "variants" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Alias for {ct:accent:variant} command. Manages theme variants.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli variants}")
        }
        default {
            $lines.Add("{ct:critical:Unknown command '$Command'.}")
            $lines.Add("Run 'rvcli --help' to see list of valid commands.")
        }
    }

    Write-Host ""
    Write-RvBox -Title "RavenUI CLI Command Help: $Command" -Lines $lines.ToArray() -BorderColor "accent" -Width 75
    Write-Host ""
}
