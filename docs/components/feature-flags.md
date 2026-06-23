---
layout: default
title: Feature Flags
output-title: true
tags: [architecture, setup, custom]
description: Global configuration switches and status dashboard for RavenUI theme modules.
enable_search: true
permalink: /components/feature-flags/
---

The `feature-flags.html` component provides a real-time visual dashboard showing the status (Active or Inactive) of all theme settings and feature toggles compiled inside your Jekyll `_config.yml`.

{% include comps/heading.html tag="h2" text="Live Dashboard" icon="layout-grid" size=20 %}

{% include comps/feature-flags.html %}

---

{% include comps/heading.html tag="h2" text="Usage" icon="code" size=20 %}

To embed this feature flags dashboard on any page of your documentation:

{% raw %}
```liquid
{% include comps/feature-flags.html %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="CLI Toggle Commands" icon="terminal" size=20 %}

You can manage all workspace feature switches directly from your terminal using the RavenUI CLI `toggle` command. This utilizes the underlying configuration traversal engine to query, enable, disable, or toggle properties.

### **List Feature Toggles**
To list all defined feature flags and their current status:
```bash
./rvcli toggle list
```

### **Toggle a Feature**
To toggle the active state of a feature (using either its dot-notation config path or its human-readable name):
```bash
./rvcli toggle toggle theme_settings.toc.enabled
./rvcli toggle toggle "Table of Contents"
```

### **Explicit Enable / Disable**
To explicitly enable or disable a feature:
```bash
./rvcli toggle enable theme_settings.sidebar.enabled
./rvcli toggle disable "Sidebar Navigation"
```

---

{% include comps/heading.html tag="h2" text="Dynamic Plugin Dependencies" icon="puzzle" size=20 %}

Certain features have direct dependencies on Jekyll plugins. When enabling or disabling these toggles via the CLI, the corresponding plugin dependencies are automatically managed inside your `_config.yml` `plugins:` array:

| Feature Toggle | Configuration Path | Associated Jekyll Plugin |
| :--- | :--- | :--- |
| **Discussion Comments** | `theme_settings.feedback.comments.enabled` | `jekyll-comments` |
| **Page Pagination** | `theme_settings.page_navigation.enabled` | `jekyll-paginate` |
| **Search Integration** | `theme_settings.search.enabled` | `jekyll-search` |

