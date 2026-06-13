---
layout: default
title: Image Carousel
output-title: true
tags: [ui, elements, media, image, interactive]
description: A responsive sliding deck carousel for showcasing multiple images and slides.
enable_search: true
---
The `carousel.html` component allows users to cycle through a list of images or custom HTML slides. Each image in the deck supports lazy loading and blur-up placeholder effects.

{% include comps/heading.html tag="h2" text="Image Carousel Example" icon="image" size=20 %}

{% assign img_slides = "
- src: https://picsum.photos/id/10/800/400
  alt: Forest landscape
  caption: A beautiful misty forest landscape (Lorem Picsum ID: 10)
- src: https://picsum.photos/id/28/800/400
  alt: Forest road
  caption: An empty road curving through pine woods (Lorem Picsum ID: 28)
" | from_yaml %}

{% include comps/carousel.html id="img-example-carousel" items=img_slides height="300px" %}

{% capture img_eg %}
{% raw %}
```liquid
{% assign slides = "
- src: https://picsum.photos/id/10/800/400
  alt: Forest landscape
  caption: A beautiful misty forest landscape (Lorem Picsum ID: 10)
- src: https://picsum.photos/id/28/800/400
  alt: Forest road
  caption: An empty road curving through pine woods (Lorem Picsum ID: 28)
" | from_yaml %}

{% include comps/carousel.html 
   id="img-carousel" 
   items=slides 
   height="300px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=img_eg %}

---

{% include comps/heading.html tag="h2" text="Non-Image Carousel Example" icon="sliders" size=20 %}

{% assign text_slides = "
- content: '<h3>**Slide One**</h3><p>This is a custom content slide. You can embed arbitrary Markdown or HTML text here.</p>'
- content: '<h3>**Slide Two**</h3><p>Perfect for displaying testimonials, quotes, or mini-features.</p>'
" | from_yaml %}

{% include comps/carousel.html id="text-example-carousel" items=text_slides height="180px" %}

{% capture text_eg %}
{% raw %}
```liquid
{% assign slides = "
- content: '<h3>**Slide One**</h3><p>This is a custom content slide. You can embed arbitrary Markdown or HTML text here.</p>'
- content: '<h3>**Slide Two**</h3><p>Perfect for displaying testimonials, quotes, or mini-features.</p>'
" | from_yaml %}

{% include comps/carousel.html 
   id="text-carousel" 
   items=slides 
   height="180px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=text_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `"carousel-1"` | Unique container ID, required to support multiple carousels on a single page. |
| `items` | Array | `page.carousel_images` | Array of slide objects. |
| `height` | String | `"400px"` | Height of the carousel viewport (e.g. `250px`, `50vh`). |
| `class` | String | | Optional CSS class to append to the container. |

### **Slide Item Properties**

Each object in the `items` array supports the following fields:

| Field | Type | Description |
| :--- | :--- | :--- |
| `src` | String | Path or URL to the main slide image (ignored if `content` is provided). |
| `low_res_src` | String | Optional path to low-resolution thumbnail for blur-up loading. |
| `alt` | String | Alt text for the slide image. |
| `caption` | String | Caption text displayed below the image. |
| `content` | String | HTML or Markdown content to display inside the slide (bypasses image rendering). |
