# RavenUI CLI - Auspex Helper Module
# Provides robust YAML parsing, writing, recursive merging, and dynamic dot-notation path traversal.
# [Compliance: Write-RvLog | .NET optimization | zero external dependencies]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Dynamically import the pre-provided Auspex module
$auspexManifest = [System.IO.Path]::Combine($PSScriptRoot, "../../devt/Private/auspex/auspex.psd1")
if ([System.IO.File]::Exists($auspexManifest)) {
    if (-not (Get-Command "Invoke-AusPex" -ErrorAction SilentlyContinue)) {
        Import-Module $auspexManifest -Force
    }
}


# Converts a YAML string into a nested ordered dictionary (ordered hashtable).
function ConvertFrom-AuspexYaml {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$YamlText
    )

    process {
        $lines = $YamlText -split "`r?`n"
        $root = [ordered]@{}
        $stack = [System.Collections.Generic.List[PSCustomObject]]::new()
        $stack.Add([PSCustomObject]@{ Indent = -1; Type = 'dict'; Ref = $root; Key = $null; ParentRef = $null })

        foreach ($line in $lines) {
            # Skip comments and empty lines
            if ($line -match '^\s*$' -or $line -match '^\s*#') {
                continue
            }

            # List Item Match: e.g. "  - val" or "  - key: val"
            if ($line -match '^(\s*)-\s*(.*)$') {
                $indent = $Matches[1].Length
                $rest = $Matches[2].Trim()
                $rest = Strip-AuspexComment $rest

                while ($stack.Count -gt 0) {
                    $top = $stack[$stack.Count - 1]
                    if ($top.Type -eq 'list' -and $top.Indent -eq $indent) {
                        break
                    }
                    if ($top.Indent -ge $indent) {
                        $stack.RemoveAt($stack.Count - 1)
                    } else {
                        break
                    }
                }

                $parentObj = $stack[$stack.Count - 1]

                # Convert empty dictionary to list if a list item follows
                if ($parentObj.Type -eq 'dict') {
                    $parentKey = $parentObj.Key
                    if ($null -ne $parentKey -and $null -ne $parentObj.ParentRef) {
                        $parentObj.ParentRef[$parentKey] = [System.Collections.Generic.List[System.Object]]::new()
                        $listRef = $parentObj.ParentRef[$parentKey]
                    } else {
                        if (-not $root.Contains("items")) {
                            $root["items"] = [System.Collections.Generic.List[System.Object]]::new()
                        }
                        $listRef = $root["items"]
                    }
                    $parentObj = [PSCustomObject]@{ Indent = $indent; Type = 'list'; Ref = $listRef; Key = $null; ParentRef = $null }
                    $stack.Add($parentObj)
                }

                $listRef = $parentObj.Ref

                # List item is a key-value dictionary: e.g. "- name: val"
                if ($rest -match '^([^:]+)\s*:\s*(.*)$') {
                    $k = $Matches[1].Trim()
                    $v = $Matches[2].Trim()
                    $v = Strip-AuspexQuotes $v
                    $v = Convert-AuspexYamlValueType $v

                    $dict = [ordered]@{}
                    $dict[$k] = $v
                    $listRef.Add($dict)
                    
                    $stack.Add([PSCustomObject]@{ Indent = $indent; Type = 'dict'; Ref = $dict; Key = $k; ParentRef = $listRef })
                } else {
                    # Simple scalar list item
                    $rest = Strip-AuspexQuotes $rest
                    $rest = Convert-AuspexYamlValueType $rest
                    $listRef.Add($rest)
                }
                continue
            }

            # Standard Key-Value Match: e.g. "key: value" or "key:"
            if ($line -match '^(\s*)([^:]+)\s*:\s*(.*)$') {
                $indent = $Matches[1].Length
                $key = $Matches[2].Trim()
                $val = $Matches[3].Trim()
                $val = Strip-AuspexComment $val

                while ($stack.Count -gt 0) {
                    $top = $stack[$stack.Count - 1]
                    if ($top.Indent -ge $indent) {
                        $stack.RemoveAt($stack.Count - 1)
                    } else {
                        break
                    }
                }

                if ($stack.Count -eq 0) {
                    $parentObj = [PSCustomObject]@{ Indent = -1; Type = 'dict'; Ref = $root; Key = $null; ParentRef = $null }
                    $stack.Add($parentObj)
                } else {
                    $parentObj = $stack[$stack.Count - 1]
                }

                # If stack top is a list wrapper, pop it to get its dictionary parent
                if ($parentObj.Type -eq 'list') {
                    $stack.RemoveAt($stack.Count - 1)
                    $parentObj = $stack[$stack.Count - 1]
                }

                $dictRef = $parentObj.Ref

                if ([string]::IsNullOrEmpty($val)) {
                    # Empty value means nested block starts on next line
                    $newDict = [ordered]@{}
                    $dictRef[$key] = $newDict
                    $stack.Add([PSCustomObject]@{ Indent = $indent; Type = 'dict'; Ref = $newDict; Key = $key; ParentRef = $dictRef })
                } else {
                    $val = Strip-AuspexQuotes $val
                    $val = Convert-AuspexYamlValueType $val
                    $dictRef[$key] = $val
                    $parentObj.Key = $key
                }
            }
        }
        return $root
    }
}

