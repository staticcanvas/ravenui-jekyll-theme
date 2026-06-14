---
layout: default
title: Image Component
output-title: true
tags: [ui, elements, media, image]
description: High-performance image component with skeletons, lazy loading, and blur-up loading.
enable_search: true
---
The `image.html` component provides a wrapper for images. It features progressive blur-up loading using low-resolution placeholders (or an animated skeleton loader) to achieve smooth transitions.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% include comps/image.html src="/favicon.svg" alt="RavenUI Icon Logo" max_width="200px" caption="RavenUI Icon Logo Example" %}

{% capture img_eg %}
{% raw %}
```liquid
{% include comps/image.html 
   src="/favicon.svg" 
   alt="RavenUI Icon Logo" 
   max_width="200px" 
   caption="RavenUI Icon Logo Example" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=img_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `src` | String | | Path or URL to the high-resolution image file. |
| `low_res_src` | String | | Path or URL to a small (e.g. 20px wide) low-resolution thumbnail to use for blur-up loading. If omitted, a skeleton placeholder is shown instead. |
| `alt` | String | `""` | Alt text description for screen readers and accessibility. |
| `caption` | String | | Small caption text rendered underneath the image. |
| `max_width` | String | `"100%"` | Maximum width of the image wrapper container (e.g. `200px`, `50%`, `100%`). |
| `radius` | String | `var(--rd-radius)` | CSS border-radius value for rounding the image corners. |
| `class` | String | | Optional CSS class to append to the container. |
