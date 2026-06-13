---
layout: default
title: Dependencies
output-title: true
tags: [ui, data, documentation]
description: A component for displaying the dependencies of a component, with links to their documentation pages.
enable_search: true
---
The `dependencies.html` component provides a standard, visual way to list which sub-components a particular component relies upon. Badges automatically link to the corresponding component documentation pages under the `/components/` path.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% include comps/dependencies.html deps="icon,button" %}

{% capture deps_eg %}
{% raw %}
```liquid
<!-- List dependencies for a complex component -->
{% include comps/dependencies.html deps="icon,button" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=deps_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **dependencies.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `deps` | String | | A comma-separated list of component names (e.g. `icon,button`). |
| `class` | String | | Optional custom CSS class. |
