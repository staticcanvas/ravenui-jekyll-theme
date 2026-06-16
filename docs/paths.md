---
layout: default
title: Path Configurations
output-title: true
tags: [liquid, paths, URL]
description: Guide on URL formats, base paths, assets resolution, and trailing slash compatibility rules in RavenUI.
permalink: /paths/
enable_search: true
---

This page explains the URL routing schemes, asset resolution methods, flat-file URL structures, and path helper filters used in **RavenUI**.

---

{% include comps/heading.html tag="h2" text="Jekyll Path Filters" icon="link" size=20 %}

To ensure links resolve correctly regardless of host directories or custom domains, always pass URLs through Jekyll's built-in filters:

* **`relative_url`:** Prepends `site.baseurl` to the input path. Use this for all internal site-wide links.
  {% raw %}
  ```html
  <a href="{{ '/about/' | relative_url }}">About</a>
  ```
  {% endraw %}
* **`absolute_url`:** Prepends `site.url` and `site.baseurl` to the input. Use this for metadata references, open-graph tags, RSS feeds, and external callbacks.
  {% raw %}
  ```html
  <meta property="og:url" content="{{ page.url | absolute_url }}">
  ```
  {% endraw %}

---

{% include comps/heading.html tag="h2" text="URL Normalization" icon="refresh-cw" size=20 %}

RavenUI includes a normalization pipeline for links to ensure active state highlights map correctly in navigation lists and sidebars:

### **1. Trailing Slashes**
Links are normalized to ignore trailing slashes during matching. Whether a route is defined as `/configuration/` or `/configuration`, the navigation engine resolves both to the same resource.

### **2. Extension Handling**
Both directory-based layouts (`/about/index.html` → `/about/`) and flat-page extensions (`/about.html`) are supported. Trailing `.html` extensions are stripped during active route verification to ensure highlight consistency.

---

{% include comps/heading.html tag="h2" text="Flat vs. Nested Folders" icon="folder-open" size=20 %}

You can organize page source files in two ways without breaking routing or breadcrumbs navigation:

* **Nested Structures:** Source files are grouped in folders matching their paths:
  ```text
  docs/
  ├── components/
  │   ├── button.md          # Permalink: /components/button/
  │   └── card.md            # Permalink: /components/card/
  ```
* **Flat Structure:** Source files are located in the root, with permalinks managing structure:
  ```text
  docs/
  ├── components-button.md   # Permalink: /components/button/
  ├── components-card.md     # Permalink: /components/card/
  ```
The breadcrumbs template (`breadcrumbs.html`) dynamically decodes slashes in permalinks to reconstruct hierarchical parent nodes, ensuring correct navigation display even with a flat folder layout.

---

{% include comps/heading.html tag="h2" text="Asset Path Resolution" icon="image" size=20 %}

Theme stylesheets, JS modules, and image assets are resolved using the relative URL filter:

{% raw %}
* **Core CSS:** Located at `assets/css/main.scss` and loaded via:
  ```html
  <link rel="stylesheet" href="{{ '/assets/css/main.css' | relative_url }}">
  ```
* **JS Modules:** Loaded as ESM type modules:
  ```html
  <script type="module" src="{{ '/assets/js/ui.js' | relative_url }}"></script>
  ```
* **Image Assets:** Referenced similarly inside markdown or HTML templates:
  ```html
  ![Brand Logo]({{ '/assets/images/logo.svg' | relative_url }})
  ```
{% endraw %}
