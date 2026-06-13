---
layout: default
title: Horizontal Separator (HR)
output-title: true
tags: [ui, elements, dividers]
description: Stylized horizontal lines with text labels, icons, and gradients.
enable_search: true
---
The `hr.html` component replaces default browser horizontal rules with professional solid or gradient lines featuring optional centered, left-aligned, or right-aligned labels and icons.

{% include comps/heading.html tag="h2" text="Solid Separators" icon="minus" size=20 %}

{% include comps/hr.html text="Default Divider" %}
{% include comps/hr.html text="Left Aligned" align="left" icon="settings" %}
{% include comps/hr.html text="Right Aligned" align="right" icon="activity" %}

{% capture hr_eg %}
{% raw %}
```liquid
{% include comps/hr.html text="Default Divider" %}
{% include comps/hr.html text="Left Aligned" align="left" icon="settings" %}
{% include comps/hr.html text="Right Aligned" align="right" icon="activity" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=hr_eg %}

---

{% include comps/heading.html tag="h2" text="Gradient Separators" icon="palette" size=20 %}

Use `style="gradient"` to render separators utilizing CSS linear gradients.

{% include comps/hr.html text="Gradient Separator" style="gradient" from="var(--zd-clr-viridian)" to="#00b3ff" %}

{% capture hr_grad_eg %}
{% raw %}
```liquid
{% include comps/hr.html text="Gradient Separator" style="gradient" from="var(--zd-clr-viridian)" to="#00b3ff" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=hr_grad_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `text` | String | | Optional text to display inline within the separator. |
| `icon` | String | | Optional Lucide icon to render next to the text. |
| `style` | String | `solid` | Separator line style (`solid`, `gradient`). |
| `align` | String | `center` | Text alignment (`center`, `left`, `right`). |
| `from` | String | `var(--zd-clr-viridian)` | The gradient starting color (only for `style="gradient"`). |
| `to` | String | `#00b3ff` | The gradient ending color (only for `style="gradient"`). |
| `class` | String | | Optional CSS class to append to the container. |
