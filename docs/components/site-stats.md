---
layout: default
title: Site Stats
output-title: true
tags: [ui, data, widgets]
description: A metrics component that auto-calculates and displays site-wide statistics like posts, tags, categories, words, and reading time.
enable_search: true
---
The `site-stats.html` component provides a dashboard metrics grid that auto-calculates statistics for all Jekyll posts, tags, and categories in the site. It uses word counts to calculate total vocabulary size and average reading time, presenting them in a responsive, glassmorphic grid.

{% include comps/heading.html tag="h2" text="Live Example" icon="bar-chart-2" size=20 %}

{% include comps/site-stats.html grid_size="150px" %}

{% capture site_stats_eg %}
{% raw %}
```liquid
<!-- Default Site Stats grid -->
{% include comps/site-stats.html grid_size="160px" %}

<!-- Hide words and reading time -->
{% include comps/site-stats.html show_words=false show_reading_time=false %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=site_stats_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **site-stats.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `grid_size` | String | `150px` | The minimum width of each card in the responsive grid. |
| `show_words` | Boolean | `true` | Toggle total word count visibility. |
| `show_reading_time` | Boolean | `true` | Toggle reading time visibility. |
| `class` | String | | Optional custom CSS class. |
