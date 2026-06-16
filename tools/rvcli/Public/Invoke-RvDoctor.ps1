# RavenUI CLI - Doctor (Environment Diagnostic Command)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvDoctor {
    [CmdletBinding()]
    param(
        [string[]]$Args,
        [string]$WorkspaceRoot
    )

    Write-RvLog -Level "act" -Message "Auditing system environment dependencies..." -Context "doctor"

    $results = [System.Collections.Generic.List[string]]::new()
    $hasErrors = $false

    # 1. Ruby Audit
    try {
        $rubyVer = (ruby --version 2>$null)
        if ($rubyVer) {
            $ver = ($rubyVer -split '\s+')[1]
            $results.Add(" {ct:green:🟩} {ct:white:Ruby:} Found version {ct:accent:$ver}")
        } else {
            $results.Add(" {ct:red:🟥} {ct:critical:Ruby:} Not found in PATH. Ruby is required to run Jekyll.")
            $hasErrors = $true
        }
    } catch {
        $results.Add(" {ct:red:🟥} {ct:critical:Ruby:} Not found. Exception raised while invoking ruby.")
        $hasErrors = $true
    }

    # 2. Bundler Audit
    try {
        $bundlerVer = (bundle --version 2>$null)
        if ($bundlerVer) {
            $ver = ($bundlerVer -split '\s+')[2]
            $results.Add(" {ct:green:🟩} {ct:white:Bundler:} Found version {ct:accent:$ver}")
        } else {
            $results.Add(" {ct:yellow:🟧} {ct:warning:Bundler:} Not found. Strongly recommended to run 'bundle exec jekyll'.")
        }
    } catch {
        $results.Add(" {ct:yellow:🟧} {ct:warning:Bundler:} Failed to invoke bundle command.")
    }

    # 3. Jekyll Audit
    try {
        $jekyllVer = (bundle exec jekyll --version 2>$null)
        if ($jekyllVer) {
            $ver = ($jekyllVer -split '\s+')[1]
            $results.Add(" {ct:green:🟩} {ct:white:Jekyll (Bundle):} Found version {ct:accent:$ver}")
        } else {
            $jekyllVerGlobal = (jekyll --version 2>$null)
            if ($jekyllVerGlobal) {
                $ver = ($jekyllVerGlobal -split '\s+')[1]
                $results.Add(" {ct:green:🟩} {ct:white:Jekyll (Global):} Found version {ct:accent:$ver}")
            } else {
                $results.Add(" {ct:red:🟥} {ct:critical:Jekyll:} Not found. Please run 'bundle install' to install dependencies.")
                $hasErrors = $true
            }
        }
    } catch {
        $results.Add(" {ct:red:🟥} {ct:critical:Jekyll:} Not found or bundle exec jekyll failed.")
        $hasErrors = $true
    }

    # 4. Node.js Audit
    try {
        $nodeVer = (node --version 2>$null)
        if ($nodeVer) {
            $results.Add(" {ct:green:🟩} {ct:white:Node.js:} Found version {ct:accent:$nodeVer}")
        } else {
            $results.Add(" {ct:yellow:🟧} {ct:warning:Node.js:} Not found. Optional but needed for Pagefind and Orama builders.")
        }
    } catch {
        $results.Add(" {ct:yellow:🟧} {ct:warning:Node.js:} Failed to invoke node command.")
    }

    # 5. Pagefind CLI Audit
    try {
        # Check via npx
        $pagefindVer = (npx pagefind --version 2>$null)
        if ($pagefindVer) {
            $results.Add(" {ct:green:🟩} {ct:white:Pagefind UI/CLI:} Found version {ct:accent:$($pagefindVer.Trim())}")
        } else {
            $results.Add(" {ct:yellow:🟧} {ct:warning:Pagefind:} Not found via npx. Local Pagefind search index generation disabled.")
        }
    } catch {
        $results.Add(" {ct:yellow:🟧} {ct:warning:Pagefind:} Failed to invoke npx pagefind.")
    }

    # Output Box
    Write-Host ""
    $borderColor = if ($hasErrors) { "critical" } else { "success" }
    Write-RvBox -Title "RavenUI Diagnostics Report" -Lines $results.ToArray() -BorderColor $borderColor
    Write-Host ""

    if ($hasErrors) {
        Write-RvLog -Level "fail" -Message "Environment contains missing core dependencies. Resolve issues above before starting dev server." -Context "doctor"
    } else {
        Write-RvLog -Level "suc" -Message "All core dependencies verified successfully!" -Context "doctor"
    }
}
