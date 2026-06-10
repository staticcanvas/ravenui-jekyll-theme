---
layout: default
title: Feature Grid
output-title: true
tags: [ui, layout, grid]
description: A responsive wrapper for organizing feature cards and other highlights.
---

The `feature-grid.html` component provides the necessary layout structure for displaying a collection of feature cards. It handles columns, spacing, and responsive breakpoints automatically.

{% include comps/heading.html tag="h2" text="Live Example" icon="grid" size=20 %}

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
    {% include comps/feature-card.html ... %}
{% endcapture %}

{% include comps/feature-grid.html content=grid_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=grid_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The HTML or Liquid content (usually feature cards). |
