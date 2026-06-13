---
layout: default
title: VHS Effect
output-title: true
tags: [ui, effects, retro, vhs]
description: A cinematic, retro-styled container with scanlines and glitch effects.
enable_search: true
---
The `vhs.html` component provides a stylized background effect inspired by vintage VHS tapes. It's perfect for high-impact callouts or "glitchy" technical summaries.

{% include comps/heading.html tag="h2" text="Live Example" icon="monitor" size=20 %}

{% capture vhs_demo %}
<div style="text-align:center; padding: 2rem;">
    <h3 style="margin:0; color:var(--zd-clr-highlight);">SYSTEM OVERRIDE</h3>
    <p style="font-family:var(--zd-font-mono); margin-top:0.5rem;">PROTOCOL 7-B INITIATED</p>
</div>
{% endcapture %}

{% include comps/vhs.html content=vhs_demo %}

{% capture vhs_code %}
{% raw %}
```liquid
{% capture vhs_content %}
    <h3 style="color:var(--zd-clr-highlight);">SYSTEM OVERRIDE</h3>
{% endcapture %}

{% include comps/vhs.html content=vhs_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=vhs_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The HTML or Liquid content to display inside the VHS container. |

---

{% include comps/callout.html type="note" title="Visual Style" content="The VHS effect includes an animated scanline overlay and a subtle flicker. Ensure the content inside has sufficient contrast against the dark background." %}
