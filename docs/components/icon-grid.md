---
layout: default
title: Icon Showcase Grid
output-title: true
tags: [ui, elements, layouts, icons]
description: A responsive grid layout component to showcase groups of icons with instant copy-to-clipboard triggers.
---

The `icon-grid.html` component provides a visually structured grid for displaying lists of Lucide icons. Clicking any cell in the grid automatically copies the corresponding Jekyll `{% raw %}{% include comps/icon.html name="..." %}{% endraw %}` snippet to the clipboard with visual success feedback.

{% include comps/heading.html tag="h2" text="Live Example" icon="grid" size=20 %}

{% include comps/icon-grid.html icons="home,settings,search,download,star,heart,x,check,arrow-right,shield,activity,bell,zap,calendar,edit-3,menu" %}

{% capture grid_eg %}
{% raw %}
```liquid
{% include comps/icon-grid.html icons="home,settings,search,download,star,heart,x,check,arrow-right,shield,activity,bell,zap,calendar,edit-3,menu" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=grid_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **icon-grid.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `icons` | String | | A comma-separated list of Lucide icon names to show (e.g. `home,settings,star`). |
| `size` | Integer | `18` | The size of the Lucide icons rendered inside each card in pixels. |
| `class` | String | | Optional custom CSS class to append to the grid container. |
