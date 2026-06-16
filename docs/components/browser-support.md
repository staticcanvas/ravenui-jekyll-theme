---
layout: default
title: Browser Support
output-title: true
tags: [ui, components, compatibility]
description: Displays engine compatibility and version support indicators for modern web browsers.
enable_search: true
---
The `browser-support.html` component renders engine compatibility metrics (Chrome, Edge, Firefox, Safari) with support for status variants and minimum version parameters.

{% include comps/heading.html tag="h2" text="Live Example" icon="monitor" size=20 %}

{% include comps/browser-support.html 
    chrome="100+" 
    edge="yes" 
    firefox="partial" 
    safari="no" 
%}

{% capture browser_code %}
{% raw %}
```liquid
{% include comps/browser-support.html 
    chrome="100+" 
    edge="yes" 
    firefox="partial" 
    safari="no" 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=browser_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `chrome` | String | `yes` | Support status or version number for Google Chrome (e.g. `yes`, `no`, `partial`, `104+`). |
| `edge` | String | `yes` | Support status or version number for Microsoft Edge. |
| `firefox` | String | `yes` | Support status or version number for Mozilla Firefox. |
| `safari` | String | `yes` | Support status or version number for Apple Safari. |
| `class` | String | | Additional CSS classes for custom styling. |
