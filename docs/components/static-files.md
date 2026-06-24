---
layout: default
title: Static Files Indexer
output-title: true
tags: [ui, documentation, lists, files]
description: A dynamic list and grid indexing component that traverses and displays site static files (like PDFs, ZIPs, or images) filtered by path and extension.
enable_search: true
depends_upon:
  - name: "Lucide Icons"
    type: js-cdn
    version: "0.400.0"
    link: "https://lucide.dev"
    description: "Used to render file-type specific icons and action triggers dynamically."
---

Use `static-files.html` to display download lists or grids of non-front-matter documents, archives, code scripts, or image resources uploaded in your workspace directories.

{% include comps/heading.html tag="h2" text="Live Examples" icon="eye" size=20 %}

### **List Layout (Default)**
Lists static files in a streamlined row layout with sizes, modified dates, and download buttons:

{% include comps/static-files.html path="assets/" title="Assets & Logos" icon="image" %}

### **Grid Layout**
Displays static files as cards in a responsive CSS grid, wrapping long filenames and displaying prominent file-type icons:

{% include comps/static-files.html path="assets/" layout="grid" title="Resource Grid" icon="grid" %}

---

{% include comps/heading.html tag="h2" text="Usage" icon="code" size=20 %}

Pass the parameter options to filter the output by folder path and file extension matching:

```liquid
{% raw %}
{% include comps/static-files.html path="assets/docs" ext=".pdf,.zip" title="Manuals & Downloads" layout="grid" %}
{% endraw %}
```

---

{% include comps/heading.html tag="h2" text="Properties & Options" icon="sliders" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `path` | String | `""` | Subdirectory path keyword to filter files (e.g. `assets/docs/`). |
| `ext` | String | `""` | Comma-separated list of file extensions to include (e.g. `.pdf,.zip`). |
| `title` | String | `"Files & Resources"` | Header title text. |
| `icon` | String | `"download"` | Lucide icon name for the container header. |
| `layout` | String | `"list"` | Render style: `list` or `grid`. |
| `show_size` | Boolean | `true` | Show human-readable size of each file (formatted to KB/MB). |
| `show_date` | Boolean | `true` | Show modified date (formatted to `MMM DD, YYYY`). |
