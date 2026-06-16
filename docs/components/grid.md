---
layout: default
title: Layout Grid
output-title: true
tags: [ui, components, layout]
description: A flexible, responsive CSS grid container for composing multi-column layouts.
enable_search: true
---
The `grid.html` component provides a responsive CSS Grid container. It simplifies layout composition by allowing you to easily arrange sub-components (like cards or metrics) into multi-column layouts that adapt to screen sizes.

{% include comps/heading.html tag="h2" text="Live Example" icon="layout" size=20 %}

{% capture grid_content %}
    <div style="background: var(--rd-bg-surface); border: var(--rd-border); border-radius: var(--rd-radius); padding: 1.5rem; text-align: center;">Column 1</div>
    <div style="background: var(--rd-bg-surface); border: var(--rd-border); border-radius: var(--rd-radius); padding: 1.5rem; text-align: center;">Column 2</div>
    <div style="background: var(--rd-bg-surface); border: var(--rd-border); border-radius: var(--rd-radius); padding: 1.5rem; text-align: center;">Column 3</div>
{% endcapture %}

{% include comps/grid.html 
    content=grid_content 
    cols=3 
    gap="lg" 
%}

{% capture grid_code %}
{% raw %}
```liquid
{% capture grid_content %}
    <div style="...">Column 1</div>
    <div style="...">Column 2</div>
    <div style="...">Column 3</div>
{% endcapture %}

{% include comps/grid.html 
    content=grid_content 
    cols=3 
    gap="lg" 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=grid_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The HTML or Liquid content of the grid items. |
| `cols` | Number | `3` | Number of columns on desktop viewports. |
| `tablet_cols` | Number | `2` | Number of columns on tablet viewports. |
| `mobile_cols` | Number | `1` | Number of columns on mobile viewports. |
| `gap` | String | `md` | Grid gap size: `xs`, `sm`, `md`, `lg`, `xl`, or a custom CSS size. |
| `class` | String | | Additional CSS classes for custom styling. |
| `style` | String | | Custom inline CSS rules for the grid container. |
