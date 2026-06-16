---
layout: default
title: Heading
output-title: true
tags: [ui, elements, typography]
description: Stylized headings with Lucide icon integration and custom colors.
enable_search: true
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

## **Heading Anchor Links**

RavenUI automatically generates hoverable anchor links (`#`) next to all section headings (`h1` through `h6`) that have an ID.

By default, these links are invisible and fade in when hovering over the heading. You can configure the anchors to be permanently visible (with a subtle opacity) by adding the following setting to your `_config.yml` file:

```yaml
rd_headings_always_visible: true
```

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

