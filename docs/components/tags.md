---
layout: default
title: Tags
output-title: true
tags: [ui, elements, metadata]
description: Subtle, stylized tags for metadata, categories, and labels.
---

The theme includes a versatile tag system used for blog categories, project metadata, and labels.

{% include comps/heading.html tag="h2" text="Standard Tags" icon="tag" size=20 %}

<div class="zd-tag-container">
    <span class="zd-tag">Standard Tag</span>
    <span class="zd-tag">{% include comps/icon.html name="star" size=10 %} Starred</span>
    <span class="zd-tag">{% include comps/icon.html name="code" size=10 %} Liquid</span>
</div>

{% capture tag_code %}
```html
<div class="zd-tag-container">
    <span class="zd-tag">Standard Tag</span>
    <span class="zd-tag">{% include comps/icon.html name="star" size=10 %} Starred</span>
</div>
```
{% endcapture %}
{% include comps/example-code.html content=tag_code %}

---

{% include comps/heading.html tag="h2" text="Pastel Variants" icon="palette" size=20 %}

You can apply subtle pastel colors to tags using the built-in modifier classes for improved visual hierarchy.

<div class="zd-tag-container">
    <span class="zd-tag zd-tag--blue">Blue Tag</span>
    <span class="zd-tag zd-tag--purple">Purple Tag</span>
    <span class="zd-tag zd-tag--pink">Pink Tag</span>
    <span class="zd-tag zd-tag--orange">Orange Tag</span>
</div>

{% capture pastel_code %}
```html
<div class="zd-tag-container">
    <span class="zd-tag zd-tag--blue">Blue Tag</span>
    <span class="zd-tag zd-tag--purple">Purple Tag</span>
    <span class="zd-tag zd-tag--pink">Pink Tag</span>
    <span class="zd-tag zd-tag--orange">Orange Tag</span>
</div>
```
{% endcapture %}
{% include comps/example-code.html content=pastel_code %}

---

{% include comps/heading.html tag="h2" text="Usage in Front-matter" icon="file-text" size=20 %}

Tags defined in a page's front-matter are automatically rendered in the hero section.

```yaml
---
layout: default
title: My Page
tags: [tutorial, javascript, web]
---
```
