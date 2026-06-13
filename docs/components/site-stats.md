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

{% include comps/heading.html tag="h3" text="Visual Charts Layout" icon="pie-chart" size=16 %}

You can render visual representations of tag and category distribution by enabling the `show_charts` parameter. You can choose between interactive canvas charts (powered by Chart.js) and static/responsive vector charts (powered by the SVG chart engine).

{% include comps/site-stats.html show_charts=true chart_engine="chartjs" %}

{% capture site_stats_charts_eg %}
```liquid
<!-- Site Stats with Chart.js charts -->
{% include comps/site-stats.html show_charts=true chart_engine="chartjs" %}

<!-- Site Stats with SVG vector charts -->
{% include comps/site-stats.html show_charts=true chart_engine="svg" %}
```
{% endcapture %}
{% include comps/example-code.html content=site_stats_charts_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **site-stats.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `grid_size` | String | `150px` | The minimum width of each card in the responsive grid. |
| `show_words` | Boolean | `true` | Toggle total word count visibility. |
| `show_reading_time` | Boolean | `true` | Toggle reading time visibility. |
| `show_charts` | Boolean | `false` | Toggle tag and category distribution charts. |
| `chart_engine` | String | `chartjs` | Charting library to use: `chartjs` (interactive canvas) or `svg` (vector path). |
| `class` | String | | Optional custom CSS class. |
