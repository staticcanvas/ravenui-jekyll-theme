---
layout: default
title: Responsive Iframe
output-title: true
tags: [ui, elements, media, embed]
description: Embed external web content responsively with a built-in skeleton loader.
---

The `iframe.html` component enables secure, responsive embedding of external websites or web apps (e.g. dashboards, maps, interactive widgets) with a beautiful glassmorphic skeleton loader that fades out as soon as the frame loads.

## **Live Example**

{% include comps/iframe.html url="https://example.com" title="Example Website Embed" aspect_ratio="21/9" %}

{% capture iframe_eg %}
{% raw %}
```liquid
{% include comps/iframe.html 
   url="https://example.com" 
   title="Example Website Embed" 
   aspect_ratio="21/9" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=iframe_eg %}

---

## **API Reference**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `url` | String | | The URL of the external site to embed. |
| `title` | String | `"External Content"` | Accessibility title for the iframe. |
| `aspect_ratio` | String | `"16/9"` | Container aspect ratio (e.g., `16/9`, `21/9`, `4/3`). |
| `max_width` | String | `"100%"` | Maximum width of the embed block (e.g., `800px` or `100%`). |
| `height` | String | `"auto"` | Height override (useful if not using aspect ratios). |
| `class` | String | | Optional CSS class to append to the container. |
