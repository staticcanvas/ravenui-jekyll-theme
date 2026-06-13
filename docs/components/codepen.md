---
layout: default
title: CodePen Embed
output-title: true
tags: [ui, elements, interactive, embed]
description: Embed interactive CodePen front-end playgrounds and code snippets.
enable_search: true
---
The `codepen.html` component makes it simple to embed interactive HTML, CSS, and JavaScript pens from CodePen directly within your documentation pages.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% include comps/codepen.html id="XWJjRKO" user="codepen" height=350 theme="dark" tab="result" %}

{% capture cp_eg %}
{% raw %}
```liquid
{% include comps/codepen.html 
   id="XWJjRKO" 
   user="codepen" 
   height=350 
   theme="dark" 
   tab="result" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=cp_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | | The unique alphanumeric CodePen ID (e.g., `XWJjRKO`). |
| `user` | String | `site.codepen_username` or `"pen"` | The CodePen profile username. |
| `height` | Integer | `350` | The height of the embed block in pixels. |
| `theme` | String | `"dark"` | Theme version of the embed block (`dark` or `light`). |
| `tab` | String | `"result"` | The default active tab (`html,css,js`, `js,result`, `result`, etc.). |
| `title` | String | `"CodePen Embed"` | Accessibility title for the iframe. |
| `class` | String | | Optional CSS class to append to the container. |
