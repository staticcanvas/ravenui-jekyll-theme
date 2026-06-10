---
layout: default
title: SVG Charts Component
output-title: true
tags: [ui, elements, data, charts]
description: Pure SVG (zero-JavaScript) charts for ultra-fast server-side rendering.
---

The `svgcharts.html` component provides a lightweight, zero-dependency data visualization tool. It renders line, bar, pie, and doughnut charts directly to SVG, ensuring instant load times and complete compatibility with JavaScript-disabled environments.

## **Live Example**

{% include comps/svgcharts.html id="svgcharts-example-1" type="bar" labels="Q1, Q2, Q3, Q4" data="40, 60, 25, 95" title="Lightweight SVG Bar Chart" height=220 width=600 %}

{% capture svg_eg %}
{% raw %}
```liquid
{% include comps/svgcharts.html 
   id="svgcharts-demo" 
   type="bar" 
   labels="Q1, Q2, Q3, Q4" 
   data="40, 60, 25, 95" 
   title="Lightweight SVG Bar Chart" 
   height=220 
   width=600 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=svg_eg %}

---

## **Doughnut Chart Example**

Doughnut and pie charts calculate layout percentages and compile legends dynamically inside Jekyll's compilation phase.

{% include comps/svgcharts.html id="svgcharts-doughnut-1" type="doughnut" labels="Standard, Express, Overnight" data="55, 30, 15" title="Shipping Methods Breakdown" height=220 width=600 %}

{% capture svg_d_eg %}
{% raw %}
```liquid
{% include comps/svgcharts.html 
   id="svgcharts-doughnut-1" 
   type="doughnut" 
   labels="Standard, Express, Overnight" 
   data="55, 30, 15" 
   title="Shipping Methods Breakdown" 
   height=220 
   width=600 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=svg_d_eg %}

---

## **API Reference**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `"svg-chart-1"` | Unique container ID. |
| `type` | String | `"bar"` | Chart type (`bar`, `line`, `pie`, `doughnut`). |
| `labels` | String / Array | | Comma-separated list of labels or a structured Liquid array. |
| `data` | String / Array | | Comma-separated list of numbers or a structured Liquid array. |
| `source` | String | | The filename of a YAML data source under `_data/` (excluding extension). |
| `key` | String | | Subsection key within the `source` data file (optional). |
| `title` | String | | Section heading text displayed above the SVG. |
| `height` | Integer | `220` | Canvas height in pixels. |
| `width` | Integer | `600` | Canvas width in pixels. |
| `class` | String | | Optional CSS class to append to the container. |
