---
layout: default
title: Progress Bar
output-title: true
tags: [ui, elements, status, progress]
description: Stylized bar indicators for tracking tasks, projects, or completion percentages.
enable_search: true
---
The `progress.html` component provides a clean way to show completion percentages for tasks, features, or project metrics.

{% include comps/heading.html tag="h2" text="Live Example" icon="activity" size=20 %}

{% include comps/progress.html percent=45 show_label=true title="Core Framework Implementation" %}
{% include comps/progress.html percent=75 color="#b79ced" show_label=true title="Component Hardening" %}
{% include comps/progress.html percent=100 color="#00ff9d" show_label=true title="Documentation Hardening" %}

{% capture pr_eg %}
{% raw %}
```liquid
{% include comps/progress.html percent=45 show_label=true title="Core Framework Implementation" %}
{% include comps/progress.html percent=75 color="#b79ced" show_label=true title="Component Hardening" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=pr_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `percent` | Integer | `0` | The completion percentage (0-100) driving the progress bar. |
| `color` | String | `var(--rd-clr-highlight)` | The color of the filled progress bar. |
| `size` | String | `8px` | The vertical height of the progress track. |
| `show_label` | Boolean | `false` | If set to `true`, displays the title and percentage text above the track. |
| `title` | String | | The label text displayed on the left side (only if `show_label=true`). |
| `class` | String | | Optional CSS class to append to the container. |
