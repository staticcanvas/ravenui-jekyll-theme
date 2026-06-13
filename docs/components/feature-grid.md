---
layout: default
title: Feature Grid
output-title: true
tags: [ui, layout, grid]
description: A responsive wrapper for organizing feature cards and other highlights.
---

The `feature-grid.html` component provides the necessary layout structure for displaying a collection of feature cards. It supports standard manual card layout injection (via `content`) and dynamic data-driven rendering (via `data_source` or `items`), with customizable grid column sizing.

## **Live Example (Captured Content)**

{% capture grid_demo %}
{% include comps/feature-card.html icon="cpu" title="Fast" description="Built with Jekyll." %}
{% include comps/feature-card.html icon="shield" title="Secure" description="Static files only." %}
{% include comps/feature-card.html icon="code" title="Modern" description="SCSS & Liquid." %}
{% endcapture %}

{% include comps/feature-grid.html content=grid_demo %}

{% capture grid_code %}
{% raw %}
```liquid
{% capture grid_content %}
    {% include comps/feature-card.html icon="cpu" title="Fast" description="Built with Jekyll." %}
    {% include comps/feature-card.html icon="shield" title="Secure" description="Static files only." %}
    {% include comps/feature-card.html icon="code" title="Modern" description="SCSS & Liquid." %}
{% endcapture %}

{% include comps/feature-grid.html content=grid_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=grid_code %}

---

## **Live Example (Data-driven)**

{% include comps/feature-grid.html data_source="features_demo" columns=3 %}

{% capture data_code %}
{% raw %}
```liquid
<!-- Sourcing from docs/_data/features_demo.yml with a 3-column layout -->
{% include comps/feature-grid.html data_source="features_demo" columns=3 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=data_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **Feature Grid Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | HTML or Liquid content (fallback for manual card injection). |
| `data_source` | String | | Filename (without extension) under `_data/` containing a list of feature card objects. |
| `items` | Array | | An array of custom feature objects passed directly. |
| `columns` | Number | `3` | Number of columns on wide screens (2, 3, or 4). |
| `class` | String | | Optional custom CSS class. |

### **Feature Item Properties**

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | | The title of the feature. |
| `description` | String | | The description text. |
| `icon` | String | | The Lucide icon name to render. |
| `color` | String | | Optional hex code/CSS color for the icon. |
| `link` | String | | Optional URL to make the entire card clickable. |

