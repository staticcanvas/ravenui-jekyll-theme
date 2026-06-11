---
layout: default
title: Tag Cloud
output-title: true
tags: [ui, navigation, data, widgets]
description: A component that aggregates all site tags, sizing them dynamically according to their post count.
---

The `tag-cloud.html` component dynamically scans all tags in the Jekyll site (`site.tags`), calculates their frequency rank, and displays them as a high-density, interactive cloud. Each tag pill features hover effects and links directly to the designated tags summary page.

{% include comps/heading.html tag="h2" text="Live Example" icon="tag" size=20 %}

{% include comps/tag-cloud.html base_url="/tags.html" %}

{% capture tag_cloud_eg %}
{% raw %}
```liquid
<!-- Standard Tag Cloud pointing to /tags.html -->
{% include comps/tag-cloud.html base_url="/tags.html" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=tag_cloud_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **tag-cloud.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `base_url` | String | `/tags.html` | The destination page for the tag links. The tag slug (e.g. `#jekyll`) will be appended automatically. |
| `class` | String | | Optional custom CSS class. |
