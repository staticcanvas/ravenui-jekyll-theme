---
layout: default
title: Tilted Carousel
output-title: true
tags: [ui, elements, media, card, interactive, 3d]
description: A 3D Coverflow-style card carousel featuring overlapping tilted cards and interactive back-face flipping.
enable_search: true
---
The `tilted-carousel.html` component arranges a list of cards in a 3D perspective space. Non-active cards overlap, tilt towards the center, and dim into the background. Spacing scales dynamically according to card density. Hovering over the active card flips it around the Y-axis to reveal back-face specifications, metadata, and link actions.

---

{% include comps/heading.html tag="h2" text="Interactive 3D Demo" icon="layout" size=20 %}

{% assign demo_cards = '
- title: "RavenUI Architecture"
  badge: "Design System"
  description: "A premium, modular design system and layout framework built specifically for Jekyll and StaticCanvas."
  image: "https://picsum.photos/id/180/400/300"
  back_title: "Key Framework Pillars"
  back_description: "Focuses on high visual aesthetics, performance constraints, and total accessibility compliance."
  back_details:
    - "Modular SASS architecture"
    - "Native CSS cascade layers"
    - "prefers-reduced-motion safe"
  link: "/docs/variables"
  link_text: "Variables Guide"
- title: "Coverflow Layout"
  badge: "3D Space"
  description: "3D translation and depth rotations that stack cards dynamically according to viewport perspective."
  image: "https://picsum.photos/id/60/400/300"
  back_title: "3D Matrix Details"
  back_description: "Arranges cards using perspective matrix calculations on client viewport width and element count."
  back_details:
    - "Hardware-accelerated rotateY"
    - "Auto-overlapping calculations"
    - "Responsive flex track"
  link: "/docs/developer-guide/"
  link_text: "Dev Guide"
- title: "Motion & Transitions"
  badge: "Interactions"
  description: "Delightful card-flipping transitions on hover to reveal back-face info with spring-like easings."
  image: "https://picsum.photos/id/85/400/300"
  back_title: "GPU Flip Details"
  back_description: "Leverages backface-visibility hidden and 3D transforms for butter-smooth interactions."
  back_details:
    - "Time-slow bezier transition"
    - "Backface hidden mapping"
    - "Zero layout shifts"
  link: "/docs/customization/"
  link_text: "Customization"
' | from_yaml %}

{% include comps/tilted-carousel.html id="demo-tilted-carousel" items=demo_cards height="450px" %}

{% capture demo_eg %}
{% raw %}
```liquid
{% assign cards = '
- title: "RavenUI Architecture"
  badge: "Design System"
  description: "A premium, modular design system and layout framework built specifically for Jekyll and StaticCanvas."
  image: "https://picsum.photos/id/180/400/300"
  back_title: "Key Framework Pillars"
  back_description: "Focuses on high visual aesthetics, performance constraints, and total accessibility compliance."
  back_details:
    - "Modular SASS architecture"
    - "Native CSS cascade layers"
    - "prefers-reduced-motion safe"
  link: "/docs/variables"
  link_text: "Variables Guide"
- title: "Coverflow Layout"
  badge: "3D Space"
  description: "3D translation and depth rotations that stack cards dynamically according to viewport perspective."
  image: "https://picsum.photos/id/60/400/300"
  back_title: "3D Matrix Details"
  back_description: "Arranges cards using perspective matrix calculations on client viewport width and element count."
  back_details:
    - "Hardware-accelerated rotateY"
    - "Auto-overlapping calculations"
    - "Responsive flex track"
  link: "/docs/developer-guide/"
  link_text: "Dev Guide"
- title: "Motion & Transitions"
  badge: "Interactions"
  description: "Delightful card-flipping transitions on hover to reveal back-face info with spring-like easings."
  image: "https://picsum.photos/id/85/400/300"
  back_title: "GPU Flip Details"
  back_description: "Leverages backface-visibility hidden and 3D transforms for butter-smooth interactions."
  back_details:
    - "Time-slow bezier transition"
    - "Backface hidden mapping"
    - "Zero layout shifts"
  link: "/docs/customization/"
  link_text: "Customization"
' | from_yaml %}

{% include comps/tilted-carousel.html 
   id="my-tilted-carousel" 
   items=cards 
   height="450px" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=demo_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `"tilted-carousel-1"` | Unique identifier for the carousel container instance. Required when placing multiple carousels. |
| `items` | Array | `page.tilted_carousel_items` | Array of card data objects. Falls back to YAML data file or site data if empty. |
| `data_source` | String | `"tilted_carousel"` | Key path in `site.data` (e.g. `tilted_carousel`) to load cards dynamically from. |
| `height` | String | `"450px"` | Vertical bounds of the carousel viewport (supports any CSS units). |
| `card_width` | String | `"280px"` | Fixed width of each individual card item. |
| `card_height` | String | `"380px"` | Fixed height of each individual card item. |
| `class` | String | | Optional CSS class to append to the container. |

### **Card Item Properties**

Each card object in the `items` array supports the following properties:

| Field | Type | Description |
| :--- | :--- | :--- |
| `title` | String | Main title text displayed on the front face. |
| `description` | String | Short description paragraph on the front face. |
| `image` | String | URL or path to background image for the front face top cover. |
| `badge` | String | Short text tag rendered above the title on the front face. |
| `back_title` | String | Optional heading for the back face (defaults to front `title`). |
| `back_description`| String | Narrative explanation text displayed on the back face. |
| `back_details` | Array | List of bullet points rendered with visual tokens on the back face. |
| `link` | String | Target path or URL for the call-to-action button. |
| `link_text` | String | Text label inside the CTA button (defaults to `"Learn More"`). |
| `link_external` | Boolean | Opens the link target in a new browser tab when set to `true`. |

---

{% include comps/heading.html tag="h2" text="Accessibility and Fallback Design" icon="shield" size=20 %}

- **Focus Navigation:** Cards are interactive. Background cards receive `aria-hidden="true"` and `tabindex="-1"` to keep assistive devices focused on the active card. Active cards are fully focusable and navigable.
- **Card Selection:** Clicking any background card automatically brings it forward and focuses it as the active card.
- **Motion Reduction:** When `prefers-reduced-motion: reduce` is active, all 3D transforms, perspectives, rotations, and absolute overlapping styles are disabled. The component transparently adapts to a vertical stack layout listing both front and back specifications sequentially.
