---
layout: default
title: Previously Read Tracker
output-title: true
tags: [ui, elements, display, interactive, utility]
description: LocalStorage-backed reading history tracker list.
---

The `previously-read.html` component reads visit history from the client's `localStorage` and displays a list of recently viewed documentation pages, allowing users to trace back their reading path easily.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

Since this component operates on local browser history, it will render live links for pages you have visited during this browsing session.

{% include comps/previously-read.html %}

{% capture pr_eg %}
{% raw %}
```liquid
{% include comps/previously-read.html %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=pr_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `class` | String | | Optional CSS class to append to the container. |
