---
layout: default
title: Button
output-title: true
tags: [ui, interactive, navigation]
description: Refined, high-impact buttons with support for icons, colors, and variants.
enable_search: true
---
The `button.html` component provides a flexible way to add call-to-action elements throughout your documentation.

{% include comps/heading.html tag="h2" text="Live Examples" icon="mouse-pointer" size=20 %}

<div style="display: flex; flex-wrap: wrap; gap: 1rem; align-items: center;">
    {% include comps/button.html text="Getting Started" icon="rocket" url="/installation/" %}
    {% include comps/button.html text="View Source" icon="github" color="var(--rd-clr-platinum)" url="#" %}
    {% include comps/button.html text="Changelog" icon="package" color="#3399ff" url="/components/releases/" %}
    {% include comps/button.html text="Deprecated" icon="alert-octagon" color="var(--rd-clr-danger)" url="#" %}
</div>

{% capture btn_code %}
{% raw %}
```liquid
{% include comps/button.html text="Getting Started" icon="rocket" url="/installation/" %}
{% include comps/button.html text="View Source" icon="github" color="var(--rd-clr-platinum)" url="#" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=btn_code %}

---

{% include comps/heading.html tag="h2" text="Variants" icon="layers" size=20 %}

### **Outline & Ghost**
Use the `class` parameter to apply built-in variants for secondary or tertiary actions.

<div style="display: flex; flex-wrap: wrap; gap: 1rem; align-items: center; margin-block: 2rem;">
    {% include comps/button.html text="Outline Button" class="rd-btn--outline" icon="external-link" %}
    {% include comps/button.html text="Ghost Button" class="rd-btn--ghost" icon="search" %}
</div>

{% capture variant_code %}
{% raw %}
```liquid
{% include comps/button.html text="Outline Button" class="rd-btn--outline" icon="external-link" %}
{% include comps/button.html text="Ghost Button" class="rd-btn--ghost" icon="search" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=variant_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `text` | String | "Button" | The button label. |
| `url` | String | | Destination URL. |
| `icon` | String | | Lucide icon name. |
| `color` | String | `--rd-clr-highlight` | Background color (or text color for outline). |
| `size` | String | `0.85rem` | Font size. |
| `radius` | String | `--rd-radius` | Border radius. |
| `border-size` | String | `1px` | Border width. |
| `border-color` | String | `transparent` | Border color. |
| `class` | String | | Additional CSS classes (`rd-btn--outline`, `rd-btn--ghost`). |
| `target` | String | | Anchor target (e.g., `_blank`). |
| `rel` | String | | Anchor rel (e.g., `noopener`). |
