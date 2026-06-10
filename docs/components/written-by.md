---
layout: default
title: Written By
output-title: true
tags: [ui, elements, display, metadata]
description: Displays author details, profile avatar, role, bio, and social connections.
---

The `written-by.html` component provides a refined way to display author metadata, ideal for blog posts, documentation contributions, and team showcases.

## **Live Example**

{% include comps/written-by.html name="Jane Doe" avatar="/favicon.svg" role="Lead Designer, StaticCanvas" bio="Jane is a veteran interface designer who specializes in systems design and accessibility." twitter="janedoe" github="janedoe" email="jane@staticcanvas.com" color="#00ff9d" %}

{% capture wb_eg %}
{% raw %}
```liquid
{% include comps/written-by.html 
   name="Jane Doe" 
   avatar="/favicon.svg" 
   role="Lead Designer, StaticCanvas" 
   bio="Jane is a veteran interface designer who specializes in systems design." 
   twitter="janedoe" 
   github="janedoe" 
   email="jane@staticcanvas.com" 
   color="#00ff9d" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=wb_eg %}

---

## **API Reference**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | `page.author` | The display name of the author. |
| `avatar` | String | `site.author.avatar` | Relative or absolute URL to the author's avatar image. |
| `role` | String | `site.author.role` | The role or title of the author. |
| `bio` | String | `site.author.bio` | A short biography or description of the author. |
| `twitter` | String | `site.author.twitter` | Twitter handle (without `@`). |
| `github` | String | `site.author.github` | GitHub username. |
| `linkedin` | String | `site.author.linkedin` | LinkedIn username. |
| `email` | String | `site.author.email` | Contact email address. |
| `label` | String | `"Written By"` | Small heading text displayed above the author name. |
| `color` | String | `var(--zd-clr-highlight)` | Color accent applied to the label and social icons. |
