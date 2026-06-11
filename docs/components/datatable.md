---
layout: default
title: Data Table
output-title: true
tags: [ui, data, tables, interactive]
description: A responsive, accessible, interactive table component supporting search, sorting, and pagination.
---

The `datatable.html` component provides a professional interface for displaying structured data. It features progressive enhancement (renders standard HTML tables initially for SEO and accessibility, then enhances with sorting, search, and pagination via lightweight, zero-dependency JavaScript).

{% include comps/heading.html tag="h2" text="Live Example" icon="table" size=20 %}

{% include comps/datatable.html data_source="packages" headers="name:Name,version:Version,type:Type,downloads:Downloads,status:Status" %}

{% capture datatable_eg %}
{% raw %}
```liquid
<!-- Pass data from site.data.packages -->
{% include comps/datatable.html data_source="packages" headers="name:Name,version:Version,type:Type,downloads:Downloads,status:Status" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=datatable_eg %}

---

{% include comps/heading.html tag="h2" text="Features" icon="check-circle" size=20 %}

* **Progressive Enhancement:** Renders full table structure initially; works seamlessly even if JavaScript is disabled.
* **Interactive Controls:** Built-in live search filter, page size selector, and pagination buttons.
* **Smart Sorting:** Auto-detects numeric values vs. standard text comparisons when headers are clicked.
* **ARIA Accessibility:** Utilizes key attributes (`aria-sort`, `role="columnheader"`) and full keyboard support (`tabindex="0"`, `Enter`/`Space` trigger).

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **datatable.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data_source` | String | | The filename (without extension) under `_data/` containing the structured JSON, YAML, or CSV array (e.g. `packages`). |
| `items` | Array | | Direct array of row objects (alternative to `data_source`). |
| `headers` | String \| Array | | Comma-separated key:label mappings (e.g. `"name:Name,version:Version"`) or an array of header objects with `key` and `label` properties. |
| `id` | String | | Optional unique HTML container ID. If omitted, a unique ID is auto-generated. |
| `class` | String | | Optional custom CSS class. |
