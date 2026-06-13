# Zero-Dark CLI - Metadata & Dependency Tree Generator

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-ZdMetadata {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    $includesDir = [System.IO.Path]::Combine($WorkspaceRoot, "_includes", "comps")
    if (-not [System.IO.Directory]::Exists($includesDir)) {
        Write-ZdLog -Level "fail" -Message "Comps includes folder not found at '$includesDir'" -Context "metadata"
        return
    }

    Write-ZdLog -Level "act" -Message "Scanning component Liquid metadata..." -Context "metadata"

    $files = [System.IO.Directory]::GetFiles($includesDir, "*.html")
    $compMap = [System.Collections.Specialized.OrderedDictionary]::new()
    $depMap = [System.Collections.Specialized.OrderedDictionary]::new()

    foreach ($file in $files) {
        $name = [System.IO.Path]::GetFileNameWithoutExtension($file)
        $content = [System.IO.File]::ReadAllText($file)

        # 1. Parse comments
        $purpose = "No purpose provided."
        if ($content -match 'Purpose____\s*:\s*(.*)') {
            $purpose = $Matches[1].Trim()
        }

        # 2. Parse dependencies
        $deps = [System.Collections.Generic.List[string]]::new()
        # Find {% include comps/name.html ... %}
        $matches = [regex]::Matches($content, '\{\%\s*include\s+comps/([^.\s%]+)\.html')
        foreach ($m in $matches) {
            $depName = $m.Groups[1].Value
            if ($depName -ne $name -and $depName -notin $deps) {
                $deps.Add($depName)
            }
        }

        # 3. Parse plugin dependencies
        $plugins = [System.Collections.Generic.List[string]]::new()
        if ($content -match '\|\s*from_yaml\b') {
            $plugins.Add("from_yaml")
        }
        if ($content -match 'Plugins____\s*:\s*(.*)') {
            $pluginList = $Matches[1].Trim()
            foreach ($p in ($pluginList -split ',')) {
                $pClean = $p.Trim()
                if ($pClean -and $pClean -notin $plugins) {
                    $plugins.Add($pClean)
                }
            }
        }

        $compMap[$name] = @{
            Name = $name
            Purpose = $purpose
            Deps = $deps.ToArray()
            Plugins = $plugins.ToArray()
        }
    }

    # Print Catalog
    $catalogLines = [System.Collections.Generic.List[string]]::new()
    foreach ($k in $compMap.Keys) {
        $c = $compMap[$k]
        $depParts = [System.Collections.Generic.List[string]]::new()
        if ($c.Deps.Count -gt 0) {
            $depParts.Add("depends on: {ct:accent:" + ($c.Deps -join ', ') + "}")
        }
        if ($c.Plugins -and $c.Plugins.Count -gt 0) {
            $depParts.Add("plugins: {ct:warning:" + ($c.Plugins -join ', ') + "}")
        }
        $depStr = if ($depParts.Count -gt 0) { " -> " + ($depParts -join ' | ') } else { "" }
        $catalogLines.Add("{ct:primary:$($c.Name)}: $($c.Purpose)$depStr")
    }

    Write-Host ""
    Write-ZdBox -Title "Component Catalog" -Lines $catalogLines.ToArray() -BorderColor "muted"
    Write-Host ""

    # Print Dependency Tree
    Write-Host (New-CTString "{ct:accent:b:Component Dependency Trees:}")
    $visited = [System.Collections.Generic.HashSet[string]]::new()
    
    foreach ($k in $compMap.Keys) {
        $c = $compMap[$k]
        # Only print root trees (components that are not dependencies of others, or print all if asked)
        $isDepOfOthers = $false
        foreach ($otherKey in $compMap.Keys) {
            if ($otherKey -eq $k) { continue }
            if ($k -in $compMap[$otherKey].Deps) {
                $isDepOfOthers = $true
                break
            }
        }

        if (-not $isDepOfOthers) {
            $visited.Clear() | Out-Null
            Write-Tree-Node -NodeKey $k -CompMap $compMap -Indent "" -IsLast $true -Visited $visited
        }
    }
    Write-Host ""
}

function Write-Tree-Node {
    param(
        [string]$NodeKey,
        [System.Collections.IDictionary]$CompMap,
        [string]$Indent = "",
        [bool]$IsLast = $true,
        [System.Collections.Generic.HashSet[string]]$Visited
    )

    if (-not $CompMap.Contains($NodeKey)) { return }
    $comp = $CompMap[$NodeKey]

    $branch = ""
    if ($Indent -ne "") {
        $branch = if ($IsLast) { "└── " } else { "├── " }
    }
    $formattedNode = New-CTString "$Indent{ct:accent:$branch}{ct:primary:b:$NodeKey}"
    Write-Host $formattedNode

    if ($Visited.Contains($NodeKey)) {
        Write-Host (New-CTString "$Indent    {ct:muted:(recursive loop detected)}")
        return
    }
    $Visited.Add($NodeKey) | Out-Null

    $deps = $comp.Deps
    $suffix = ""
    if ($Indent -ne "") {
        $suffix = if ($IsLast) { "    " } else { "│   " }
    }
    $nextIndent = $Indent + $suffix

    for ($i = 0; $i -lt $deps.Count; $i++) {
        $depKey = $deps[$i]
        $isLastDep = ($i -eq $deps.Count - 1)
        Write-Tree-Node -NodeKey $depKey -CompMap $CompMap -Indent $nextIndent -IsLast $isLastDep -Visited $Visited
    }
}
