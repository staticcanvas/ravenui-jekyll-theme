---
layout: default
title: Font Awesome
output-title: true
tags: [ui, elements, icons]
description: Integration with Font Awesome icons. Requires configuration flag to enable.
---

The `font-awesome.html` component provides integration with [Font Awesome](https://fontawesome.com/) icons. Because Font Awesome is a heavy dependency, it is disabled by default to optimize loading speed and performance.

{% include comps/heading.html tag="h2" text="Configuration" icon="settings" size=20 %}

To enable Font Awesome support, set `font_awesome: true` in your `_config.yml` file:

```yaml
font_awesome: true
```

---

{% include comps/heading.html tag="h2" text="Basic Usage" icon="star" size=20 %}

Once enabled, you can include Font Awesome icons using the component:

{% capture fa_code %}
{% raw %}
```liquid
{% include comps/font-awesome.html name="coffee" color="#00ff9d" size=24 %}
{% include comps/font-awesome.html name="heart" color="#ff4444" size=24 style="far" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=fa_code %}

If Font Awesome is enabled in your configuration, the icons below will render:

{% if site.font_awesome %}
{% include comps/font-awesome.html name="coffee" color="#00ff9d" size=24 %} 
{% include comps/font-awesome.html name="heart" color="#ff4444" size=24 style="far" %}
{% else %}
<p class="fg-muted"><em>Note: Enable `font_awesome: true` in `_config.yml` to render these icons.</em></p>
{% endif %}

---

{% include comps/heading.html tag="h2" text="Animations" icon="refresh-cw" size=20 %}

Font Awesome icons support built-in Font Awesome animations:
- **Spin:** `animation="spin"`
- **Pulse:** `animation="pulse"`
- **Beat:** `animation="beat"`
- **Fade:** `animation="fade"`

{% capture anim_code %}
{% raw %}
```liquid
{% include comps/font-awesome.html name="spinner" animation="spin" size=24 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=anim_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | | The Font Awesome icon name (e.g., `coffee`, `user`, `spinner`). |
| `style` | String | `fas` | The icon style/weight (e.g., `fas` for solid, `far` for regular, `fab` for brands). |
| `size` | Integer | `16` | Icon size in pixels. |
| `color` | String | | Custom CSS color value. |
| `animation` | String | | Font Awesome animation class (e.g., `spin`, `pulse`, `beat`, `fade`). |
