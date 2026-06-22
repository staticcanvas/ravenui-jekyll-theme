---
layout: default
title: Feature Flags
output-title: true
tags: [architecture, setup, custom]
description: Global configuration switches and status dashboard for RavenUI theme modules.
enable_search: true
permalink: /components/feature-flags/
---

The `feature-flags.html` component provides a real-time visual dashboard showing the status (Active or Inactive) of all theme settings and feature toggles compiled inside your Jekyll `_config.yml`.

{% include comps/heading.html tag="h2" text="Live Dashboard" icon="layout-grid" size=20 %}

{% include comps/feature-flags.html %}

---

{% include comps/heading.html tag="h2" text="Usage" icon="code" size=20 %}

To embed this feature flags dashboard on any page of your documentation:

{% raw %}
```liquid
{% include comps/feature-flags.html %}
```
{% endraw %}
