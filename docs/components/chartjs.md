---
layout: default
title: Chart.js Component
output-title: true
tags: [ui, elements, data, charts]
description: Interactive and responsive canvas charts powered by Chart.js.
enable_search: true
---
The `chartjs.html` component provides interactive data visualization capabilities. It supports bar, line, radar, pie, doughnut, polar area, bubble, and scatter charts, with automatic layout scaling and RavenUI styling.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% include comps/chartjs.html id="chartjs-example-1" type="line" labels="Q1, Q2, Q3, Q4" data="12, 19, 3, 5" dataset_label="Active Users" height="250px" %}

{% capture chartjs_eg %}
{% raw %}
```liquid
{% include comps/chartjs.html 
   id="chartjs-demo" 
   type="line" 
   labels="Q1, Q2, Q3, Q4" 
   data="12, 19, 3, 5" 
   dataset_label="Active Users" 
   height="250px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=chartjs_eg %}

---

## **Sourcing Data from site.data**

You can load datasets directly from YAML files in the `_data/` directory.

### **Example Data File (`_data/metrics.yml`)**
```yaml
labels: [2023, 2024, 2025, 2026]
datasets:
  - label: "Downloads"
    data: [120, 240, 480, 960]
    borderColor: "#00ff9d"
  - label: "Issues Filed"
    data: [15, 22, 10, 5]
    borderColor: "#ff9f1c"
```

### **Example Call**
{% raw %}
```liquid
{% include comps/chartjs.html id="source-chart" type="bar" source="metrics" height="300px" %}
```
{% endraw %}

---

## **Polar Area & Radar Chart Examples**

Polar Area and Radar charts compare multiple metrics.

{% include comps/chartjs.html id="chartjs-polar" type="polarArea" labels="A, B, C, D" data="70, 50, 90, 40" height="250px" %}

{% capture chartjs_polar_eg %}
{% raw %}
```liquid
{% include comps/chartjs.html 
   id="chartjs-polar" 
   type="polarArea" 
   labels="A, B, C, D" 
   data="70, 50, 90, 40" 
   height="250px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=chartjs_polar_eg %}

{% include comps/chartjs.html id="chartjs-radar" type="radar" labels="Speed, Power, Armor, Range, Stealth" data="80, 90, 70, 60, 85" height="250px" %}

{% capture chartjs_radar_eg %}
{% raw %}
```liquid
{% include comps/chartjs.html 
   id="chartjs-radar" 
   type="radar" 
   labels="Speed, Power, Armor, Range, Stealth" 
   data="80, 90, 70, 60, 85" 
   height="250px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=chartjs_radar_eg %}

---

## **Scatter & Bubble Chart Examples**

Scatter and Bubble charts accept coordinate datasets.

{% include comps/chartjs.html id="chartjs-scatter" type="scatter" datasets="[{label: 'Points', data: [{x: 1, y: 3}, {x: 2, y: 5}, {x: 3, y: 2}]}]" height="250px" %}

{% capture chartjs_scatter_eg %}
{% raw %}
```liquid
{% include comps/chartjs.html 
   id="chartjs-scatter" 
   type="scatter" 
   datasets="[{label: 'Points', data: [{x: 1, y: 3}, {x: 2, y: 5}, {x: 3, y: 2}]}]" 
   height="250px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=chartjs_scatter_eg %}

{% include comps/chartjs.html id="chartjs-bubble" type="bubble" datasets="[{label: 'Bubbles', data: [{x: 10, y: 20, r: 15}, {x: 15, y: 10, r: 8}, {x: 20, y: 30, r: 12}]}]" height="250px" %}

{% capture chartjs_bubble_eg %}
{% raw %}
```liquid
{% include comps/chartjs.html 
   id="chartjs-bubble" 
   type="bubble" 
   datasets="[{label: 'Bubbles', data: [{x: 10, y: 20, r: 15}, {x: 15, y: 10, r: 8}, {x: 20, y: 30, r: 12}]}]" 
   height="250px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=chartjs_bubble_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `"chart-1"` | Unique canvas ID, required to avoid namespace clashes when placing multiple charts. |
| `type` | String | `"bar"` | Chart type (`bar`, `line`, `pie`, `doughnut`, `radar`, `polarArea`). |
| `labels` | String / Array | | Comma-separated list of labels or a structured Liquid array. |
| `data` | String / Array | | Comma-separated list of numbers or a structured Liquid array. |
| `datasets` | Array | | Array of structured dataset configurations (useful for multiple datasets). |
| `source` | String | | The filename of a YAML data source under `_data/` (excluding extension). |
| `key` | String | | Subsection key within the `source` data file (optional). |
| `dataset_label` | String | `"Dataset 1"` | Label for the default dataset when using the `data` parameter. |
| `height` | String | `"300px"` | Vertical size of the chart. |
| `color` | String | `#00ff9d` | Accent color override for lines and borders. |
| `legend` | Boolean | `true` | Show or hide the chart legend. |
| `class` | String | | Optional CSS class to append to the container. |
