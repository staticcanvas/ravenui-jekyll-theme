---
layout: default
title: Component Playground
output-title: true
tags: [ui, interactive, development, playground]
description: A component playground that provides interactive live previews with configurable properties.
enable_search: true
---

The `playground.html` component is a powerful developer utility. It generates a live preview canvas with editable properties, allowing developers and site builders to configure components visually and copy the matching Liquid code.

🔹 **Key Features:**
* **Interactive Preview:** Change parameters using inputs, selects, and checkboxes, seeing changes reflect instantly.
* **Liquid Code Generation:** Dynamic code blocks update in real time showing the exact parameters selected.
* ** Lucide Icon Sync:** Automatically queries the client-side Lucide parser to live-render icons upon text entry.
* **Copy to Clipboard:** Float-button copies the Liquid code snippet immediately for pasting.

---

{% include comps/heading.html tag="h2" text="Live Example: Button Playground" icon="play" size=20 %}

{% include comps/playground.html component="button" id="demo-btn" %}

---

{% include comps/heading.html tag="h2" text="Live Example: Callout Playground" icon="info" size=20 %}

{% include comps/playground.html component="callout" id="demo-callout" %}

---

{% include comps/heading.html tag="h2" text="Usage" icon="settings" size=20 %}

To render a component playground on your documentation page, simply include it and pass the `component` property name:

```liquid
<!-- Button Playground -->
{% include comps/playground.html component="button" %}

<!-- Callout Playground -->
{% include comps/playground.html component="callout" %}

<!-- Alert Playground -->
{% include comps/playground.html component="alert" %}

<!-- Tag Playground -->
{% include comps/playground.html component="tag" %}
```

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `component` | String | `button` | The name of the target component playground to render (`button`, `callout`, `alert`, `tag`). |
| `id` | String | `component` | Unique ID suffix for namespaces (required if multiple playgrounds of the same type are on the same page). |
