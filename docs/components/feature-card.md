---
layout: default
title: Feature Card
output-title: true
tags: [ui, components, landing]
description: A compact card variant optimized for showcasing features or selling points.
enable_search: true
---
The `feature-card.html` component is designed for landing pages and "Key Features" sections. It emphasizes a large icon and clear, concise text.

{% include comps/heading.html tag="h2" text="Live Example" icon="zap" size=20 %}

<div class="zd-feature-grid">
{% include comps/feature-card.html 
    icon="zap" 
    title="High Performance" 
    description="Optimized for speed and minimal dependency footprint." 
    color="#00ff9d" 
%}
</div>

{% capture feat_code %}
{% raw %}
```liquid
<div class="zd-feature-grid">
{% include comps/feature-card.html 
    icon="zap" 
    title="High Performance" 
    description="..." 
    color="#00ff9d" 
%}
</div>
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=feat_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | | Small, bold heading. |
| `description` | String | | Descriptive text. |
| `icon` | String | | Lucide icon name. |
| `color` | String | Highlight | Theme color for the icon. |

---

{% include comps/callout.html type="tip" title="Grid Layout" content="Always wrap feature cards in a `feature-grid.html` container to ensure proper spacing and responsive behavior." %}
