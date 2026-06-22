---
layout: default
title: Layout Visualizer Component
output-title: true
tags: [ui, interactive, layout, visualizer]
description: A layout visualizer component to demonstrate alternative RavenUI layout structures.
enable_search: true
---

The `layout-visualizer.html` component provides a schematic mock browser viewport. It lets users interactively toggle between layouts to understand site structure variations in RavenUI.

🔹 **Key Features:**
* **Interactive Toggles:** Toggle between Default documentation layouts, top header bars, and blank dashboard modes.
* **Animated State Shift:** Smooth CSS grid transitions demonstrate the layout modifications in real time.
* **Inline Definitions:** Dynamic descriptions explain the features, benefits, and use cases of each layout structure option.

---

{% include comps/heading.html tag="h2" text="Live Example" icon="monitor" size=20 %}

{% include comps/layout-visualizer.html id="demo-vis" %}

---

{% include comps/heading.html tag="h2" text="Usage" icon="settings" size=20 %}

To render a layout visualizer on any page, include the component:

{% raw %}
```liquid
{% include comps/layout-visualizer.html %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `default` | Unique ID suffix for namespaces (required if displaying multiple visualizers on the same page). |
