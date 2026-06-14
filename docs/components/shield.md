---
layout: default
title: Shield Component
output-title: true
tags: [ui, elements, badges, status]
description: Pre-formatted metadata shields and status badges.
enable_search: true
---
The `shield.html` component acts as a wrapper around the Shields.io API, allowing you to easily embed SVG status badges for builds, downloads, versions, and social profiles.

{% include comps/heading.html tag="h2" text="Live Example" icon="tag" size=20 %}

<div style="display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 1.5rem;">
    {% include comps/shield.html label="build" message="passing" color="brightgreen" logo="gitlab" %}
    {% include comps/shield.html label="version" message="1.0.0" color="blue" logo="git" %}
    {% include comps/shield.html label="license" message="MIT" color="orange" %}
</div>

{% capture sh_eg %}
{% raw %}
```liquid
{% include comps/shield.html label="build" message="passing" color="brightgreen" logo="gitlab" %}
{% include comps/shield.html label="version" message="1.0.0" color="blue" logo="git" %}
{% include comps/shield.html label="license" message="MIT" color="orange" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=sh_eg %}

---

{% include comps/heading.html tag="h2" text="Linked Badges" icon="link" size=20 %}

You can pass a `link` parameter to automatically wrap the badge inside a secure hyperlink:

{% include comps/shield.html label="docs" message="latest" color="00ff9d" logo="read-the-docs" link="https://gitlab.com/staticcanvas/ravenui-sp" %}

{% capture sh_link_eg %}
{% raw %}
```liquid
{% include comps/shield.html label="docs" message="latest" color="00ff9d" logo="read-the-docs" link="https://gitlab.com/staticcanvas/ravenui-sp" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=sh_link_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | String | `build` | The label text on the left side of the badge. |
| `message` | String | `passing` | The status message text on the right side of the badge. |
| `color` | String | `brightgreen` | The color of the status side (e.g. `blue`, `brightgreen`, `red`, hex code). |
| `style` | String | `flat-square` | The visual style (`flat`, `flat-square`, `plastic`, `social`). |
| `logo` | String | | Optional icon slug from Simple Icons to display in the badge. |
| `link` | String | | Optional target URL to wrap the badge in a link. |
| `class` | String | | Optional CSS class to append to the badge. |
