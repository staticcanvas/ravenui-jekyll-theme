---
layout: default
title: Timeline
output-title: true
tags: [ui, data, timeline, interactive]
description: A professional vertical chronological timeline component supporting custom icons and accent colors.
---

The `timeline.html` component provides a structured chronological vertical flow. It is ideal for showing project milestones, changelogs, or onboarding steps.

{% include comps/heading.html tag="h2" text="Live Example" icon="activity" size=20 %}

{% include comps/timeline.html data_source="history" %}

{% capture timeline_eg %}
{% raw %}
```liquid
<!-- Pass data from site.data.history -->
{% include comps/timeline.html data_source="history" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=timeline_eg %}

---

{% include comps/heading.html tag="h2" text="Data Format" icon="file-text" size=20 %}

Structure your timeline items as a list of YAML objects, either in a page's front-matter or in a global site data file (e.g., `_data/history.yml`):

```yaml
- date: "April 2026"
  title: "V1.0.0 Release"
  body: "The core engine of Zero-Dark is finalized, introducing high-performance dark layouts and glassmorphism styling."
  icon: "check-circle"
  color: "var(--zd-clr-viridian)"
- date: "May 2026"
  title: "Liquid IRL & Components Expansion"
  body: "Introduced the Liquid IRL developer guide and created 22 atomic components for displaying structured metrics and metadata."
  icon: "cpu"
  color: "var(--zd-clr-info)"
```

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **timeline.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data_source` | String | | The filename (without extension) under `_data/` containing the structured JSON or YAML array (e.g. `history`). |
| `items` | Array | | Direct array of timeline event objects (alternative to `data_source`). |
| `class` | String | | Optional custom CSS class for the wrapper container. |

### **Timeline Item Properties**

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `date` | String | | The date, year, or time label for the event. |
| `title` | String | | The main title/header of the event. |
| `body` | String | | Optional Markdown body text summarizing the event details. |
| `icon` | String | | Optional Lucide icon name to display inside the timeline badge node. |
| `color` | String | | Optional accent color (hex, rgb, or CSS variable) for the event node and date text. |
