---
layout: default
title: Developer Guide
output-title: true
tags: [architecture, development, advanced]
description: A comprehensive guide to RavenUI's folder structure, extension points, and CLI development.
permalink: /developer-guide/
enable_search: true
---

This developer guide provides an architectural overview of the **RavenUI Jekyll Theme**, outlining its folder layout, rendering pipelines, styling structure, custom plugins, and developer extension points.

---

{% include comps/heading.html tag="h2" text="Directory Layout" icon="folder" size=20 %}

Understanding where files live is crucial when building or customizing a site with RavenUI. Here is a breakdown of the core directory structure:

```text
├── _includes/               # Reusable Liquid layout fragments
│   ├── core/                # Base layout frames (header, footer, sidebar, head, etc.)
│   └── comps/               # 70+ modular component template includes
├── _layouts/                # Page templates (default, blank, article, blog, etc.)
├── _plugins/                # Custom Ruby extensions (generators, tags, filters)
├── _sass/                   # Modular SASS design system files
│   ├── ravenui-sp/          # Core layout, reset, and default component styling
│   └── ravenui-sp.scss      # Main SASS router importing the theme stylesheets
├── assets/                  # Public web assets (JS modules, custom stylesheets, icons)
├── bin/                     # Ruby gem CLI wrapper (invokes rvcli)
├── tools/                   # Local automation utilities and script assets
│   └── rvcli/               # The PowerShell rvcli codebase (Public, Private, etc.)
└── docs/                    # The Jekyll site containing this documentation
```

---

{% include comps/heading.html tag="h2" text="Theme Layouts" icon="layout" size=20 %}

Layouts act as the outer shells for pages and posts. RavenUI features standard and specialized templates to fit various documentation and presentation needs:

### **1. The Three-Column Layout (default.html)**
The main workhorse of the theme. It coordinates the left-hand navigation sidebar, the central content area, and the right-hand scroll-interactive Table of Contents (TOC).

### **2. The Clean Canvas Layout (blank.html)**
Completely strips out the headers, sidebar navigations, footer sections, and TOC. This is ideal for landing pages, slideshow decks, dashboards, or full-width WebGL templates.

### **3. The Article Layout (article.html)**
Designed for deep-dive technical posts and tutorials. It appends reading-time estimation indicators, post pagination controls, and author bio lookups.

### **4. Collection Layouts (collection-*.html)**
A suite of 9 layouts (including `collection-grid`, `collection-list`, `collection-commands`, `collection-cli`, etc.) that support automatic date/weight/title sorting and tag filtering.

---

{% include comps/heading.html tag="h2" text="Styling & SASS Architecture" icon="palette" size=20 %}

RavenUI relies on a deterministic, variable-driven CSS variables palette mapped through SASS. It allows rapid brand styling changes without touching structural CSS rules.

### **CSS Custom Properties**
Core variables are declared inside `_sass/ravenui-sp/_root.scss`:
* `--rd-bg-base`: Core viewport background.
* `--rd-clr-accent`: High-contrast highlight color.
* `--rd-font-sans`: Primary user-interface font-stack.
* `--rd-font-mono`: Code-blocks and technical data font-stack.

### **Styling Overrides**
To override styles cleanly:
1. Custom variables can be declared in `_sass/custom-variables.scss` before importing the theme.
2. Custom selectors can be appended in `assets/css/main.scss` below the `@import "ravenui-sp";` statement.

---

{% include comps/heading.html tag="h2" text="Extending the Component Library" icon="package" size=20 %}

Adding a new custom component is straightforward and follows our design system principles.

### **Step 1: Create the Liquid Include**
Add your HTML template to `_includes/comps/your-component.html`. Always start with a descriptive header block detailing the component parameters and usage.
{% raw %}
```liquid
{%- comment -%}
Component__: YourComponent
Purpose____: Briefly explain what this does.
Caveats____: List any dependencies or browser restrictions.
Usage______: {% include comps/your-component.html parameter="value" %}
{%- endcomment -%}
```
{% endraw %}

### **Step 2: Read Variables and Apply Defaults**
In the component file, resolve inputs using page/site configuration fallbacks:
{% raw %}
```liquid
{%- assign param = include.parameter | default: page.your_param | default: "fallback" -%}
```
{% endraw %}

### **Step 3: Register in Navigation and Write Docs**
Create a corresponding documentation page in `docs/components/your-component.md` describing the API parameters, and add it to `docs/_data/navigation.yml` to expose it in the sidebar.

---

{% include comps/heading.html tag="h2" text="Custom Ruby Plugins" icon="zap" size=20 %}

RavenUI ships with several custom Ruby plugins located under `_plugins/` to automate tasks and extend the Liquid engine:

> [!NOTE]
> **Plugin Integration Strategy**
> Custom plugins are kept internal to the theme's core within the `_plugins/` directory rather than being extracted into separate Ruby gems. This maintains a zero-configuration, out-of-the-box developer experience, ensures tight coupling with modular layout directories (like `_includes/comps`), and prevents packaging and dependency version mismatch overhead.

* **Block Component Tag (rd):** Allows calling theme components with complex, captured multi-line markdown contents:
  {% raw %}
  ```liquid
  {% rd card title="Block Card" %}
  This content supports **bold markdown** and multiple paragraphs.
  {% endrd %}
  ```
  {% endraw %}
* **Inline Component Tag (rdi):** Shorthand inline notation.
* **Runtime Metadata Generator:** Injects active environment compiler, Gem, and engine versions into `site.config` during compilation.
* **OG Image Generator:** Generates custom social share SVG cards dynamically.
* **Jekyll Hooks Integration (`_plugins/hooks.rb`):** Automates compilation and optimization steps during the build lifecycle:
  * 🔹 **Pre-Build (`after_reset`):** Generates tag history (`_data/git-tags.yml`) from git logs when `hooks.git_tags` is enabled.
  * 🔹 **Post-Build (`post_write`):** Automatically indexes the output with Pagefind (`hooks.pagefind`) and minifies site assets (`hooks.minify`).

---

{% include comps/heading.html tag="h2" text="Extending the CLI (rvcli)" icon="terminal" size=20 %}

The `rvcli` command line utility is structured around modular, file-per-cmdlet PowerShell scripts under `tools/rvcli/Public/`.

### **Adding a New CLI Command**
To add a new command, follow this 4-step wiring process:
1. **Create the cmdlet script:** Save `tools/rvcli/Public/Invoke-RvYourCommand.ps1`. Ensure it has proper parameters and invokes `Write-RvLog` for user communication.
2. **Wire the CLI router:** Add a routing handler case for `yourcommand` inside `tools/rvcli/Start-RvCli.ps1`.
3. **Register command help:** Add a help routing case inside `tools/rvcli/Show-RvCommandHelp.ps1`.
4. **Define command help output:** Add descriptive text for parameters inside `Show-RvCommandHelp.ps1`.
