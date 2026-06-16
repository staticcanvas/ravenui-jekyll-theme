---
layout: default
title: Table of Contents (TOC) Component
parent: /components/
description: Renders a dynamic, client-side Table of Contents with scroll-spy highlighting and heading cleaning.
enable_search: true
---

The `toc.html` component generates a dynamic Table of Contents (TOC) client-side by scanning the page's content area for headings. It supports scroll-spy active highlighting, auto-collapsing typewriter spans and layout copy buttons, and multiple visual styles.

💠 **Parameters:**

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `content_selector` | String | Query selector for the content area to scan for headings (default: `.rd-content`). |
| `inline` | Boolean | If `true`, strips out fixed/sticky positioning and overlays to let the TOC flow inline (default: `false`). |
| `style` | String | Layout style: `simple`, `lines`, `nodes` (default: `site.theme_settings.toc.style` or `simple`). |
| `density` | String | Font size and spacing density: `compact`, `default`, `relaxed` (default: `site.theme_settings.toc.density` or `default`). |
| `levels` | String / Array | Comma-separated tags or array of headings to scan: `h2,h3` (default: `site.rd_toc_levels` or `["h2", "h3"]`). |
| `default_open` | Boolean | Force the TOC panel to start active/expanded on wide screens (default: `site.rd_toc_default_open` or `false`). |
| `id` | String | Unique ID suffix to prevent DOM collisions if multiple TOC instances exist on a single page (default: `""`). |

---

## **Usage Example**

To render the Table of Contents inline in a documentation page:

{% capture toc_example %}
```liquid
{% include comps/toc.html inline=true style="nodes" density="relaxed" content_selector=".my-article-body" %}
```
{% endcapture %}
{% include comps/example-code.html content=toc_example %}

---

## **Visual Options**

The visual layouts are configured via CSS custom properties and classes:
- **Simple**: Standard clean text links with an active indicator block.
- **Lines**: Vertical link lines showing nesting levels.
- **Nodes**: High-contrast modern nodes indicating the heading tree.
