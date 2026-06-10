---
layout: default
title: Simple Icon
output-title: true
tags: [ui, elements, simple-icons]
description: Integration with Simple Icons for displaying logos of popular brands and services.
---

The `simple-icon.html` component provides a lightweight wrapper around [Simple Icons](https://simpleicons.org/), allowing you to easily add custom brand and service icons to your documentation.

{% include comps/heading.html tag="h2" text="Basic Usage" icon="star" size=20 %}

{% include comps/simple-icon.html name="github" color="#00ff9d" size=24 %} 
{% include comps/simple-icon.html name="gitlab" color="#e24329" size=24 %}
{% include comps/simple-icon.html name="cloudflare" color="#f38020" size=24 %}

{% capture icon_code %}
{% raw %}
```liquid
{% include comps/simple-icon.html name="github" color="#00ff9d" size=24 %}
{% include comps/simple-icon.html name="gitlab" color="#e24329" size=24 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=icon_code %}

---

{% include comps/heading.html tag="h2" text="Animations & Interactions" icon="refresh-cw" size=20 %}

Supports custom CSS animations and hover effects:
- **Continuous Spin:** {% include comps/simple-icon.html name="npm" animation="spin" size="24" %}
- **Hover Pulse:** {% include comps/simple-icon.html name="docker" hover="pulse" size="24" %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | | The brand/service name (e.g., `github`, `react`, `bun`). |
| `size` | Integer | `16` | Icon size in pixels. |
| `color` | String | `ffffff` | Icon color (hex code or CSS variable). |
| `animation` | String | | Custom CSS animation class (e.g., `spin`, `pulse`, `shake`, `flap`). |
| `hover` | String | | Hover effect class (e.g., `spin`, `pulse`, `shake`, `draw`). |