# Removes surrounding single or double quotes.
function Strip-AuspexQuotes {
    param([string]$val)
    if ($val -match '^"(.*)"$') {
        return $Matches[1]
    } elseif ($val -match "^'(.*)'$") {
        return $Matches[1]
    }
    return $val
}

# Strips trailing inline comments safely, respecting quotes.
function Strip-AuspexComment {
    param([string]$val)
    $inDouble = $false
    $inSingle = $false
    for ($i = 0; $i -lt $val.Length; $i++) {
        $c = $val[$i]
        if ($c -eq '"' -and -not $inSingle) { $inDouble = -not $inDouble }
        elseif ($c -eq "'" -and -not $inDouble) { $inSingle = -not $inSingle }
        elseif ($c -eq '#' -and -not $inDouble -and -not $inSingle) {
            return $val.Substring(0, $i).Trim()
        }
    }
    return $val.Trim()
}

# Attempts scalar type coercion for parsed strings.
function Convert-AuspexYamlValueType {
    param([string]$val)
    if ($val -eq "true") { return $true }
    if ($val -eq "false") { return $false }
    if ($val -eq "null" -or $val -eq "~") { return $null }
    if ($val -match '^-?\d+$') { return [int]$val }
    if ($val -match '^-?\d+\.\d+$') { return [double]$val }
    return $val
}

