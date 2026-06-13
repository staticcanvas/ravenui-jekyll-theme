---
layout: default
title: Details Component
output-title: true
tags: [ui, elements, collapsible]
description: A collapsible disclosures block for folding secondary or large content sections.
enable_search: true
---
The `details.html` component provides a styled disclosures dropdown. It utilizes the native HTML `<details>` and `<summary>` elements under the hood to ensure accessibility and support without requiring JavaScript.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% capture details_content %}
This is the collapsed content area. You can put any markdown, code blocks, or nested components inside this block, and it will remain hidden until expanded by the user.
{% endcapture %}
{% include comps/details.html summary="Click to expand details" content=details_content %}

{% capture details_eg %}
{% raw %}
```liquid
{% capture details_content %}
This is the collapsed content area. You can put any markdown, code blocks, or nested components inside this block.
{% endcapture %}

{% include comps/details.html 
   summary="Click to expand details" 
   content=details_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=details_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `summary` | String | `"Details"` | The header text shown on the summary line. |
| `content` | String | | The collapsed inner HTML or Markdown content. |
| `open` | Boolean | `false` | Sets the disclosures block to be open/expanded by default. |
| `class` | String | | Optional CSS class to append to the container. |
