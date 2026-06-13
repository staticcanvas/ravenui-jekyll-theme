---
layout: default
title: Color Block
output-title: true
tags: [ui, elements, color]
description: A small, stylized indicator for showcasing colors or status.
enable_search: true
---
The `color-block.html` component is a simple utility for displaying color swatches or status indicators in a circular or square format.

{% include comps/heading.html tag="h2" text="Live Example" icon="palette" size=20 %}

- **Highlight:** {% include comps/color-block.html color="#00ff9d" size="14px" %}
- **Warning:** {% include comps/color-block.html color="#ffcc00" shape="square" %}
- **Bordered:** {% include comps/color-block.html color="#ffffff" bordered=true %}

{% capture cb_code %}
{% raw %}
```liquid
{% include comps/color-block.html color="#00ff9d" size="14px" %}
{% include comps/color-block.html color="#ffcc00" shape="square" %}
{% include comps/color-block.html color="#ffffff" bordered=true %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=cb_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `color` | String | `#00ff9d` | The CSS color value. |
| `size` | String | `12px` | The diameter/width of the block. |
| `shape` | String | `circle` | `circle` or `square`. |
| `bordered` | Boolean | `false` | Adds a subtle border (useful for light colors). |

---

{% include comps/callout.html type="tip" title="Tooltips" content="The component automatically includes a `title` attribute with the hex value, allowing users to see the color code on hover." %}