# Recursively converts an ordered dictionary back to formatted YAML.
function ConvertTo-AuspexYaml {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [System.Collections.IDictionary]$Config,
        [int]$Indent = 0
    )

    process {
        $lines = [System.Collections.Generic.List[string]]::new()
        $pad = " " * $Indent
        foreach ($key in $Config.Keys) {
            $val = $Config[$key]
            if ($val -is [System.Collections.IDictionary]) {
                $lines.Add("${pad}${key}:")
                foreach ($subline in (ConvertTo-AuspexYaml -Config $val -Indent ($Indent + 2))) {
                    $lines.Add($subline)
                }
            } elseif ($val -is [System.Collections.IList]) {
                $lines.Add("${pad}${key}:")
                foreach ($item in $val) {
                    if ($item -is [System.Collections.IDictionary]) {
                        # List of dictionaries: Output first key inline with '-'
                        $keys = @($item.Keys)
                        if ($keys.Count -gt 0) {
                            $firstKey = $keys[0]
                            $firstVal = $item[$firstKey]
                            $lines.Add("${pad}  - ${firstKey}: $firstVal")
                            for ($i = 1; $i -lt $keys.Count; $i++) {
                                $k = $keys[$i]
                                $v = $item[$k]
                                $lines.Add("${pad}    ${k}: $v")
                            }
                        }
                    } else {
                        $lines.Add("${pad}  - $item")
                    }
                }
            } elseif ($val -is [bool]) {
                $boolStr = if ($val) { "true" } else { "false" }
                $lines.Add("${pad}${key}: $boolStr")
            } elseif ($val -eq $null) {
                $lines.Add("${pad}${key}: null")
            } elseif ($val -as [double] -ne $null -or $val -as [int] -ne $null) {
                $lines.Add("${pad}${key}: $val")
            } else {
                # Format string value with appropriate YAML quoting
                if ($val -eq "") {
                    $lines.Add("${pad}${key}: `"`"")
                } elseif ($val -match '[:#\[\]{}!|>&%@`*]' -or $val -match '^\s' -or $val -match '\s$') {
                    if ($val.Contains('"')) {
                        $escaped = $val -replace "'", "''"
                        $lines.Add("${pad}${key}: '$escaped'")
                    } else {
                        $lines.Add("${pad}${key}: `"$val`"")
                    }
                } else {
                    $lines.Add("${pad}${key}: $val")
                }
            }
        }
        return $lines
    }
}

# Dynamically traverses a nested configuration dictionary using dot notation path.
function Get-AuspexConfig {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [System.Collections.IDictionary]$Config,
        
        [Parameter(Mandatory)]
        [string]$Path
    )

    process {
        if (Get-Command "Invoke-AusPex" -ErrorAction SilentlyContinue) {
            $global:__logging = $false
            return Invoke-AusPex -ObjectPointer $Config -Action "read" -KeyName $Path
        } else {
            $parts = $Path -split '\.'
            $curr = $Config
            foreach ($part in $parts) {
                if ($curr -is [System.Collections.IDictionary] -and $curr.Contains($part)) {
                    $curr = $curr[$part]
                } else {
                    return $null
                }
            }
            return $curr
        }
    }
}

# Dynamically updates a nested configuration dictionary path with a new value.
function Set-AuspexConfig {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [System.Collections.IDictionary]$Config,
        
        [Parameter(Mandatory)]
        [string]$Path,
        
        [Parameter(Mandatory)]
        $Value
    )

    process {
        if (Get-Command "Invoke-AusPex" -ErrorAction SilentlyContinue) {
            $global:__logging = $false
            $exists = $null -ne (Invoke-AusPex -ObjectPointer $Config -Action "read" -KeyName $Path)
            $action = if ($exists) { "update" } else { "create" }
            try {
                Invoke-AusPex -ObjectPointer $Config -Action $action -KeyName $Path -Value $Value | Out-Null
            } catch {
                $altAction = if ($action -eq "update") { "create" } else { "update" }
                Invoke-AusPex -ObjectPointer $Config -Action $altAction -KeyName $Path -Value $Value | Out-Null
            }
        } else {
            $parts = $Path -split '\.'
            $curr = $Config
            for ($i = 0; $i -lt $parts.Count - 1; $i++) {
                $part = $parts[$i]
                if (-not $curr.Contains($part) -or $curr[$part] -isnot [System.Collections.IDictionary]) {
                    $curr[$part] = [ordered]@{}
                }
                $curr = $curr[$part]
            }
            $curr[$parts[$parts.Count - 1]] = $Value
        }
    }
}

# Recursively merges two configuration dictionaries (Base overridden by Overlay).
function Merge-AuspexConfig {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [System.Collections.IDictionary]$Base,
        
        [Parameter(Mandatory)]
        [System.Collections.IDictionary]$Overlay
    )

    process {
        $merged = [ordered]@{}
        foreach ($key in $Base.Keys) {
            $merged[$key] = $Base[$key]
        }
        foreach ($key in $Overlay.Keys) {
            if ($Base.Contains($key) -and $Base[$key] -is [System.Collections.IDictionary] -and $Overlay[$key] -is [System.Collections.IDictionary]) {
                $merged[$key] = Merge-AuspexConfig -Base $Base[$key] -Overlay $Overlay[$key]
            } else {
                $merged[$key] = $Overlay[$key]
            }
        }
        return $merged
    }
}
