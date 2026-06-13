---
layout: default
title: Example Block
output-title: true
tags: [ui, documentation, liquid]
description: A collapsible 'details' container for live HTML or Liquid examples.
enable_search: true
---
The `example-block.html` component provides a general-purpose collapsible container. It does **not** automatically markdownify its content, making it perfect for live HTML examples or pre-rendered liquid.

{% include comps/heading.html tag="h2" text="Live Example" icon="box" size=20 %}

{% capture block_demo %}
<div style="padding: 1rem; border: 1px solid var(--zd-clr-border); border-radius: 4px; background: var(--zd-clr-bg-alt);">
    <h4 style="margin:0;">Live Preview</h4>
    <p style="margin:0.5rem 0 0;">This content is rendered inside the example block.</p>
</div>
{% endcapture %}

{% include comps/example-block.html title="View Live Preview" content=block_demo %}

{% capture block_code %}
{% raw %}
```liquid
{% capture block_content %}
    ... raw HTML or Liquid ...
{% endcapture %}

{% include comps/example-block.html title="View Live Preview" content=block_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=block_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The HTML/Liquid content to display. |
| `title` | String | "View Example Code" | The text displayed in the `<summary>` toggle. |
