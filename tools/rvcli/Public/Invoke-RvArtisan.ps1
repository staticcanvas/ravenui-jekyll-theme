# RavenUI CLI - Artisan Component Scaffolder

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Invoke-RvArtisan {
    [CmdletBinding()]
    param(
        [string[]]$Args = @(),
        [string]$WorkspaceRoot = "."
    )

    $compName = $null
    if ($Args.Count -gt 0) {
        $compName = $Args[0]
    }

    if (-not $compName) {
        # Interactive prompting if name is missing
        Write-Host (New-CTString "{ct:accent:b:RavenUI Artisan Scaffolder}")
        Write-Host "Please enter the name of the new component (e.g. badge, user-card):" -NoNewline
        Write-Host " > " -ForegroundColor Gray -NoNewline
        $compName = [Console]::ReadLine()
    }

    $compName = $compName.Trim().ToLower()
    if ([string]::IsNullOrEmpty($compName) -or $compName -match '\s') {
        Write-RvLog -Level "fail" -Message "Invalid component name. Component names should be alphanumeric with hyphens, and contain no spaces." -Context "artisan"
        return
    }

    Write-RvLog -Level "act" -Message "Scaffolding component '$compName'..." -Context "artisan"

    # Define file paths
    $includeDir = [System.IO.Path]::Combine($WorkspaceRoot, "_includes", "comps")
    $docsDir = [System.IO.Path]::Combine($WorkspaceRoot, "docs", "components")
    $dataDir = [System.IO.Path]::Combine($WorkspaceRoot, "_data")

    $includePath = [System.IO.Path]::Combine($includeDir, "${compName}.html")
    $docsPath = [System.IO.Path]::Combine($docsDir, "${compName}.md")
    $dataPath = [System.IO.Path]::Combine($dataDir, "${compName}.yml")

    # Create directories if missing
    if (-not [System.IO.Directory]::Exists($includeDir)) {
        [System.IO.Directory]::CreateDirectory($includeDir) | Out-Null
    }
    if (-not [System.IO.Directory]::Exists($docsDir)) {
        [System.IO.Directory]::CreateDirectory($docsDir) | Out-Null
    }
    if (-not [System.IO.Directory]::Exists($dataDir)) {
        [System.IO.Directory]::CreateDirectory($dataDir) | Out-Null
    }

    # Verify if files already exist
    if ([System.IO.File]::Exists($includePath) -or [System.IO.File]::Exists($docsPath)) {
        Write-RvLog -Level "fail" -Message "Component files already exist for '$compName'. Scaffolding aborted to prevent overwriting." -Context "artisan"
        return
    }

    # 1. Liquid Include Template
    $titleCamel = (Get-Culture).TextInfo.ToTitleCase(([string]$compName).Replace("-", " "))
    $includeContent = @"
{%- comment -%}
Component__: $titleCamel
Purpose____: Displays a custom $compName component styled with the RavenUI design system.
Caveats____: Output must remain collapsed on a single line to prevent Kramdown paragraph wrapping.
Usage______: {% include comps/${compName}.html text="Hello World" color="accent" %}
{%- endcomment -%}
<div class="rd-${compName} rd-${compName}--{{ include.color | default: 'accent' }}" id="{{ include.id | default: '${compName}' }}">
  <span class="rd-${compName}-text">{{ include.text | default: 'Scaffolded $titleCamel' }}</span>
</div>
"@

    # 2. Markdown Docs Template
    $docsContent = @"
---
layout: default
title: **$titleCamel**
permalink: /components/${compName}/
enable_search: true
---

# **$titleCamel Component**

The \`$compName\` component is a presentation element scaffolded using the RavenUI CLI.

## **Visual Layout**

{% include comps/rendered-el-showcase.html title="$titleCamel" %}
{% include comps/${compName}.html text="Hello RavenUI!" color="accent" %}

## **Properties API**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| \`id\` | String | \`$compName\` | The HTML identifier of the wrapper element. |
| \`text\` | String | \`Scaffolded $titleCamel\` | Label text to display. |
| \`color\` | String | \`accent\` | Theme color accent class. |

## **Usage Guidelines**

To embed this component in your markdown content pages, include the Liquid tag:

\`\`\`liquid
{% include comps/${compName}.html text="Dynamic Text" color="primary" %}
\`\`\`
"@

    # 3. YML Mock Data Template
    $dataContent = @"
# Mock dataset for $compName component
items:
  - id: 1
    text: "First sample item"
    color: "accent"
  - id: 2
    text: "Second sample item"
    color: "primary"
"@

    # Write files using .NET File classes
    try {
        [System.IO.File]::WriteAllText($includePath, $includeContent)
        [System.IO.File]::WriteAllText($docsPath, $docsContent)
        [System.IO.File]::WriteAllText($dataPath, $dataContent)

        Write-RvLog -Level "suc" -Message "Scaffolded include: _includes/comps/${compName}.html" -Context "artisan"
        Write-RvLog -Level "suc" -Message "Scaffolded docs: docs/components/${compName}.md" -Context "artisan"
        Write-RvLog -Level "suc" -Message "Scaffolded data: _data/${compName}.yml" -Context "artisan"
        Write-RvLog -Level "suc" -Message "Artisan component scaffolding complete for '$compName'!" -Context "artisan"
    } catch {
        Write-RvLog -Level "fail" -Message "Failed to write component files: $_" -Context "artisan"
    }
}
