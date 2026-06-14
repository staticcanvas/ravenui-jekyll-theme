---
layout: default
title: System Metrics Grid
output-title: true
tags: [ui, layout, data, widgets]
description: A high-density system metrics container and cards component to display core KPIs, metrics, and indicators.
metrics_data:
  - title: CPU Usage
    value: 14.8%
    icon: cpu
    trend: "+1.2%"
    trend_type: up
    color: "var(--rd-clr-viridian)"
  - title: Memory Heap
    value: 256MB
    icon: hard-drive
    trend: "-12%"
    trend_type: down
    color: "var(--rd-clr-info-alt)"
  - title: Network In
    value: 4.8MB/s
    icon: activity
    trend: "Stable"
    trend_type: neutral
    color: "var(--rd-clr-warning-alt)"
  - title: API Success
    value: 99.98%
    icon: check-circle
    trend: "+0.02%"
    trend_type: up
    color: "var(--rd-clr-viridian)"
enable_search: true
---
The `metrics.html` component provides a high-density, highly responsive grid container designed specifically to showcase KPIs, system performance counters, and application metrics. Each card supports a color-coded vertical highlight bar, custom Lucide icons, status trends, and hover elevations.

{% include comps/heading.html tag="h2" text="Live Example" icon="cpu" size=20 %}

{% include comps/metrics.html items=page.metrics_data %}

{% capture metrics_eg %}
{% raw %}
```liquid
<!-- Pass an array of metric objects via front-matter or site data -->
{% include comps/metrics.html items=page.metrics_data %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=metrics_eg %}

---

{% include comps/heading.html tag="h2" text="Front-Matter/Data Format" icon="file-text" size=20 %}

Structure your metrics items as a list of YAML objects, either in a page's front-matter or in a global site data file (e.g., `_data/metrics.yml`):

```yaml
metrics_data:
  - title: CPU Usage
    value: 14.8%
    icon: cpu
    trend: "+1.2%"
    trend_type: up
    color: "var(--rd-clr-viridian)"
  - title: Memory Heap
    value: 256MB
    icon: hard-drive
    trend: "-12%"
    trend_type: down
    color: "var(--rd-clr-info-alt)"
```

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **metrics.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `items` | Array | | List of metric card objects to display. |
| `grid_size` | String | `180px` | The minimum width of each card in the grid (`minmax(grid_size, 1fr)`). |
| `class` | String | | Optional custom CSS class. |

### **Metric Card Properties**

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | | The label/name of the metric (e.g. `Memory`). |
| `value` | String | | The main scalar value to display (e.g. `12GB`). |
| `icon` | String | | Optional Lucide icon name to display beside the title. |
| `trend` | String | | Optional trend text or value (e.g. `+10%`). |
| `trend_type` | String | `neutral` | The trend color indicator (`up` for green, `down` for red, `neutral` for grey). |
| `color` | String | | Optional custom accent color (hex, rgb, var) for highlights and icon. |
