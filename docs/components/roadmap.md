---
layout: default
title: Roadmap Component
output-title: true
tags: [ui, components, tracking, progress, data]
description: Visualise project milestones and release schedules using inline content or YAML data sources.
enable_search: true
---
The Roadmap component provides a visual vertical tracker for project milestones, release schedules, or multi-step processes. It supports two rendering modes: **data-driven** (from a YAML `_data/` file or page front-matter array) and **content-capture** (legacy, composing `roadmap-item.html` inline).

---

{% include comps/heading.html tag="h2" text="Data-Driven Mode" icon="database" size=20 %}

The simplest way to create a roadmap is to define items in a YAML file under `_data/` and reference it with `data_source`:

{% include comps/roadmap.html data_source="roadmap" %}

{% capture roadmap_data_eg %}
{% raw %}
```liquid
<!-- _data/roadmap.yml -->
- status: completed
  title: "Core Layout Engine"
  description: "The modular SCSS foundation..."
  show_progress: true
  percent: 100
- status: active
  title: "Dual-Mode Data Components"
  description: "Timeline, Roadmap, Charts now accept YAML or inline data."
  show_progress: true
  percent: 65
- status: planned
  title: "RubyGems Release"

<!-- page.md -->
{% include comps/roadmap.html data_source="roadmap" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=roadmap_data_eg %}

---

{% include comps/heading.html tag="h2" text="Inline Items Mode" icon="list" size=20 %}

You can also pass an array defined in a page's front-matter or a captured Liquid variable as the `items` parameter:

{% capture roadmap_inline_eg %}
{% raw %}
```yaml
# page.md front-matter
roadmap_items:
  - status: completed
    title: "Phase 1"
    description: "Initial scaffolding."
    show_progress: true
    percent: 100
  - status: active
    title: "Phase 2"
    description: "Feature expansion."
    show_progress: true
    percent: 40
```

```liquid
{% include comps/roadmap.html items=page.roadmap_items %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=roadmap_inline_eg %}

---

{% include comps/heading.html tag="h2" text="Content Capture Mode (Legacy)" icon="code" size=20 %}

The original approach manually captures `roadmap-item.html` includes:

{% capture my_roadmap %}
    {% include comps/roadmap-item.html status="completed" title="Core Engine" description="Initial implementation of the modular SCSS system." show_progress=true percent=100 %}
    {% include comps/roadmap-item.html status="active" title="UI Components" description="Developing the Roadmap and API Reference blocks." show_progress=true percent=60 %}
    {% include comps/roadmap-item.html status="planned" title="RubyGems Release" description="Package and publish to RubyGems.org." %}
{% endcapture %}
{% include comps/roadmap.html content=my_roadmap %}

{% capture roadmap_capture_eg %}
{% raw %}
```liquid
{% capture roadmap_content %}
    {% include comps/roadmap-item.html status="completed" title="Core Engine" ... %}
    {% include comps/roadmap-item.html status="active" title="UI Components" ... %}
{% endcapture %}

{% include comps/roadmap.html content=roadmap_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=roadmap_capture_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **roadmap.html Parameters**

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `data_source` | String | Dot-notated path to a `_data/` YAML/JSON file (e.g., `"roadmap"` or `"project.milestones"`). |
| `items` | Array | Direct YAML array of roadmap item objects. Accepts `page.roadmap_items` or a Liquid variable. |
| `content` | String | Legacy: a captured string of `roadmap-item.html` includes. Used when neither `data_source` nor `items` are set. |
| `class` | String | Optional extra CSS class appended to the `rd-roadmap` wrapper. |

### **Roadmap Item Object Properties**

| Property | Type | Description |
| :--- | :--- | :--- |
| `status` | String | `completed`, `active`, or `planned` (controls the dot color and label style). |
| `title` | String | The name of the milestone or phase. |
| `description` | String | Short summary paragraph (rendered as plain text). |
| `milestone_url` | String | Optional URL linking to a GitHub/GitLab milestone. |
| `show_progress` | Boolean | Enables the progress bar track. Defaults to `false`. |
| `percent` | Integer | Percentage completion for the progress bar (0–100). |
| `tasks` | String | Pipe-separated list of sub-tasks rendered as a `<ul>` (e.g., `"Task A | Task B | Task C"`). |

---

{% include comps/callout.html type="tip" title="Nested Data Sources" content="You can use dot-notation to access nested data: `data_source=\"project.roadmap\"` will resolve to `site.data.project.roadmap`." %}
