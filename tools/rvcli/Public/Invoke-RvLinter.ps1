# RavenUI CLI - Workspace & Code Linter

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvLinter {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    Write-RvLog -Level "act" -Message "Starting repository integrity audit..." -Context "linter"

    $mismatches = [System.Collections.Generic.List[string]]::new()
    $headerViolations = [System.Collections.Generic.List[string]]::new()
    $brokenIncludes = [System.Collections.Generic.List[string]]::new()

    # 1. 1:1 Component Mapping Check
    $includesDir = [System.IO.Path]::Combine($WorkspaceRoot, "_includes", "comps")
    $docsDir = [System.IO.Path]::Combine($WorkspaceRoot, "docs", "components")

    if ([System.IO.Directory]::Exists($includesDir) -and [System.IO.Directory]::Exists($docsDir)) {
        $includeFiles = [System.IO.Directory]::GetFiles($includesDir, "*.html")
        $docFiles = [System.IO.Directory]::GetFiles($docsDir, "*.md")

        $includeNames = foreach ($f in $includeFiles) { [System.IO.Path]::GetFileNameWithoutExtension($f) }
        $docNames = [System.Collections.Generic.List[string]]::new()
        foreach ($f in $docFiles) {
            $name = [System.IO.Path]::GetFileNameWithoutExtension($f)
            if ($name -ne "index") {
                $docNames.Add($name)
            }
        }

        # Check for HTML missing MD
        foreach ($incName in $includeNames) {
            if ($incName -notin $docNames) {
                $mismatches.Add("Include '{ct:accent:$incName.html}' has no documentation page in docs/components/")
            }
        }

        # Check for MD missing HTML
        foreach ($docName in $docNames) {
            if ($docName -notin $includeNames) {
                $mismatches.Add("Docs page '{ct:accent:$docName.md}' has no corresponding include file in _includes/comps/")
            }
        }
    }

    # 2. Line-by-line file auditing for Headings and Includes
    $searchDir = $WorkspaceRoot
    $allFiles = [System.IO.Directory]::GetFiles($searchDir, "*.*", [System.IO.SearchOption]::AllDirectories)

    foreach ($file in $allFiles) {
        $relPath = [System.IO.Path]::GetRelativePath($WorkspaceRoot, $file)
        
        # Skip standard ignore directories
        if ($relPath -match 'node_modules|vendor|_site|\.git|\.jekyll-cache|\.bundle') { continue }

        $ext = [System.IO.Path]::GetExtension($file).ToLower()
        if ($ext -notin @('.md', '.html')) { continue }

        $lines = [System.IO.File]::ReadAllLines($file)
        for ($li = 0; $li -lt $lines.Count; $li++) {
            $line = $lines[$li]
            $lineNum = $li + 1

            # A. Markdown heading bold audit (H2 and H3 only)
            if ($ext -eq '.md') {
                if ($line -match '^#{2,3}\s+(.*)') {
                    $headerContent = $Matches[1].Trim()
                    if (-not ($headerContent -match '^\*\*(.*)\*\*$')) {
                        $cleanLine = $line -replace '\{:.*?\}', ''
                        $headerViolations.Add("'${relPath}:L${lineNum}' -> Heading not bolded: {ct:yellow:$cleanLine}")
                    }
                }
            }

            # B. Liquid Include syntax checker
            if ($line -match '\{\%\s*include\s+([^% ]+)\s*') {
                $includeTarget = $Matches[1].Trim()
                # Clean up quotes/parameters
                $includeTarget = ([string]($includeTarget -split '\s+')[0]).Replace('"', '').Replace("'", "")
                
                # Check target file existence
                $targetFullPath = [System.IO.Path]::Combine($WorkspaceRoot, "_includes", $includeTarget)
                if (-not [System.IO.File]::Exists($targetFullPath)) {
                    $brokenIncludes.Add("'${relPath}:L${lineNum}' -> Broken include '{ct:red:$includeTarget}'")
                }
            }
        }
    }

    # 3. Report Results
    Write-Host ""
    $ok = $true

    if ($mismatches.Count -gt 0) {
        $ok = $false
        Write-RvBox -Title "Component 1:1 Mapping Issues" -Lines $mismatches.ToArray() -BorderColor "warning"
        Write-Host ""
    }

    if ($headerViolations.Count -gt 0) {
        $ok = $false
        Write-RvBox -Title "Header Bolding Violations (Rule: ## **Header**)" -Lines $headerViolations.ToArray() -BorderColor "warning"
        Write-Host ""
    }

    if ($brokenIncludes.Count -gt 0) {
        $ok = $false
        Write-RvBox -Title "Broken Liquid Includes" -Lines $brokenIncludes.ToArray() -BorderColor "critical"
        Write-Host ""
    }

    if ($ok) {
        Write-RvLog -Level "suc" -Message "Workspace passed all validation audits!" -Context "linter"
    } else {
        Write-RvLog -Level "fail" -Message "Workspace validation completed with errors." -Context "linter"
    }
}
