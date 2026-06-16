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
        "minify" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Minify compiled HTML, CSS, and JS assets in the built site directory.")
            $lines.Add("    Preserves <pre>, <code>, <script>, <style>, and <textarea> blocks.")
            $lines.Add("    Template literals and string literals in JS are protected from mangling.")
            $lines.Add("    Licence-banner comments (/*! ... */) are preserved in CSS and JS.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli minify} [target-dir] [options]")
            $lines.Add("")
            $lines.Add("{ct:header:b:ARGUMENTS}")
            $lines.Add("    {ct:primary:target-dir}  Directory to minify. Defaults to 'public' then '_site'.")
            $lines.Add("")
            $lines.Add("{ct:header:b:OPTIONS}")
            $lines.Add("    {ct:primary:-n, --dry-run}  Report savings without writing files.")
            $lines.Add("    {ct:primary:-q, --quiet}    Suppress per-file output; show summary only.")
            $lines.Add("    {ct:primary:--no-html}      Skip HTML minification.")
            $lines.Add("    {ct:primary:--no-css}       Skip CSS minification.")
            $lines.Add("    {ct:primary:--no-js}        Skip JS minification.")
            $lines.Add("    {ct:primary:--skip <glob>}  Exclude files matching the glob pattern.")
            $lines.Add("")
            $lines.Add("{ct:header:b:EXAMPLES}")
            $lines.Add("    {ct:primary:rvcli minify}                  Minify the default '_site' or 'public' dir.")
            $lines.Add("    {ct:primary:rvcli minify public}           Minify a custom build output directory.")
            $lines.Add("    {ct:primary:rvcli minify --dry-run}        Preview savings without modifying files.")
            $lines.Add("    {ct:primary:rvcli minify --no-js --quiet}  Minify HTML+CSS silently, skip JS.")
            $lines.Add("    {ct:primary:rvcli minify --skip '*.map'}   Skip source map files.")
        }
        "git-tags" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Generate docs/_data/git-tags.yml from the repository's sorted tag history.")
            $lines.Add("    Resolves each tag's commit hash, ISO date, and subject message.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli git-tags} [options]")
            $lines.Add("")
            $lines.Add("{ct:header:b:OPTIONS}")
            $lines.Add("    {ct:primary:--limit <N>}        Maximum number of tags to include. Default: 50.")
            $lines.Add("    {ct:primary:--output <path>}    Custom output path. Default: docs/_data/git-tags.yml.")
            $lines.Add("    {ct:primary:--dry-run}          Print YAML to stdout without writing to disk.")
            $lines.Add("")
            $lines.Add("{ct:header:b:EXAMPLES}")
            $lines.Add("    {ct:primary:rvcli git-tags}                       Generate with defaults (last 50 tags).")
            $lines.Add("    {ct:primary:rvcli git-tags --limit 10}            Include only the 10 most recent tags.")
            $lines.Add("    {ct:primary:rvcli git-tags --dry-run}             Preview YAML output without writing.")
            $lines.Add("    {ct:primary:rvcli git-tags --output data/tags.yml} Write to a custom path.")
        }
        "releases" {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Parse git commit logs to generate a structured _data/releases.yml entry.")
            $lines.Add("    Commits are grouped by Conventional Commit type (feat, fix, refactor, etc.).")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli releases} [options]")
            $lines.Add("")
            $lines.Add("{ct:header:b:OPTIONS}")
            $lines.Add("    {ct:primary:--tag <tagname>}   Use a specific tag as the release name. Default: latest tag.")
            $lines.Add("    {ct:primary:--append}          Prepend new entry to existing releases.yml; preserves history.")
            $lines.Add("    {ct:primary:--output <path>}   Custom output path. Default: docs/_data/releases.yml.")
            $lines.Add("    {ct:primary:--dry-run}         Print YAML to stdout without writing to disk.")
            $lines.Add("")
            $lines.Add("{ct:header:b:EXAMPLES}")
            $lines.Add("    {ct:primary:rvcli releases}                  Generate entry from latest tag to HEAD.")
            $lines.Add("    {ct:primary:rvcli releases --tag v1.4.0}     Generate entry scoped to tag v1.4.0.")
            $lines.Add("    {ct:primary:rvcli releases --append}         Prepend entry without overwriting history.")
            $lines.Add("    {ct:primary:rvcli releases --dry-run}        Preview release YAML without writing.")
        }
        { $_ -eq "version" -or $_ -eq "ver" } {
            $lines.Add("{ct:header:b:DESCRIPTION}")
            $lines.Add("    Read, set, bump, or sync the site version across VERSION file and _config.yml.")
            $lines.Add("")
            $lines.Add("{ct:header:b:USAGE}")
            $lines.Add("    {ct:accent:rvcli version} <sub-command> [value]")
            $lines.Add("")
            $lines.Add("{ct:header:b:SUB-COMMANDS}")
            $lines.Add("    {ct:primary:get}              Print current version from both sources. (default)")
            $lines.Add("    {ct:primary:set <version>}    Write an explicit version string to VERSION and _config.yml.")
            $lines.Add("    {ct:primary:bump major}       Increment major version; reset minor and patch to 0.")
            $lines.Add("    {ct:primary:bump minor}       Increment minor version; reset patch to 0.")
            $lines.Add("    {ct:primary:bump patch}       Increment patch version only.")
            $lines.Add("    {ct:primary:sync}             Push the VERSION file value into _config.yml.")
            $lines.Add("")
            $lines.Add("{ct:header:b:EXAMPLES}")
            $lines.Add("    {ct:primary:rvcli version}               Print current version from both sources.")
            $lines.Add("    {ct:primary:rvcli version get}           Explicit get sub-command.")
            $lines.Add("    {ct:primary:rvcli version set 1.5.0}     Set version to 1.5.0 in both files.")
            $lines.Add("    {ct:primary:rvcli version bump patch}    Increment patch: 1.5.0 -> 1.5.1.")
            $lines.Add("    {ct:primary:rvcli version bump minor}    Increment minor: 1.5.1 -> 1.6.0.")
            $lines.Add("    {ct:primary:rvcli version bump major}    Increment major: 1.6.0 -> 2.0.0.")
            $lines.Add("    {ct:primary:rvcli version sync}          Sync VERSION file value into _config.yml.")
            $lines.Add("    {ct:primary:rvcli ver bump patch}        'ver' is an alias for 'version'.")
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
