---
layout: default
title: Example Code
output-title: true
tags: [ui, documentation, markdown]
description: A collapsible 'details' container optimized for markdown code blocks.
---

The `example-code.html` component is designed to hold markdown code blocks. It automatically applies `markdownify` to the provided content.

{% include comps/heading.html tag="h2" text="Live Example" icon="code" size=20 %}

{% capture code_demo %}
{% raw %}
```liquid
{% include comps/icon.html name="zap" color="#00ff9d" %}
```
{% endraw %}
{% endcapture %}

{% include comps/example-code.html content=code_demo %}

{% capture code_usage %}
{% raw %}
```liquid
{% capture my_code %}
    ... markdown code block ...
{% endcapture %}

{% include comps/example-code.html content=my_code %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=code_usage %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The Markdown content (usually a code block). |
