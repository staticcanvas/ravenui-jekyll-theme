# tools/minify.ps1
# High-performance asset minifier for HTML, CSS, and JS files in the compiled site.
# Preserves code/pre/script/style blocks, template literals, and HTML comments.
# [Compliance: PowerShell - .NET class optimization | GEMINI.md - StringBuilder, RegexOptions -bor]

param(
    [string]$TargetDir  = "_site",
    [switch]$DryRun,
    [switch]$Quiet,
    [string[]]$Skip     = @(),
    [switch]$NoHTML,
    [switch]$NoCSS,
    [switch]$NoJS
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ─────────────────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────────────────

function Format-Bytes {
    param([long]$bytes)
    if ($bytes -lt 1024)       { return "$bytes B" }
    elseif ($bytes -lt 1MB)    { return "{0:N1} KB" -f ($bytes / 1KB) }
    else                        { return "{0:N2} MB" -f ($bytes / 1MB) }
}

function Write-MinifyLog {
    param(
        [string]$Level,   # act | suc | inf | skp | err
        [string]$Message
    )
    if ($Quiet) { return }

    $esc = [char]27
    $colors = @{
        act = "36"  # cyan
        suc = "32"  # green
        inf = "37"  # white
        skp = "33"  # yellow
        err = "31"  # red
    }
    $c = if ($colors.ContainsKey($Level)) { $colors[$Level] } else { "37" }
    Write-Host "${esc}[${c}m${Message}${esc}[0m"
}

# Returns ($minified, $savedBytes)
function Protect-Blocks {
    param([string]$Content, [System.Collections.Generic.List[string]]$Store, [string]$Pattern)

    $opts  = [System.Text.RegularExpressions.RegexOptions]::Singleline -bor `
             [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

    $index = [ref]$Store.Count
    $out   = [regex]::Replace($Content, $Pattern, {
        param($m)
        $ph = "<!--__RV_BLOCK_$($Store.Count)__-->"
        $Store.Add($m.Value)
        return $ph
    }, $opts)
    return $out
}

function Restore-Blocks {
    param([string]$Content, [System.Collections.Generic.List[string]]$Store)
    $sb = [System.Text.StringBuilder]::new($Content)
    for ($i = 0; $i -lt $Store.Count; $i++) {
        [void]$sb.Replace("<!--__RV_BLOCK_${i}__-->", $Store[$i])
    }
    return $sb.ToString()
}

# ─────────────────────────────────────────────────────────
# Validate target directory
# ─────────────────────────────────────────────────────────

if (-not [System.IO.Directory]::Exists($TargetDir)) {
    Write-Error "Target directory does not exist: $TargetDir"
    exit 1
}

Write-MinifyLog -Level "act" -Message "┌─ RavenUI Minifier ──────────────────────────────────────"
Write-MinifyLog -Level "inf" -Message "│  Target  : $TargetDir"
Write-MinifyLog -Level "inf" -Message "│  DryRun  : $($DryRun.IsPresent)"
Write-MinifyLog -Level "inf" -Message "└─────────────────────────────────────────────────────────"
Write-MinifyLog -Level "act" -Message ""

$optSL  = [System.Text.RegularExpressions.RegexOptions]::Singleline
$optML  = [System.Text.RegularExpressions.RegexOptions]::Multiline
$optSLIC = $optSL -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase

$totalSaved    = [long]0
$totalOriginal = [long]0
$totalMinified = [long]0

# ─────────────────────────────────────────────────────────
# 1. Minify CSS
# ─────────────────────────────────────────────────────────

if (-not $NoCSS) {
    $cssFiles = [System.IO.Directory]::GetFiles($TargetDir, "*.css", [System.IO.SearchOption]::AllDirectories)
    $cssCount = 0
    $cssSaved = [long]0

    foreach ($file in $cssFiles) {
        $rel = [System.IO.Path]::GetRelativePath($TargetDir, $file).Replace("\", "/")

        # Skip already-minified or user-excluded files
        if ($file -match '\.min\.css$') {
            Write-MinifyLog -Level "skp" -Message "  [skip] $rel  (already minified)"
            continue
        }
        $shouldSkip = $false
        foreach ($pattern in $Skip) {
            if ($rel -like $pattern) { $shouldSkip = $true; break }
        }
        if ($shouldSkip) {
            Write-MinifyLog -Level "skp" -Message "  [skip] $rel  (user exclusion)"
            continue
        }

        $original = [System.IO.File]::ReadAllText($file)
        $content  = $original

        # Protect string literals inside url(), attr(), content: "..." from mangling
        $strStore = [System.Collections.Generic.List[string]]::new()
        $content = Protect-Blocks -Content $content -Store $strStore -Pattern '(url\((?!data:)[^)]+\)|content\s*:\s*"[^"]*"|content\s*:\s*''[^'']*'')'

        # Strip block comments (preserve /*! important comments)
        $content = [regex]::Replace($content, '/\*(?!!)[^*]*\*+(?:[^/*][^*]*\*+)*/', '', $optSL)

        # Collapse all whitespace sequences to single space
        $content = [regex]::Replace($content, '\s+', ' ')

        # Collapse around punctuation
        $sb = [System.Text.StringBuilder]::new($content)
        foreach ($pair in @(
            @('; ', ';'), @(': ', ':'), @(' :', ':'),
            @(' {', '{'), @('{ ', '{'),
            @('} ', '}'), @(' }', '}'),
            @(', ', ','), @(' ,', ','),
            @(';}', '}')
        )) {
            [void]$sb.Replace($pair[0], $pair[1])
        }
        $content = $sb.ToString().Trim()

        # Restore protected strings
        $content = Restore-Blocks -Content $content -Store $strStore

        $origSize = [System.Text.Encoding]::UTF8.GetByteCount($original)
        $minSize  = [System.Text.Encoding]::UTF8.GetByteCount($content)
        $saved    = $origSize - $minSize
        $cssSaved     += $saved
        $totalOriginal += $origSize
        $totalMinified += $minSize
        $cssCount++

        if (-not $DryRun) {
            [System.IO.File]::WriteAllText($file, $content)
        }

        $pct = if ($origSize -gt 0) { [math]::Round(($saved / $origSize) * 100, 1) } else { 0 }
        Write-MinifyLog -Level "inf" -Message ("  [css]  {0,-55}  -{1,5} ({2}%)" -f $rel, (Format-Bytes $saved), $pct)
    }

    $totalSaved += $cssSaved
    Write-MinifyLog -Level "suc" -Message "  CSS: $cssCount files  |  saved $(Format-Bytes $cssSaved)"
    Write-MinifyLog -Level "inf" -Message ""
}

# ─────────────────────────────────────────────────────────
# 2. Minify JS
# ─────────────────────────────────────────────────────────

if (-not $NoJS) {
    $jsFiles = [System.IO.Directory]::GetFiles($TargetDir, "*.js", [System.IO.SearchOption]::AllDirectories)
    $jsCount = 0
    $jsSaved = [long]0

    foreach ($file in $jsFiles) {
        $rel = [System.IO.Path]::GetRelativePath($TargetDir, $file).Replace("\", "/")

        if ($file -match '\.min\.js$') {
            Write-MinifyLog -Level "skp" -Message "  [skip] $rel  (already minified)"
            continue
        }
        $shouldSkip = $false
        foreach ($pattern in $Skip) {
            if ($rel -like $pattern) { $shouldSkip = $true; break }
        }
        if ($shouldSkip) {
            Write-MinifyLog -Level "skp" -Message "  [skip] $rel  (user exclusion)"
            continue
        }

        $original = [System.IO.File]::ReadAllText($file)
        $content  = $original

        # Protect template literals (backtick strings) — must happen first
        $tmplStore = [System.Collections.Generic.List[string]]::new()
        $content = Protect-Blocks -Content $content -Store $tmplStore -Pattern '`(?:[^`\\]|\\.)*`'

        # Protect regular string literals (single and double quoted)
        $strStore = [System.Collections.Generic.List[string]]::new()
        $content = Protect-Blocks -Content $content -Store $strStore -Pattern '(?:"(?:[^"\\]|\\.)*"|''(?:[^''\\]|\\.)*'')'

        # Strip block comments (preserve /*! licence banners)
        $content = [regex]::Replace($content, '/\*(?!!)[^*]*\*+(?:[^/*][^*]*\*+)*/', '', $optSL)

        # Strip single-line comments (avoid stripping URLs like http://)
        $content = [regex]::Replace($content, '(?<![:/])//[^\n]*', '', $optML)

        # Collapse blank/excess lines and leading spaces
        $content = [regex]::Replace($content, '\n\s*\n', "`n", $optML)
        $content = [regex]::Replace($content, '[ \t]+', ' ')
        $content = [regex]::Replace($content, '^\s+', '', $optML)

        # Restore protected content
        $content = Restore-Blocks -Content $content -Store $strStore
        $content = Restore-Blocks -Content $content -Store $tmplStore

        $origSize = [System.Text.Encoding]::UTF8.GetByteCount($original)
        $minSize  = [System.Text.Encoding]::UTF8.GetByteCount($content)
        $saved    = $origSize - $minSize
        $jsSaved       += $saved
        $totalOriginal += $origSize
        $totalMinified += $minSize
        $jsCount++

        if (-not $DryRun) {
            [System.IO.File]::WriteAllText($file, $content.Trim())
        }

        $pct = if ($origSize -gt 0) { [math]::Round(($saved / $origSize) * 100, 1) } else { 0 }
        Write-MinifyLog -Level "inf" -Message ("  [js]   {0,-55}  -{1,5} ({2}%)" -f $rel, (Format-Bytes $saved), $pct)
    }

    $totalSaved += $jsSaved
    Write-MinifyLog -Level "suc" -Message "  JS:  $jsCount files  |  saved $(Format-Bytes $jsSaved)"
    Write-MinifyLog -Level "inf" -Message ""
}

# ─────────────────────────────────────────────────────────
# 3. Minify HTML
# ─────────────────────────────────────────────────────────

if (-not $NoHTML) {
    $htmlFiles = [System.IO.Directory]::GetFiles($TargetDir, "*.html", [System.IO.SearchOption]::AllDirectories)
    $htmlCount = 0
    $htmlSaved = [long]0

    foreach ($file in $htmlFiles) {
        $rel = [System.IO.Path]::GetRelativePath($TargetDir, $file).Replace("\", "/")

        $shouldSkip = $false
        foreach ($pattern in $Skip) {
            if ($rel -like $pattern) { $shouldSkip = $true; break }
        }
        if ($shouldSkip) {
            Write-MinifyLog -Level "skp" -Message "  [skip] $rel  (user exclusion)"
            continue
        }

        $original = [System.IO.File]::ReadAllText($file)
        $content  = $original

        # Protect <pre>, <code>, <script>, <style>, <textarea> blocks verbatim
        $blockStore = [System.Collections.Generic.List[string]]::new()
        $content = Protect-Blocks -Content $content -Store $blockStore -Pattern `
            '(<pre[\s>].*?</pre>|<code[\s>].*?</code>|<script[\s>].*?</script>|<style[\s>].*?</style>|<textarea[\s>].*?</textarea>)'

        # Strip HTML comments except IE conditionals and our own placeholders
        $content = [regex]::Replace($content, '<!--(?!\[if|\s*__RV_BLOCK_).*?-->', '', $optSLIC)

        # Collapse inter-tag whitespace (do NOT collapse inside text nodes — safe heuristic)
        $content = [regex]::Replace($content, '>\s{2,}<', '> <')
        $content = [regex]::Replace($content, '\s{2,}', ' ')
        $content = [regex]::Replace($content, '> </', '></')
        $content = [regex]::Replace($content, '/> <', '/><')

        # Restore preserved blocks
        $content = Restore-Blocks -Content $content -Store $blockStore

        $origSize = [System.Text.Encoding]::UTF8.GetByteCount($original)
        $minSize  = [System.Text.Encoding]::UTF8.GetByteCount($content)
        $saved    = $origSize - $minSize
        $htmlSaved     += $saved
        $totalOriginal += $origSize
        $totalMinified += $minSize
        $htmlCount++

        if (-not $DryRun) {
            [System.IO.File]::WriteAllText($file, $content.Trim())
        }

        $pct = if ($origSize -gt 0) { [math]::Round(($saved / $origSize) * 100, 1) } else { 0 }
        Write-MinifyLog -Level "inf" -Message ("  [html] {0,-55}  -{1,5} ({2}%)" -f $rel, (Format-Bytes $saved), $pct)
    }

    $totalSaved += $htmlSaved
    Write-MinifyLog -Level "suc" -Message "  HTML: $htmlCount files  |  saved $(Format-Bytes $htmlSaved)"
    Write-MinifyLog -Level "inf" -Message ""
}

# ─────────────────────────────────────────────────────────
# Summary
# ─────────────────────────────────────────────────────────

$pctTotal = if ($totalOriginal -gt 0) { [math]::Round(($totalSaved / $totalOriginal) * 100, 2) } else { 0 }

Write-MinifyLog -Level "act" -Message "┌─ Summary ───────────────────────────────────────────────"
Write-MinifyLog -Level "inf" -Message "│  Original  : $(Format-Bytes $totalOriginal)"
Write-MinifyLog -Level "inf" -Message "│  Minified  : $(Format-Bytes $totalMinified)"
Write-MinifyLog -Level "suc" -Message "│  Saved     : $(Format-Bytes $totalSaved)  ($pctTotal% reduction)"
if ($DryRun) {
Write-MinifyLog -Level "skp" -Message "│  DRY RUN   : No files written."
}
Write-MinifyLog -Level "act" -Message "└─────────────────────────────────────────────────────────"
