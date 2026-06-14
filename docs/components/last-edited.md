---
layout: default
title: Last Edited
output-title: true
tags: [ui, elements, display, metadata]
description: Displays the last modified timestamp and editor/author information.
enable_search: true
---
The `last-edited.html` component prints a small metadata line showing when a page was last updated and optionally who edited it.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% include comps/last-edited.html date="2026-06-10 14:30:00" author="sgkens" %}

{% capture le_eg %}
{% raw %}
```liquid
{% include comps/last-edited.html 
   date="2026-06-10 14:30:00" 
   author="sgkens" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=le_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `enabled` | Boolean | `site.rd_last_edited` or `true` | Set to `false` to explicitly hide this component instance. |
| `date` | String | `page.last_modified_at` or `page.last_edited` or `page.date` | Timestamp or date string to display. |
| `author` | String | `page.last_edited_by` or `page.author` or `site.author.name` | Editor's name. |
| `format` | String | `"%B %d, %Y at %I:%M %p"` | Liquid date format string. |
| `color` | String | `var(--rd-clr-slate)` | CSS color variable or hex code for the text. |
