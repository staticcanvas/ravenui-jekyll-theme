---
layout: default
title: CodeSandbox Embed
output-title: true
tags: [ui, elements, interactive, embed]
description: Embed full interactive sandbox projects (React, Vue, Svelte, Node) from CodeSandbox.
---

The `codesandbox.html` component enables embedding full monorepo sandboxes or web apps from CodeSandbox, allowing users to browse, edit, and execute code inline.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% include comps/codesandbox.html id="new" height=500 theme="dark" view="editor" %}

{% capture cs_eg %}
{% raw %}
```liquid
{% include comps/codesandbox.html 
   id="new" 
   height=500 
   theme="dark" 
   view="editor" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=cs_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | | The CodeSandbox ID (e.g., `new` or a specific hash like `8s3n9`). |
| `height` | Integer | `500` | The height of the embed block in pixels. |
| `theme` | String | `"dark"` | CodeSandbox theme setting (`dark` or `light`). |
| `view` | String | `"preview"` | Default active view pane (`editor`, `preview`, or `split`). |
| `title` | String | `"CodeSandbox Embed"` | Accessibility title for the iframe. |
| `class` | String | | Optional CSS class to append to the container. |
