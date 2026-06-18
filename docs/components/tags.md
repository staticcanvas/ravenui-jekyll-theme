---
layout: default
title: Tags
output-title: true
tags: [ui, elements, metadata]
description: Subtle, stylized tags for metadata, categories, and labels.
enable_search: true
---
The theme includes a versatile tag system used for blog categories, project metadata, and labels.

{% include comps/heading.html tag="h2" text="Standard Tags" icon="tag" size=20 %}

<div class="rd-tag-container">
    <span class="rd-tag">Standard Tag</span>
    <span class="rd-tag">{% include comps/icon.html name="star" size=10 %} Starred</span>
    <span class="rd-tag">{% include comps/icon.html name="code" size=10 %} Liquid</span>
</div>

{% capture tag_code %}
{% raw %}
```html
<div class="rd-tag-container">
    <span class="rd-tag">Standard Tag</span>
    <span class="rd-tag">{% include comps/icon.html name="star" size=10 %} Starred</span>
</div>
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=tag_code %}

---

{% include comps/heading.html tag="h2" text="Pastel Variants" icon="palette" size=20 %}

You can apply subtle pastel colors to tags using the built-in modifier classes for improved visual hierarchy.

<div class="rd-tag-container">
    <span class="rd-tag rd-tag--blue">Blue Tag</span>
    <span class="rd-tag rd-tag--purple">Purple Tag</span>
    <span class="rd-tag rd-tag--pink">Pink Tag</span>
    <span class="rd-tag rd-tag--orange">Orange Tag</span>
</div>

{% capture pastel_code %}
```html
<div class="rd-tag-container">
    <span class="rd-tag rd-tag--blue">Blue Tag</span>
    <span class="rd-tag rd-tag--purple">Purple Tag</span>
    <span class="rd-tag rd-tag--pink">Pink Tag</span>
    <span class="rd-tag rd-tag--orange">Orange Tag</span>
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
