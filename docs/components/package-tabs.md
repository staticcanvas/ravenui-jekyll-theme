---
layout: default
title: Package Tabs
output-title: true
tags: [ui, components, npm, yarn, pnpm]
description: Interactive tab component for displaying package manager installation commands.
enable_search: true
---
The `package-tabs.html` component provides a standard way to display installation commands for `npm`, `yarn`, and `pnpm` using an interactive tab interface.

{% include comps/heading.html tag="h2" text="Live Example" icon="package" size=20 %}

{% include comps/package-tabs.html package="zero-dark-sp" %}

{% capture tabs_code %}
{% raw %}
```liquid
{% include comps/package-tabs.html package="zero-dark-sp" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=tabs_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `package` | String | | The name of the package to be displayed in the installation commands. |
| `id` | String | `tabs` | Optional unique ID for the tab container. Useful when multiple tab sets are on the same page. |

---

{% include comps/callout.html type="info" title="Zero Dependencies" content="This component uses a lightweight inline script to handle tab switching, ensuring no external JavaScript libraries are required." %}
