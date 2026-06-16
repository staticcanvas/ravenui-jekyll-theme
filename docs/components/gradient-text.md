---
layout: default
title: Gradient Text
output-title: true
tags: [ui, elements, typography, gradient]
description: Render headings or text with stylized CSS gradients.
enable_search: true
---
The `gradient-text.html` component renders headings or text styled with linear CSS gradients.

{% include comps/heading.html tag="h2" text="Live Example" icon="type" size=20 %}

<h1>
    {% include comps/gradient-text.html text="Beautiful Dynamic Gradients" from="var(--rd-clr-viridian)" to="#00b3ff" %}
</h1>

{% capture grad_eg %}
{% raw %}
```liquid
<h1>
    {% include comps/gradient-text.html text="Beautiful Dynamic Gradients" from="var(--rd-clr-viridian)" to="#00b3ff" %}
</h1>
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=grad_eg %}

---

{% include comps/heading.html tag="h2" text="Customizing Size & Weight" icon="sliders" size=20 %}

You can customize the HTML tag, weight, and font-size of the rendered gradient text.

<div>
    {% include comps/gradient-text.html text="Elegant Bold Subtitle" tag="p" size="1.25rem" weight="800" from="#ff007f" to="#7f00ff" %}
</div>

{% capture grad_custom_eg %}
{% raw %}
```liquid
{% include comps/gradient-text.html text="Elegant Bold Subtitle" tag="p" size="1.25rem" weight="800" from="#ff007f" to="#7f00ff" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=grad_custom_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `text` | String | | The text content to style. |
| `tag` | String | `span` | The HTML wrapper tag (e.g. `span`, `p`, `h1`, `h2`). |
| `from` | String | `var(--rd-clr-viridian)` | The starting color of the linear gradient. |
| `to` | String | `#00b3ff` | The ending color of the linear gradient. |
| `weight` | String | `bold` | The font-weight CSS value (e.g. `bold`, `normal`, `800`). |
| `size` | String | | Optional CSS font-size override. |
| `class` | String | | Optional CSS class to append to the wrapper element. |
