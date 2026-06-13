---
layout: default
title: Image Carousel
output-title: true
tags: [ui, elements, media, image, interactive]
description: A responsive sliding deck carousel for showcasing multiple images and slides.
---

The `carousel.html` component allows users to cycle through a list of images. Each image in the deck supports lazy loading and blur-up placeholder effects.

{% include comps/heading.html tag="h2" text="Live Example" icon="play" size=20 %}

{% assign test_slides = "
- src: /favicon.svg
  alt: Slide One Logo
  caption: Logo Presentation Slide One
- src: /logo.svg
  alt: Slide Two Logo
  caption: Logo Presentation Slide Two
" | from_yaml %}

{% include comps/carousel.html id="doc-example-carousel" items=test_slides height="200px" %}

{% capture car_eg %}
{% raw %}
```liquid
{% assign slides = "
- src: /favicon.svg
  alt: Slide One Logo
  caption: Logo Presentation Slide One
- src: /logo.svg
  alt: Slide Two Logo
  caption: Logo Presentation Slide Two
" | from_yaml %}

{% include comps/carousel.html 
   id="docs-carousel" 
   items=slides 
   height="250px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=car_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `"carousel-1"` | Unique container ID, required to support multiple carousels on a single page. |
| `items` | Array | `page.carousel_images` | Array of slide objects. Each object should have: `src`, `low_res_src` (optional), `alt` (optional), `caption` (optional). |
| `height` | String | `"400px"` | Height of the carousel viewport (e.g. `250px`, `50vh`). |
| `class` | String | | Optional CSS class to append to the container. |
