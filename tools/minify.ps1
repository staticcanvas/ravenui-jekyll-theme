# tools/minify.ps1
# High-performance asset minifier for HTML, CSS, and JS files in the compiled site.
# [Compliance: PowerShell - .NET class optimization]

param(
    [string]$TargetDir = "_site"
)

Write-Host "⚡ Starting minification in directory: $TargetDir" -ForegroundColor Cyan

if (-not [System.IO.Directory]::Exists($TargetDir)) {
    Write-Error "Target directory does not exist: $TargetDir"
    exit 1
}

$htmlFiles = [System.IO.Directory]::GetFiles($TargetDir, "*.html", [System.IO.SearchOption]::AllDirectories)
$cssFiles = [System.IO.Directory]::GetFiles($TargetDir, "*.css", [System.IO.SearchOption]::AllDirectories)
$jsFiles = [System.IO.Directory]::GetFiles($TargetDir, "*.js", [System.IO.SearchOption]::AllDirectories)

# 1. Minify CSS
foreach ($file in $cssFiles) {
    $content = [System.IO.File]::ReadAllText($file)
    # Strip comments
    $content = [regex]::Replace($content, '/\*.*?\*/', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    # Strip whitespace
    $content = [regex]::Replace($content, '\s+', ' ')
    $content = $content.Replace('; ', ';').Replace(': ', ':').Replace(' {', '{').Replace('} ', '}').Replace(';}', '}')
    [System.IO.File]::WriteAllText($file, $content.Trim())
}
Write-Host "✅ Minified $($cssFiles.Count) CSS files." -ForegroundColor Green

# 2. Minify JS
foreach ($file in $jsFiles) {
    # Skip already minified files
    if ($file -match '\.min\.js$') { continue }
    $content = [System.IO.File]::ReadAllText($file)
    # Simple block comments strip
    $content = [regex]::Replace($content, '/\*.*?\*/', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    # Simple line comments strip
    $content = [regex]::Replace($content, '(?<!:|\\)//.*$', '', [System.Text.RegularExpressions.RegexOptions]::Multiline)
    # Strip excessive newlines and double spaces
    $content = [regex]::Replace($content, '\s*\n\s*', "`n")
    $content = [regex]::Replace($content, ' +', ' ')
    [System.IO.File]::WriteAllText($file, $content.Trim())
}
Write-Host "✅ Minified $($jsFiles.Count) JS files." -ForegroundColor Green

# 3. Minify HTML
foreach ($file in $htmlFiles) {
    $content = [System.IO.File]::ReadAllText($file)
    
    # Extract and replace pre/code blocks with placeholders to preserve formatting
    $placeholders = [System.Collections.Generic.List[string]]::new()
    
    $content = [regex]::Replace($content, '(<pre.*?>.*?</pre>|<code.*?>.*?</code>|<script.*?>.*?</script>)', {
        param($m)
        $placeholder = "<!--__PRESERVED_BLOCK_$($placeholders.Count)__-->"
        $placeholders.Add($m.Value)
        return $placeholder
    }, [System.Text.RegularExpressions.RegexOptions]::Singleline -or [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)

    # Strip HTML comments (excluding IE conditional comments and our placeholders)
    $content = [regex]::Replace($content, '<!--(?!\[if).*?-->', '', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    
    # Collapse whitespace
    $content = [regex]::Replace($content, '\s+', ' ')
    $content = [regex]::Replace($content, '> <', '><')

    # Restore pre/code blocks
    for ($i = 0; $i -lt $placeholders.Count; $i++) {
        $ph = "<!--__PRESERVED_BLOCK_$i__-->"
        $content = $content.Replace($ph, $placeholders[$i])
    }

    [System.IO.File]::WriteAllText($file, $content.Trim())
}
Write-Host "✅ Minified $($htmlFiles.Count) HTML files." -ForegroundColor Green
Write-Host "🚀 Minification complete!" -ForegroundColor Green
