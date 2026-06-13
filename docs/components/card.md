---
layout: default
title: Standard Card
output-title: true
tags: [ui, components, cards]
description: A flexible container for grouping content with optional icons and glass effects.
enable_search: true
---
The `card.html` component is a versatile surface for displaying grouped content. It supports optional icons, titles, and a modern glassmorphism effect.

{% include comps/heading.html tag="h2" text="Live Example" icon="square" size=20 %}

{% capture card_content %}
    This is a standard card content. It can contain **markdown**, images, or other components.
{% endcapture %}

{% include comps/card.html 
    title="Standard Card" 
    icon="package" 
    content=card_content 
    glass=true 
%}

{% capture card_code %}
{% raw %}
```liquid
{% capture card_content %}
    Content goes here...
{% endcapture %}

{% include comps/card.html 
    title="Standard Card" 
    icon="package" 
    content=card_content 
    glass=true 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=card_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | | The heading of the card. |
| `icon` | String | | Lucide icon name. |
| `icon_color` | String | | CSS color for the icon. |
| `content` | String | | The body content (HTML/Liquid). |
| `glass` | Boolean | `false` | Enables backdrop-filter glassmorphism effect. |
| `class` | String | | Additional CSS classes. |
