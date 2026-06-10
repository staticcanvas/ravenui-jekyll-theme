---
layout: default
title: Heading
output-title: true
tags: [ui, elements, typography]
description: Stylized headings with Lucide icon integration and custom colors.
---

The `heading.html` component provides a standard way to create section headings with integrated icons, ensuring a consistent visual hierarchy across your documentation.

{% include comps/heading.html tag="h2" text="Live Example" icon="type" size=20 %}

{% include comps/heading.html tag="h3" text="Sub-heading with Icon" icon="zap" color="#00ff9d" size=18 %}

{% capture h_code %}
{% raw %}
```liquid
{% include comps/heading.html 
    tag="h3" 
    text="Sub-heading with Icon" 
    icon="zap" 
    color="#00ff9d" 
    size=18 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=h_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `text` | String | | The text content of the heading. |
| `tag` | String | `h2` | The HTML tag to use (`h1` through `h6`). |
| `icon` | String | | Lucide icon name. |
| `color` | String | Platinum | CSS color for the icon. |
| `text_color` | String | Platinum | CSS color for the text. |
| `size` | Integer | `20` | Size of the icon in pixels. |
