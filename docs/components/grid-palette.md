---
layout: default
title: Grid Palette
output-title: true
tags: [ui, branding, colors]
description: A stylized grid for displaying color palettes and hex codes.
enable_search: true
---
The `grid-palette.html` component provides a professional way to showcase theme colors or project-specific branding.

{% include comps/heading.html tag="h2" text="Live Example" icon="grid" size=20 %}

{% assign visual_palette = "
- title: Viridian
  subtext: Primary Brand
  color: 'var(--zd-clr-viridian)'
- title: Info
  subtext: Primary UI Info
  color: '#4A9EE8'
- title: Note
  subtext: Secondary UI Note
  color: '#9B7AE0'
- title: Warning
  subtext: UI Warning
  color: '#E8994A'
- title: Danger
  subtext: UI Danger
  color: '#E05A5A'
- title: Black
  subtext: Deep Surface
  color: '#0A0C0E'
- title: Void
  subtext: Base Background
  color: '#10141A'
- title: Ink
  subtext: Elevated Surface
  color: '#161B24'
- title: Slate
  subtext: Secondary Background
  color: '#1E2530'
- title: Steel
  subtext: Tertiary Background
  color: '#2A3340'
- title: Mist
  subtext: Muted Elements
  color: '#3D4D5E'
- title: Smoke
  subtext: Low Contrast Text
  color: '#5A6E82'
- title: Ash
  subtext: Muted Text
  color: '#8A9BAC'
- title: Silver
  subtext: Content Text
  color: '#B8C5D0'
- title: Ghost
  subtext: High Contrast Text
  color: '#D6DFE7'
- title: White
  subtext: Pure Accent
  color: '#EDF1F5'
" | from_yaml %}

{% include comps/grid-palette.html items=visual_palette %}

{% capture gp_code %}
{% raw %}
```liquid
{% assign my_palette = "
- title: Highlight
  subtext: Primary Brand Color
  color: '#00ff9d'
" | from_yaml %}

{% include comps/grid-palette.html items=my_palette %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=gp_code %}

---

{% include comps/heading.html tag="h2" text="Compact Swatch Mode" icon="palette" size=20 %}

Use `mode="swatch"` to render simple, compact color swatches (e.g., for showing a color block without metadata card layouts). Hovering over a swatch displays the title and value.

{% include comps/grid-palette.html items=visual_palette mode="swatch" swatch_size="24px" %}

{% capture swatch_code %}
{% raw %}
```liquid
{% include comps/grid-palette.html items=my_palette mode="swatch" swatch_size="24px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=swatch_code %}

---

{% include comps/heading.html tag="h2" text="App & Device Grid (Icons)" icon="grid" size=20 %}

You can display icons inside the swatches for grid lists of tools, services, apps, or devices by passing `icon` and `icon_type`.

{% assign app_grid = "
- title: GitHub Repository
  subtext: Code Hosting
  color: '#181717'
  icon: github
  icon_type: simple
- title: GitLab Project
  subtext: Continuous Integration
  color: '#FC6D26'
  icon: gitlab
  icon_type: simple
- title: Cloudflare CDN
  subtext: Edge Networking
  color: '#F38020'
  icon: cloudflare
  icon_type: simple
" | from_yaml %}

{% include comps/grid-palette.html items=app_grid size="200px" height="80px" %}

{% capture app_code %}
{% raw %}
```liquid
{% assign my_apps = "
- title: GitHub
  subtext: Code Hosting
  color: '#181717'
  icon: github
  icon_type: simple
" | from_yaml %}

{% include comps/grid-palette.html items=my_apps %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=app_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `items` | Array | | An array of items containing `title`, `subtext`, `color`, `icon`, `icon_type`. |
| `mode` | String | `card` | Display mode: `card` (standard grids) or `swatch` (color swatches only). |
| `size` | String | `200px` | The min-width of each color card in card mode (e.g., `150px`, `250px`). |
| `height` | String | `100px` | The height of the color swatch inside each card (e.g., `80px`, `120px`). |
| `swatch_size` | String | `12px` | The width and height of swatches in swatch mode (e.g. `24px`). |

