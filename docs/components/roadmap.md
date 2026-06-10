---
layout: default
title: Roadmap Component
output-title: true
tags: [ui, components, tracking, progress]
description: Tracking project milestones and task completion with the advanced Roadmap system.
---

The Roadmap component is a powerful tool for visualising project progress, release schedules, or multi-step processes.

{% include comps/heading.html tag="h2" text="Basic Usage" icon="map" size=20 %}

The system consists of the `roadmap.html` container which wraps multiple [Roadmap Items](/components/roadmap-item/).

{% capture my_roadmap %}
    {% include comps/roadmap-item.html status="completed" title="Core Engine" description="Initial implementation of the modular SCSS system." %}
    {% include comps/roadmap-item.html status="active" title="UI Components" description="Developing the Roadmap and API Reference blocks." %}
{% endcapture %}

{% include comps/roadmap.html content=my_roadmap %}

{% capture roadmap_usage %}
{% raw %}
```liquid
{% capture roadmap_content %}
    {% include comps/roadmap-item.html ... %}
    {% include comps/roadmap-item.html ... %}
{% endcapture %}

{% include comps/roadmap.html content=roadmap_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=roadmap_usage %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `content` | String | A collection of `roadmap-item.html` components. |

---

{% include comps/callout.html type="tip" title="Deep Tracking" content="For details on status indicators, progress bars, and task lists, see the [Roadmap Item](/components/roadmap-item/) documentation." %}

