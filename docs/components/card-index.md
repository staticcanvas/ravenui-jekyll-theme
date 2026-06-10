---
layout: default
title: Card Index
output-title: true
tags: [ui, navigation, cards]
description: A high-density grid of visual navigation cards based on data files.
---

The `card-index.html` component generates a grid of visual cards based on a specific section from your `site.data.navigation`. It's ideal for directory pages or component indexes.

{% include comps/heading.html tag="h2" text="Live Example" icon="grid" size=20 %}

{% include comps/card-index.html section="Components" %}

{% capture ci_code %}
{% raw %}
```liquid
{% include comps/card-index.html section="Components" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=ci_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `section` | String | | The `title` of the section in `_data/navigation.yml` to pull links from. |

---

{% include comps/callout.html type="tip" title="Dynamic Cards" content="To add descriptions to the cards, simply add a `description` field to your links in `navigation.yml`. The component will automatically pick them up." %}
