---
layout: default
title: Sitemap
output-title: true
tags: [ui, components, navigation]
description: A directory-style sitemap component to visualize site page hierarchy, blog posts, and custom collections.
enable_search: true
---
The `sitemap.html` component dynamically visualizes the site page structure, listing static pages, blog posts, and active collections with links, icons, and path descriptors.

{% include comps/heading.html tag="h2" text="Live Example" icon="map" size=20 %}

{% include comps/sitemap.html 
    show_posts=true 
    show_collections=true 
%}

{% capture sitemap_code %}
{% raw %}
```liquid
{% include comps/sitemap.html 
    show_posts=true 
    show_collections=true 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=sitemap_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `show_posts` | Boolean | `true` | Toggle inclusion of blog posts. |
| `show_collections` | Boolean | `true` | Toggle inclusion of custom collections. |
| `class` | String | | Additional CSS classes for custom styling. |

---

{% include comps/heading.html tag="h2" text="Excluding Pages" icon="eye-off" size=20 %}

To prevent specific pages or posts from appearing in the sitemap rendering, add the `sitemap: false` configuration to the document's YAML front matter:

```yaml
---
layout: page
title: Hidden Page
sitemap: false
---
```
