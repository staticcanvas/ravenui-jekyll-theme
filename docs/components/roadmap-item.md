---
layout: default
title: Roadmap Item
output-title: true
tags: [ui, components, tracking]
description: Individual milestone or task entry for the Roadmap component.
---

The `roadmap-item.html` component represents a single entry within a `roadmap.html` container. It supports status indicators, progress bars, and task lists.

{% include comps/heading.html tag="h2" text="Live Example" icon="map-pin" size=20 %}

{% include comps/roadmap-item.html 
   status="active" 
   title="Beta Phase" 
   description="Finalizing the iconography system."
   percent=75
   tasks="Fix SVG alignment | Add spin animation | Document icons"
   milestone_url="#"
%}

{% capture item_code %}
{% raw %}
```liquid
{% include comps/roadmap-item.html 
   status="active" 
   title="Beta Phase" 
   description="Finalizing the iconography system."
   percent=75
   tasks="Fix SVG alignment | Add spin animation | Document icons"
   milestone_url="https://github.com/..."
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=item_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `title` | String | The heading for this roadmap entry. |
| `description` | String | A brief summary of the milestone. |
| `status` | String | `completed`, `active`, or `Planned`. |
| `percent` | Number | A percentage (0-100) to render a progress bar. |
| `tasks` | String | A pipe-separated (`|`) list of sub-tasks. |
| `milestone_url` | URL | Link to an external issue or milestone. |

---

{% include comps/callout.html type="important" title="Usage Note" content="This component is designed to be used *inside* a `roadmap.html` include. It will not render its vertical connector line correctly if used in isolation." %}
