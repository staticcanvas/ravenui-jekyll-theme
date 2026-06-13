---
layout: default
title: SVG Charts Component
output-title: true
tags: [ui, elements, data, charts]
description: Pure SVG (zero-JavaScript) charts for ultra-fast server-side rendering.
enable_search: true
---
The `svgcharts.html` component provides a lightweight, zero-dependency data visualization tool. It renders line, bar, pie, doughnut, polar area, radar, scatter, and bubble charts directly to SVG, ensuring instant load times and complete compatibility with JavaScript-disabled environments.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

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

## **Polar Area Chart Example**

Polar area charts are similar to pie charts, but each segment has the same angle and a radius proportional to its value.

{% include comps/svgcharts.html id="svgcharts-polar-1" type="polarArea" labels="A, B, C, D, E" data="80, 45, 95, 30, 60" title="System Load Distribution" height=220 width=600 %}

{% capture svg_polar_eg %}
{% raw %}
```liquid
{% include comps/svgcharts.html 
   id="svgcharts-polar-1" 
   type="polarArea" 
   labels="A, B, C, D, E" 
   data="80, 45, 95, 30, 60" 
   title="System Load Distribution" 
   height=220 
   width=600 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=svg_polar_eg %}

---

## **Radar Chart Example**

Radar charts compare multiple quantitative variables across three or more categories (supports 3 to 7 categories).

{% include comps/svgcharts.html id="svgcharts-radar-1" type="radar" labels="CPU, Memory, Disk, Network, GPU" data="85, 60, 45, 75, 90" title="Server Performance Metrics" height=240 width=600 %}

{% capture svg_radar_eg %}
{% raw %}
```liquid
{% include comps/svgcharts.html 
   id="svgcharts-radar-1" 
   type="radar" 
   labels="CPU, Memory, Disk, Network, GPU" 
   data="85, 60, 45, 75, 90" 
   title="Server Performance Metrics" 
   height=240 
   width=600 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=svg_radar_eg %}

---

## **Scatter & Bubble Chart Examples**

Scatter and bubble charts plot coordinates (x, y) to show correlations, with bubble charts supporting a third value (r) for bubble size. Coordinates are supplied in `x:y` or `x:y:r` format.

{% include comps/svgcharts.html id="svgcharts-scatter-1" type="scatter" labels="P1, P2, P3, P4" data="10:20, 20:45, 35:15, 50:70" title="Telemetry Scatter Plot" height=220 width=600 %}

{% capture svg_scatter_eg %}
{% raw %}
```liquid
{% include comps/svgcharts.html 
   id="svgcharts-scatter-1" 
   type="scatter" 
   labels="P1, P2, P3, P4" 
   data="10:20, 20:45, 35:15, 50:70" 
   title="Telemetry Scatter Plot" 
   height=220 
   width=600 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=svg_scatter_eg %}

{% include comps/svgcharts.html id="svgcharts-bubble-1" type="bubble" data="10:20:8, 25:40:15, 45:15:5" title="Network Load Bubble Chart" height=220 width=600 %}

{% capture svg_bubble_eg %}
{% raw %}
```liquid
{% include comps/svgcharts.html 
   id="svgcharts-bubble-1" 
   type="bubble" 
   data="10:20:8, 25:40:15, 45:15:5" 
   title="Network Load Bubble Chart" 
   height=220 
   width=600 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=svg_bubble_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `"svg-chart-1"` | Unique container ID. |
| `type` | String | `"bar"` | Chart type (`bar`, `line`, `pie`, `doughnut`, `polarArea`, `radar`, `scatter`, `bubble`). |
| `labels` | String / Array | | Comma-separated list of labels or a structured Liquid array. |
| `data` | String / Array | | Comma-separated list of numbers or coordinates, or a structured Liquid array. |
| `source` | String | | The filename of a YAML data source under `_data/` (excluding extension). |
| `key` | String | | Subsection key within the `source` data file (optional). |
| `title` | String | | Section heading text displayed above the SVG. |
| `height` | Integer | `220` | Canvas height in pixels. |
| `width` | Integer | `600` | Canvas width in pixels. |
| `class` | String | | Optional CSS class to append to the container. |
