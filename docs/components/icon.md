---
layout: default
title: Icon
output-title: true
tags: [ui, elements, lucide]
description: Advanced Lucide icon integration with custom animations and interactive states.
enable_search: true
---
The `icon.html` component provides a robust way to include [Lucide](https://lucide.dev/) icons in your documentation with support for colors, sizes, and a sophisticated animation engine.

{% include comps/heading.html tag="h2" text="Basic Usage" icon="star" size=20 %}

{% include comps/icon.html name="shield" color="#00ff9d" size=24 %} 
{% include comps/icon.html name="zap" color="#ffcc00" size=24 %}

{% capture icon_code %}
{% raw %}
```liquid
{% include comps/icon.html name="shield" color="#00ff9d" size=24 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=icon_code %}

---

{% include comps/heading.html tag="h2" text="Animations" icon="refresh-cw" size=20 %}

### **Continuous**
- **Spin:** {% include comps/icon.html name="settings" continuous="spin" size="24" %}
- **Pulse:** {% include comps/icon.html name="heart" continuous="pulse" color="#ff4444" size="24" %}

### **Interactive (Hover/Click)**
- **Hover Shake:** {% include comps/icon.html name="alert-triangle" hover="shake" color="#ffcc00" size="24" %}
- **Click Pulse:** {% include comps/icon.html name="thumbs-up" click="pulse" color="#00ff9d" size="24" %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | | Lucide icon name (e.g., `user`, `settings`). |
| `size` | Integer | `16` | Icon size in pixels. |
| `color` | String | | CSS color value. |
| `continuous` | String | | `spin`, `pulse`. |
| `hover` | String | | `pulse`, `shake`, `nudge`. |
| `click` | String | | `pulse`, `shake`. |
