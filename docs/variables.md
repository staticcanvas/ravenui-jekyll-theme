---
layout: default
title: Variables Reference
output-title: true
tags: [liquid, variables, configuration]
description: Reference guide for global Jekyll/Liquid variables, custom site settings, and page metadata in RavenUI.
permalink: /variables/
enable_search: true
---

This page provides a comprehensive reference of all Jekyll global objects, custom theme variables, and page-level metadata options supported by the **RavenUI Jekyll Theme**.

---

{% include comps/heading.html tag="h2" text="Jekyll Global Objects" icon="globe" size=20 %}

Liquid templates have access to standard global scopes:

* **`site`:** Contains global configuration values defined in `_config.yml` (e.g. `site.title`, `site.data`).
* **`page`:** Contains page-specific metadata defined in the front-matter block of the active file.
* **`layout`:** Holds metadata defined in the active layout template file.
* **`content`:** The rendered HTML content of the page or post (used inside layout templates).

---

{% include comps/heading.html tag="h2" text="Global Theme Settings" icon="settings" size=20 %}

Custom theme options are grouped under `site.theme_settings` in `_config.yml`. Here are the key configuration namespaces:

### **1. Navigation & Theme Manager**
* **`site.theme_settings.themes`:** Array of supported theme names (e.g., `['dark', 'light']`). If 2 items are provided, a toggle button is shown. If 3+ items are provided, a dropdown is displayed.
* **`site.theme_settings.versions`:** List of site version strings (e.g., `['v1.0.0', 'v1.1.0']`) to populate the version switcher dropdown in the sidebar.

### **2. Spacing and Density**
* **`site.theme_settings.header.sticky`:** Set `true` to make the top navigation bar sticky at the top of the viewport.
* **`site.theme_settings.header.density`:** Layout density for the top-bar (`compact`, `default`, or `relaxed`).

### **3. Table of Contents (TOC)**
* **`site.theme_settings.toc.style`:** The layout variant for TOC links (`simple`, `lines`, or `nodes`).
* **`site.theme_settings.toc.density`:** Layout scale of TOC items (`compact`, `default`, or `relaxed`).
* **`site.theme_settings.toc.animations`:** Boolean flag to enable/disable scroll-highlight animations on TOC anchors.

### **4. Borders & Backgrounds**
* **`site.theme_settings.borders.style`:** Global border style override (`solid`, `dashed`, etc.).
* **`site.theme_settings.background.gradient`:** Enables customizable gradient cover layers.
* **`site.theme_settings.background.backdrop_pattern`:** Backdrop styling patterns (`grid`, `dots`, or `diagonal` lines).

---

{% include comps/heading.html tag="h2" text="Page Front-Matter Overrides" icon="file-text" size=20 %}

Each markdown or HTML page can override layout and behavior details by declaring variables in its front-matter header:

### **General Metadata**
* **`layout`:** The layout template name to apply (`default`, `blank`, `article`, `blog`, `post`, etc.).
* **`title`:** The page title string.
* **`output-title`:** Set `true` to automatically output the title header at the top of the content area.
* **`description`:** Description snippet (used for SEO meta tags and index previews).

### **Search and Navigation**
* **`enable_search`:** Set `true` (opt-in) to index this page in Pagefind or the local JSON search directory. Defaults to `false`.
* **`enable_nav`:** Controls whether document listings appear in sidebar loops (defaults to `true` for collection files).
* **`draft`:** Set `true` to flag the document as unpublished. A visual "DRAFT" badge will render if running in development mode.

---

{% include comps/heading.html tag="h2" text="Component Data Sourcing" icon="database" size=20 %}

Dynamic components (such as `timeline`, `steps`, `datatable`, `chartjs`) retrieve data from local files or inline properties:

* **`data_source`:** Dot-notation path to a file inside the `_data/` directory (e.g. `data_source="nested.history"`). Supports YAML, JSON, CSV, and TSV formats.
* **`items` / `table_items`:** Inline array block passed directly to the Liquid include to render data without creating external data files.
