---
layout: default
title: Extra Components
output-title: true
tags: [ui, elements, media, api, wiki, gaming, interactive]
description: Advanced media, wiki, and dynamic API client-side fetching components.
enable_search: true
---

The Extra Components category provides specialized UI modules for displaying rich media content, gaming/unit statistics, loading indicators, and client-side dynamic content queries.

---

{% include comps/heading.html tag="h2" text="Themed Spinner" icon="loader" size=20 %}

### **Dynamic Loading Indicators**

The `extra-spinner.html` component provides a CSS-animated loading indicator that respects the theme's color variables.

{% include comps/extra-spinner.html size="medium" color="accent" label="Processing..." %}

{% capture spinner_eg %}
{% raw %}
```liquid
<!-- Standard Accent Spinner -->
{% include comps/extra-spinner.html size="medium" color="accent" label="Processing..." %}

<!-- Large Warning Spinner -->
{% include comps/extra-spinner.html size="large" color="warning" label="Loading data..." %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=spinner_eg %}

---

{% include comps/heading.html tag="h2" text="Media Card" icon="image" size=20 %}

### **High-Density Media Profiles**

The `extra-media-card.html` displays an individual media item (anime, film, game, book, album) featuring title, rating badge, year, genres, and a short description.

<div style="max-width: 300px;">
  {% include comps/extra-media-card.html data=site.data.extra_media.anime_bebop %}
</div>

{% capture card_eg %}
{% raw %}
```liquid
<!-- Sourced from _data/extra_media.yml -->
{% include comps/extra-media-card.html data=site.data.extra_media.anime_bebop %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=card_eg %}

---

{% include comps/heading.html tag="h2" text="Media Details Block" icon="file-text" size=20 %}

### **Expanded Media Metadata & Backdrops**

The `extra-media-details.html` component structures full profile details, backdrop visuals, genre tags, and technical tables.

{% include comps/extra-media-details.html data=site.data.extra_media.anime_bebop %}

{% capture details_eg %}
{% raw %}
```liquid
{% include comps/extra-media-details.html data=site.data.extra_media.anime_bebop %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=details_eg %}

---

{% include comps/heading.html tag="h2" text="Wiki & Unit Stats Grid" icon="table" size=20 %}

### **Warhammer & RPG Stat Blocks**

The `extra-wiki-grid.html` component displays high-density statistic boxes suitable for gaming wikis (like Warhammer 40k unit profiles) or character databases.

{% include comps/extra-wiki-grid.html stats=site.data.extra_media.warhammer_unit.stats title="Primaris Intercessor Attributes" %}

{% capture wiki_eg %}
{% raw %}
```liquid
{% include comps/extra-wiki-grid.html 
   stats=site.data.extra_media.warhammer_unit.stats 
   title="Primaris Intercessor Attributes" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=wiki_eg %}

---

{% include comps/heading.html tag="h2" text="Dynamic API Fetcher" icon="globe" size=20 %}

### **Client-Side Fetching & Local Storage Cache**

The `extra-api-fetcher.html` component executes client-side JSON queries, handles rate limiting, caches responses inside `localStorage` (with configurable expiry times), and handles loading states automatically. It natively decodes Jikan (anime) API formats as well as generic media payload shapes.

{% include comps/extra-api-fetcher.html 
   endpoint="https://api.jikan.moe/v4/anime/1" 
   cache_key="bebop-jikan" 
   cache_expiry=3600 
   render_type="media-card" %}

{% capture fetcher_eg %}
{% raw %}
```liquid
<!-- Fetch from Jikan API and render as a Media Card, cached for 1 hour (3600 seconds) -->
{% include comps/extra-api-fetcher.html 
   endpoint="https://api.jikan.moe/v4/anime/1" 
   cache_key="bebop-jikan" 
   cache_expiry=3600 
   render_type="media-card" %}

<!-- Fetch and render as a Media Details Block -->
{% include comps/extra-api-fetcher.html 
   endpoint="https://api.jikan.moe/v4/anime/1" 
   cache_key="bebop-jikan-details" 
   cache_expiry=86400 
   render_type="media-details" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=fetcher_eg %}

---

{% include comps/heading.html tag="h2" text="Related Carousel" icon="sliders" size=20 %}

### **Dynamic Media Deck Carousel**

The `extra-related-carousel.html` groups multiple media items into a clean, horizontal carousel deck.

{% include comps/extra-related-carousel.html items=site.data.extra_media.related_media id="related-carousel-demo" %}

{% capture carousel_eg %}
{% raw %}
```liquid
{% include comps/extra-related-carousel.html 
   items=site.data.extra_media.related_media 
   id="related-carousel-demo" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=carousel_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **Extra Spinner Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `size` | String | `"medium"` | Spinner diameter dimensions: `"small"`, `"medium"`, `"large"`. |
| `color` | String | `"accent"` | Accent coloring classes: `"accent"`, `"warning"`, `"danger"`, `"info"`, `"purple"`. |
| `label` | String | | Optional text helper positioned below the ring. |

### **Extra Media Card Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data` | Object | | The media item structure to render. |
| `glass` | Boolean | `false` | Enable a translucent glassmorphism background style. |

### **Extra Media Details Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data` | Object | | The expanded media item structure to render. |
| `glass` | Boolean | `false` | Enable a translucent glassmorphism background style. |

### **Extra Wiki Grid Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `stats` | Key-Value | | Key-value pairs containing unit/character attributes. |
| `title` | String | | Header title positioned above the grid matrix. |

### **Extra Related Carousel Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `items` | Array | | List of media items to render as individual slides. |
| `id` | String | `"related-carousel"` | Unique slider container ID. |
| `height` | String | `"auto"` | Slide frame height limits. |

### **Extra API Fetcher Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `endpoint` | String | | API URL location to call via HTTP fetch. |
| `cache_key` | String | | Cache key storage name for localStorage. |
| `cache_expiry` | Integer | `3600` | Expiration time duration in seconds. |
| `render_type` | String | `"media-card"` | Target rendering output layout: `"media-card"` or `"media-details"`. |
| `glass` | Boolean | `false` | Enable a translucent glassmorphism style on rendering. |
