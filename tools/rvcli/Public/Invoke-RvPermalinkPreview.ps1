# RavenUI CLI - Permalink Previewer
# Calculates and displays the output URL and disk destination path for any file based on Jekyll config rules, and lists compiled front-matter.
# [Compliance: file-per-cmdlet | Write-RvLog | UI Box | Auspex integration]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvPermalinkPreview {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    # 1. Parse arguments
    $filePath = $null
    $jsonMode = $false

    for ($i = 0; $i -lt $Args.Count; $i++) {
        $arg = $Args[$i]
        if ($arg -eq "--json" -or $arg -eq "-j") {
            $jsonMode = $true
        } else {
            $filePath = $arg
        }
    }

    if (-not $filePath) {
        Write-RvLog -Level "fail" -Message "Please specify a file path. Example: './rvcli permalink docs/installation.md'" -Context "permalink"
        return
    }

    # 2. Get absolute path of target file
    $resolvedPath = $filePath
    if (-not [System.IO.Path]::IsPathRooted($resolvedPath)) {
        $path1 = [System.IO.Path]::Combine((Get-Location).Path, $resolvedPath)
        $path2 = [System.IO.Path]::Combine($WorkspaceRoot, $resolvedPath)
        if ([System.IO.File]::Exists($path1)) {
            $resolvedPath = $path1
        } elseif ([System.IO.File]::Exists($path2)) {
            $resolvedPath = $path2
        } else {
            $resolvedPath = $path2
        }
    }

    if (-not [System.IO.File]::Exists($resolvedPath)) {
        Write-RvLog -Level "fail" -Message "File not found: $filePath" -Context "permalink"
        return
    }

    # 3. Locate closest _config.yml up the folder tree from the file to the workspace root
    $config = [ordered]@{}
    $configLoaded = $false
    $configUsed = "None"
    
    $searchDir = [System.IO.Path]::GetDirectoryName($resolvedPath)
    while ($searchDir) {
        $testConfig = [System.IO.Path]::Combine($searchDir, "_config.yml")
        if ([System.IO.File]::Exists($testConfig)) {
            try {
                $configText = [System.IO.File]::ReadAllText($testConfig)
                $config = ConvertFrom-AuspexYaml -YamlText $configText
                $configLoaded = $true
                $configUsed = [System.IO.Path]::GetRelativePath($WorkspaceRoot, $testConfig).Replace("\", "/")
                break
            } catch {
                Write-RvLog -Level "warn" -Message "Failed to parse configuration at $($testConfig): $_" -Context "permalink"
            }
        }
        if ($searchDir -eq $WorkspaceRoot -or $searchDir -eq [System.IO.Path]::GetPathRoot($searchDir)) {
            break
        }
        $searchDir = [System.IO.Path]::GetDirectoryName($searchDir)
    }
    
    # Fallback to root config if no config was found along the folder tree
    if (-not $configLoaded) {
        $testConfig = [System.IO.Path]::Combine($WorkspaceRoot, "_config.yml")
        if ([System.IO.File]::Exists($testConfig)) {
            try {
                $configText = [System.IO.File]::ReadAllText($testConfig)
                $config = ConvertFrom-AuspexYaml -YamlText $configText
                $configLoaded = $true
                $configUsed = "_config.yml"
            } catch {
                # Ignore fallback errors
            }
        }
    }

    # 4. Resolve relative path to config directory or workspace root
    $sourceDir = if ($configLoaded) { [System.IO.Path]::GetDirectoryName([System.IO.Path]::Combine($WorkspaceRoot, $configUsed)) } else { $WorkspaceRoot }
    $relPath = [System.IO.Path]::GetRelativePath($sourceDir, $resolvedPath).Replace("\", "/")

    # 5. Read file and extract front-matter
    $content = [System.IO.File]::ReadAllText($resolvedPath)
    $frontMatter = [ordered]@{}
    $hasFrontMatter = $false

    if ($content -match "^(?s)---\r?\n(.*?)\r?\n---\r?\n") {
        $yamlText = $Matches[1]
        try {
            $frontMatter = ConvertFrom-AuspexYaml -YamlText $yamlText
            $hasFrontMatter = $true
        } catch {
            Write-RvLog -Level "warn" -Message "Failed to parse front-matter: $_" -Context "permalink"
        }
    }

    # Static file case (no front-matter)
    if (-not $hasFrontMatter) {
        $url = "/" + $relPath
        $url = $url -replace '//+', '/'
        
        $destFile = $url.TrimStart('/')
        $destPath = Join-Path "_site" $destFile
        $destPath = $destPath.Replace("\", "/")

        $resultObj = [PSCustomObject]@{
            FilePath     = $filePath.Replace("\", "/")
            Type         = "Static File"
            ConfigUsed   = $configUsed
            Template     = "N/A"
            URL          = $url
            DestPath     = $destPath
            FrontMatter  = @{}
        }

        if ($jsonMode) {
            $resultObj | ConvertTo-Json -Depth 5 | Write-Output
            return
        }

        $lines = @(
            "File: {ct:primary:$($resultObj.FilePath)}",
            "Type: {ct:accent:$($resultObj.Type)}",
            "Config: {ct:muted:$($resultObj.ConfigUsed)}",
            "URL: {ct:success:$($resultObj.URL)}",
            "Output Path: {ct:primary:$($resultObj.DestPath)}",
            "",
            "{ct:header:b:FRONT MATTER}",
            "  {ct:muted:(None)}"
        )

        Write-RvBox -Title "Jekyll Permalink Preview" -Lines $lines -BorderColor "accent" -Width 75
        return
    }

    # Process variables for path calculations
    $basename = [System.IO.Path]::GetFileNameWithoutExtension($resolvedPath)
    $outputExt = ".html"
    $parentDir = [System.IO.Path]::GetDirectoryName($relPath)
    $pathDir = if ($parentDir) { $parentDir.Replace("\", "/") } else { "" }

    $type = "Page"
    $template = $null

    # Match reserved directories (non-collections)
    $reservedDirs = @("posts", "data", "includes", "layouts", "sass", "site", "plugins", "ravenui-themes", "jekyll-cache")

    # A. Check if it's a post
    if ($relPath -match "(?:^|/)_posts/([^/]+)$") {
        $type = "Post"
        $postFile = $basename
        
        # Parse post date and title from filename
        $dateObj = [datetime]::Now
        $titleSlug = $postFile
        if ($postFile -match "^(\d{4})-(\d{2})-(\d{2})-(.+)$") {
            [datetime]::TryParse("$($Matches[1])-$($Matches[2])-$($Matches[3])", [ref]$dateObj) | Out-Null
            $titleSlug = $Matches[4]
        }

        if ($frontMatter.Contains("date")) {
            [datetime]::TryParse($frontMatter["date"].ToString(), [ref]$dateObj) | Out-Null
        }

        if ($frontMatter.Contains("slug")) {
            $titleSlug = $frontMatter["slug"].ToString()
        }

        $year = $dateObj.ToString("yyyy")
        $month = $dateObj.ToString("MM")
        $day = $dateObj.ToString("dd")
        $i_month = $dateObj.Month.ToString()
        $i_day = $dateObj.Day.ToString()
        $short_year = $dateObj.ToString("yy")
        $y_day = $dateObj.DayOfYear.ToString()
        $titleSlug = $titleSlug.ToLower() -replace '[^a-z0-9_-]', '-' -replace '-+', '-'

        # Parse category / categories
        $categoriesStr = ""
        if ($frontMatter.Contains("categories")) {
            $cats = $frontMatter["categories"]
            if ($cats -is [System.Collections.IList]) {
                $categoriesStr = ($cats | ForEach-Object { $_.ToString().ToLower() }) -join "/"
            } else {
                $categoriesStr = $cats.ToString().ToLower()
            }
        } elseif ($frontMatter.Contains("category")) {
            $categoriesStr = $frontMatter["category"].ToString().ToLower()
        }

        # Resolve permalink template
        $template = "/:categories/:year/:month/:day/:title.html"
        if ($config.Contains("permalink")) {
            $style = $config["permalink"]
            if ($style -eq "pretty") {
                $template = "/:categories/:year/:month/:day/:title/"
            } elseif ($style -eq "ordinal") {
                $template = "/:categories/:year/:y_day/:title.html"
            } elseif ($style -eq "none") {
                $template = "/:categories/:title.html"
            } elseif ($style -eq "date") {
                $template = "/:categories/:year/:month/:day/:title.html"
            } elseif ($style -match "^/") {
                $template = $style
            }
        }

        if ($frontMatter.Contains("permalink")) {
            $template = $frontMatter["permalink"]
        }

        # Replace placeholders
        $url = $template
        $url = $url -replace ":categories", $categoriesStr
        $url = $url -replace ":year", $year
        $url = $url -replace ":month", $month
        $url = $url -replace ":day", $day
        $url = $url -replace ":i_month", $i_month
        $url = $url -replace ":i_day", $i_day
        $url = $url -replace ":short_year", $short_year
        $url = $url -replace ":y_day", $y_day
        $url = $url -replace ":title", $titleSlug
        $url = $url -replace ":basename", $basename
        $url = $url -replace ":output_ext", $outputExt
    }
    # B. Check if it's a collection document
    elseif ($relPath -match "(?:^|/)_([^/]+)/(.+)$" -and $reservedDirs -notcontains $Matches[1]) {
        $collName = $Matches[1]
        $collPath = $Matches[2]
        $type = "Collection ($collName)"

        $collBasename = [System.IO.Path]::GetFileNameWithoutExtension($collPath)
        $collSubdir = [System.IO.Path]::GetDirectoryName($collPath)
        $collSubdirStr = ""
        if ($collSubdir) {
            $collSubdirStr = $collSubdir.Replace("\", "/") + "/"
        }

        # Resolve collection permalink template
        $template = "/:collection/:path:output_ext"
        if ($config.Contains("collections") -and $config["collections"] -is [System.Collections.IDictionary]) {
            $colls = $config["collections"]
            if ($colls.Contains($collName) -and $colls[$collName] -is [System.Collections.IDictionary]) {
                $collConfig = $colls[$collName]
                if ($collConfig.Contains("permalink")) {
                    $template = $collConfig["permalink"]
                }
            }
        }

        if ($frontMatter.Contains("permalink")) {
            $template = $frontMatter["permalink"]
        }

        # Replace placeholders
        $url = $template
        $url = $url -replace ":collection", $collName
        $url = $url -replace ":path", ($collSubdirStr + $collBasename)
        $url = $url -replace ":basename", $collBasename
        $url = $url -replace ":output_ext", $outputExt
    }
    # C. Regular Page
    else {
        if ($frontMatter.Contains("permalink")) {
            $template = $frontMatter["permalink"]
            $url = $template
        } else {
            $template = "/:path/:basename:output_ext"
            $cleanPathDir = $pathDir.Trim('/')
            $url = $template
            $url = $url -replace ":path", $cleanPathDir
            $url = $url -replace ":basename", $basename
            $url = $url -replace ":output_ext", $outputExt
        }
    }

    # Clean double slashes and ensure leading slash
    if (-not $url.StartsWith("/")) {
        $url = "/" + $url
    }
    $url = $url -replace '//+', '/'

    # Determine destination disk path
    $destFile = $url
    if ($url.EndsWith("/")) {
        $destFile = $url + "index.html"
    }
    $destFile = $destFile -replace '//+', '/'
    $destFile = $destFile.TrimStart('/')
    
    # Prefix destination folder relative to the site root output
    $destPath = Join-Path "_site" $destFile
    $destPath = $destPath.Replace("\", "/")

    # Pack result object
    $resultObj = [PSCustomObject]@{
        FilePath     = $filePath.Replace("\", "/")
        Type         = $type
        ConfigUsed   = $configUsed
        Template     = $template
        URL          = $url
        DestPath     = $destPath
        FrontMatter  = $frontMatter
    }

    if ($jsonMode) {
        $resultObj | ConvertTo-Json -Depth 5 | Write-Output
        return
    }

    # Construct visual output lines
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add("File: {ct:primary:$($resultObj.FilePath)}")
    $lines.Add("Type: {ct:accent:$($resultObj.Type)}")
    $lines.Add("Config: {ct:muted:$($resultObj.ConfigUsed)}")
    $lines.Add("Template: {ct:muted:$($resultObj.Template)}")
    $lines.Add("URL: {ct:success:$($resultObj.URL)}")
    $lines.Add("Output Path: {ct:primary:$($resultObj.DestPath)}")
    $lines.Add("")
    $lines.Add("{ct:header:b:FRONT MATTER}")

    foreach ($key in $frontMatter.Keys) {
        $val = $frontMatter[$key]
        $valStr = if ($val -is [System.Collections.IDictionary]) {
            "{Nested Map}"
        } elseif ($val -is [System.Collections.IList]) {
            "[" + (($val | ForEach-Object { $_.ToString() }) -join ", ") + "]"
        } elseif ($val -is [bool]) {
            if ($val) { "true" } else { "false" }
        } elseif ($null -eq $val) {
            "null"
        } else {
            $val.ToString()
        }
        
        # Truncate values to fit clean box spacing
        if ($valStr.Length -gt 45) {
            $valStr = $valStr.Substring(0, 42) + "..."
        }
        $lines.Add("  {ct:accent:$key}: {ct:primary:$valStr}")
    }

    Write-RvBox -Title "Jekyll Permalink Preview" -Lines $lines.ToArray() -BorderColor "accent" -Width 75
}
