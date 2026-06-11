---
layout: default
title: Figure / Caption
output-title: true
tags: [ui, media]
description: A semantic HTML figure and caption wrapper component supporting alignments (left, right, center, full) and borders.
---

The `figure.html` component provides a semantic wrapper for images (`<figure>` and `<figcaption>`), fully integrated with the ZeroDark SP design language. It supports subtle borders, link wrapping, and multiple alignment states (floated left, floated right, centered, or full-width page blocks).

{% include comps/heading.html tag="h2" text="Live Example" icon="image" size=20 %}

{% include comps/figure.html src="https://picsum.photos/800/400" caption="A premium high-resolution cover mockup sourced dynamically from Lorem Picsum." align="center" %}

{% capture figure_eg %}
{% raw %}
```liquid
<!-- Default Centered Figure -->
{% include comps/figure.html src="https://picsum.photos/800/400" caption="Image Caption Text" align="center" %}

<!-- Floated Left Image (Takes up 45% width) -->
{% include comps/figure.html src="https://picsum.photos/400/300" caption="Floated left block caption" align="left" %}

<!-- Full-width Viewport Block -->
{% include comps/figure.html src="https://picsum.photos/1200/400" caption="Full screen block" align="full" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=figure_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **figure.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `src` | String | | The source URL of the image (relative or absolute). |
| `caption` | String | | Optional caption text to render inside `<figcaption>`. |
| `alt` | String | | Optional alt text. Fallbacks to the caption if not specified. |
| `align` | String | `center` | Image placement alignment. Options: `center`, `left` (floated), `right` (floated), or `full` (full-width viewport span). |
| `border` | Boolean | `true` | Show a subtle glassmorphic border and shadow around the image. |
| `link` | String | | Optional link URL to wrap around the image. |
| `link_target` | String | | Optional anchor target attribute (e.g. `_blank`). |
| `class` | String | | Optional custom CSS class. |
| `caption_class` | String | | Optional custom CSS class for the `<figcaption>`. |
