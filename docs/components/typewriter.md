---
layout: default
title: Typewriter Component
output-title: true
tags: [ui, elements, animations, interactive]
description: A typing text effect for showcase headings or intro blocks.
enable_search: true
---
The `typewriter.html` component provides a polished, dynamic typing effect that cycles through a set of configured strings.

{% include comps/heading.html tag="h2" text="Live Example" icon="type" size=20 %}

<h2>
    We build
    {% include comps/typewriter.html words="Jekyll Themes|Documentation Sites|Refined Interfaces" speed=80 delay=2000 %}
</h2>

{% capture tw_eg %}
{% raw %}
```liquid
<h2>
    We build
    {% include comps/typewriter.html words="Jekyll Themes|Documentation Sites|Refined Interfaces" speed=80 delay=2000 %}
</h2>
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=tw_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `words` | String | `Hello\|World` | Pipe-separated (`\|`) list of phrases to cycle through. |
| `speed` | Integer | `100` | Typing speed in milliseconds per character. |
| `delay` | Integer | `1500` | Pause duration in milliseconds before deleting a typed phrase. |
| `id` | String | `rd-typewriter` | Unique HTML element ID (required if using multiple typewriters on one page). |
| `class` | String | | Optional CSS class to append to the container span. |
