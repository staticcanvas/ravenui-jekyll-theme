---
layout: default
title: 'JSON Data Files'
output-title: true
tags: [data, json, configuration]
description: 'Working with JSON data files in _data/ for use with RavenUI components and Liquid templates.'
enable_search: true
permalink: /data-json/
---

Jekyll supports `.json` files in `_data/` alongside YAML and CSV. JSON is the native format for JavaScript APIs and is the appropriate choice when data is sourced from external systems, generated programmatically by CI scripts, or exported from a database — scenarios where human authoring is not the primary concern.

{% include comps/heading.html tag="h2" text="Creating a JSON Data File" icon="file" size=20 %}

### **Array Format**

The most common JSON data file is a top-level array, where each element is an object representing one record:

```json
// _data/packages.json
[
  {
    "name": "ravenui-core",
    "version": "1.3.4",
    "type": "theme",
    "downloads": 12048,
    "status": "stable"
  },
  {
    "name": "ravenui-icons",
    "version": "2.1.0",
    "type": "plugin",
    "downloads": 8820,
    "status": "stable"
  }
]
```

### **Named Object Format**

A top-level object is useful for configuration or settings data where you want to access specific keys directly:

```json
// _data/site_config.json
{
  "api": {
    "endpoint": "https://api.example.com/v2",
    "timeout": 5000,
    "retries": 3
  },
  "features": {
    "search": true,
    "analytics": false
  }
}
```

---

{% include comps/heading.html tag="h2" text="Accessing JSON in Liquid" icon="code" size=20 %}

`site.data.packages` accesses `_data/packages.json` identically to how it would access `_data/packages.yml`. The underlying format is transparent to Liquid.

### **Iterating an Array**

{% raw %}
```liquid
{% for pkg in site.data.packages %}
  <p>{{ pkg.name }} v{{ pkg.version }} — {{ pkg.status }}</p>
{% endfor %}
```
{% endraw %}

### **Filtering**

{% raw %}
```liquid
{% assign stable = site.data.packages | where: "status", "stable" %}
{% for pkg in stable %}
  {{ pkg.name }}
{% endfor %}
```
{% endraw %}

### **Accessing a Named Object Key**

{% raw %}
```liquid
{{ site.data.site_config.api.endpoint }}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="Accessing JSON in RavenUI Components" icon="package" size=20 %}

Pass the filename (without extension) to `data_source`. The component resolves the data from `site.data` regardless of the underlying file format — YAML, JSON, and CSV are all treated identically at the component level.

{% raw %}
```liquid
{% include comps/datatable.html
  data_source="packages"
  headers="name:Package,version:Version,type:Type,downloads:Downloads,status:Status" %}
```
{% endraw %}

JSON data files work with any data-driven component:

{% raw %}
```liquid
{% include comps/timeline.html
  data_source="changelog"
  title_key="version"
  body_key="summary" %}
```
{% endraw %}

{% raw %}
```liquid
{% include comps/roadmap.html data_source="roadmap" %}
```
{% endraw %}

{% raw %}
```liquid
{% include comps/chartjs.html
  data_source="metrics"
  chart_type="bar"
  label_key="month"
  value_key="downloads" %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="Nested JSON Objects" icon="git-branch" size=20 %}

Nested JSON structures are traversed using standard Liquid dot-notation:

```json
// _data/config.json
{
  "api": {
    "endpoint": "https://api.example.com/v2",
    "auth": {
      "type": "bearer",
      "header": "Authorization"
    }
  }
}
```

{% raw %}
```liquid
{{ site.data.config.api.endpoint }}
{{ site.data.config.api.auth.type }}
```
{% endraw %}

{% include comps/callout.html type="note" title="Array Access in Liquid" content="Liquid does not support index-based access like `site.data.items[0]` directly in most filters. Use `first`, `last`, or `where` filters to extract specific elements from JSON arrays." %}

---

{% include comps/heading.html tag="h2" text="Generating JSON Data in CI" icon="terminal" size=20 %}

The `rvcli` toolchain (`git-tags`, `releases`) generates YAML by default. For JSON output, use a PowerShell one-liner in your CI pipeline or a Jekyll plugin.

**PowerShell example — convert YAML to JSON for a data file:**

```powershell
# Generate packages.json from a build manifest
$manifest = Get-Content ./build/manifest.json | ConvertFrom-Json
$manifest | ConvertTo-Json -Depth 5 | Set-Content ./docs/_data/packages.json
```

**Inline Jekyll plugin (`.rb`) example — write JSON from an API:**

```ruby
# _plugins/fetch_data.rb
Jekyll::Hooks.register :site, :after_init do |site|
  require 'json'
  require 'open-uri'
  data = JSON.parse(URI.open('https://api.example.com/packages').read)
  site.data['packages'] = data
end
```

{% include comps/callout.html type="note" title="Plugin Availability" content="Custom Jekyll plugins are not supported on GitHub Pages (safe mode). Use a CI step to pre-generate JSON data files and commit them, or use Cloudflare Pages / Netlify where plugins are available." %}

---

{% include comps/heading.html tag="h2" text="JSON vs. YAML" icon="toggle-left" size=20 %}

| Criterion | JSON | YAML |
| :--- | :--- | :--- |
| **Programmatic generation** | 🟩 Excellent — native to most runtimes | 🟧 Possible but requires a YAML serialiser |
| **Human authoring** | 🟧 Verbose, no comments, strict syntax | 🟩 Clean, supports comments and anchors |
| **Nested structures** | 🟩 Fully supported | 🟩 Fully supported |
| **Flat tabular data** | 🟧 Verbose for simple arrays | 🟩 Concise list syntax |
| **CI integration** | 🟩 Direct from API responses | 🟧 Requires conversion step |
| **Error verbosity** | 🟥 Parse errors can be cryptic | 🟩 Line-level error reporting |

Both formats are fully supported by Jekyll and RavenUI. Choose based on the origin of your data, not preference.

---

{% include comps/heading.html tag="h2" text="Validation" icon="check-circle" size=20 %}

Malformed JSON causes Jekyll to raise a parse error at startup and halt the build entirely — no partial rendering occurs. Always validate JSON files before committing.

### **Recommended Validation Approaches**

- **Editor integration:** VS Code and JetBrains IDEs validate JSON automatically in `_data/` files.
- **CLI linter:** Use `jq` to validate from the terminal:

```bash
jq empty _data/packages.json && echo "Valid JSON"
```

- **CI gate:** Add a validation step to your pipeline before the Jekyll build:

```bash
# Validate all JSON data files
find docs/_data -name "*.json" -exec jq empty {} \; && echo "All JSON files valid"
```

{% include comps/callout.html type="caution" title="Trailing Commas" content="JSON does not permit trailing commas after the last element in an array or object. This is the most common source of parse errors when authoring JSON by hand. Use a linter to catch these before pushing." %}
