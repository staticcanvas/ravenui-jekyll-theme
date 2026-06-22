---
layout: default
title: Sidebar Component
parent: /components/
description: Renders a modular collapsible navigation sidebar tree supporting inline canvas layout integration.
enable_search: true
---

The `sidebar.html` component renders the navigation tree of the site. It automatically iterates over links in `_data/navigation.yml` and, if enabled, dynamic Jekyll collections documents, rendering their titles, sections, subgroups, draft badges, and icons.

💠 **Parameters:**

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `inline` | Boolean | If `true`, strips out fixed/sticky positioning and max-height constraints, forcing it to render as a static box inline (default: `false`). |
| `force_brand` | Boolean | Forces the brand logo, title, and version switcher to render even if header navigation is globally enabled (default: `false`). |

---

## **Usage Example**

To render a static inline sidebar panel within a custom viewport mockup or blank dashboard layout:

{% capture sidebar_example %}
{% raw %}
```liquid
<div style="display: grid; grid-template-columns: 280px 1fr; gap: 1rem;">
  {% include comps/sidebar.html inline=true force_brand=true %}
  <main class="content-panel">
    <!-- Main content goes here -->
  </main>
</div>
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=sidebar_example %}

---

## **Visual Adjustments**

You can configure the global padding of the sidebar links using `_config.yml` settings under:

{% capture config_example %}
```yaml
theme_settings:
  sidebar:
    padding: "compact" # Options: compact, tight, comfy, spacy
```
{% endcapture %}
{% include comps/example-code.html content=config_example %}
