---
layout: default
title: Rendered Element Showcase
output-title: true
tags: [ui, elements, display, container]
description: A clean, technical frame wrapper for showcasing live HTML and UI component renderings.
---

The `rendered-el-showcase.html` component wraps live interactive components or HTML snippets in a professional design frame with technical background grids, slanted lines, titles, and site logos.

## **Live Example**

{% capture button_html %}
{% include comps/button.html text="Interactive Demo" color="#b79ced" icon="zap" %}
{% endcapture %}

{% include comps/rendered-el-showcase.html title="Interactive Button Preview" icon="mouse-pointer" content=button_html %}

{% capture res_eg %}
{% raw %}
```liquid
{% capture button_html %}
  {% include comps/button.html text="Interactive Demo" color="#b79ced" icon="zap" %}
{% endcapture %}

{% include comps/rendered-el-showcase.html 
   title="Interactive Button Preview" 
   icon="mouse-pointer" 
   content=button_html %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=res_eg %}

---

## **API Reference**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The HTML/Liquid code content to render inside the showcase. |
| `title` | String | `"Rendered Element"` | Title text displayed in the left header. |
| `icon` | String | `"eye"` | Lucide icon name displayed beside the title. |
| `size` | Integer | `14` | The size of the header icon in pixels. |
| `class` | String | | Optional CSS class to append to the container. |
