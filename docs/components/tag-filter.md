---
layout: default
title: Tag Filter Component
output-title: true
tags: [ui, interactive, navigation, filtering]
description: A client-side interactive tag filtering component for posts and collections.
enable_search: true
---

The `tag-filter.html` component provides a zero-configuration, client-side, interactive filter button list. It allows users to refine displayed posts, documents, or custom cards by clicking on tags.

🔹 **Key Features:**
* **Auto-Extraction:** If no tags are provided, it automatically scans all target elements on the page, extracts their unique tags, and builds filter buttons dynamically.
* **URL Syncing:** Keeps the active tag filter state in sync with URL search parameters (e.g. `?tags=javascript,jekyll`), preserving selections across page refreshes.
* **AND Logic:** Multiple selected tags refine the results to only show items containing all selected tags.
* **Smooth Transitions:** Items gracefully show and hide using CSS-based transition classes.

---

{% include comps/heading.html tag="h2" text="Live Example" icon="tag" size=20 %}

Use the buttons below to filter the dummy items list:

{% include comps/tag-filter.html target=".rd-filterable-demo-item" id="demo-filter" %}

<div class="rd-blog-grid" style="margin-block-start: 1.5rem;">
  <div class="rd-blog-card rd-filterable-demo-item" data-tags="javascript,css" style="padding: 1.25rem;">
    <h3 style="font-size: 1.1rem; margin-block-end: 0.5rem;">Vanilla Javascript Canvas</h3>
    <p class="text-muted" style="font-size: 0.85rem; margin-block-end: 1rem;">Interactive dynamic canvas experiments built with vanilla js.</p>
    <div class="rd-tag-container" style="margin: 0;">
      <span class="rd-tag rd-tag--blue">#javascript</span>
      <span class="rd-tag rd-tag--purple">#css</span>
    </div>
  </div>

  <div class="rd-blog-card rd-filterable-demo-item" data-tags="jekyll,css" style="padding: 1.25rem;">
    <h3 style="font-size: 1.1rem; margin-block-end: 0.5rem;">Jekyll Theme Customization</h3>
    <p class="text-muted" style="font-size: 0.85rem; margin-block-end: 1rem;">Learn how to customize layouts and color schemes using SASS variables.</p>
    <div class="rd-tag-container" style="margin: 0;">
      <span class="rd-tag rd-tag--orange">#jekyll</span>
      <span class="rd-tag rd-tag--purple">#css</span>
    </div>
  </div>

  <div class="rd-blog-card rd-filterable-demo-item" data-tags="javascript,jekyll" style="padding: 1.25rem;">
    <h3 style="font-size: 1.1rem; margin-block-end: 0.5rem;">Ruby Plugins Integration</h3>
    <p class="text-muted" style="font-size: 0.85rem; margin-block-end: 1rem;">Building complex Jekyll sites using custom generators and filters.</p>
    <div class="rd-tag-container" style="margin: 0;">
      <span class="rd-tag rd-tag--blue">#javascript</span>
      <span class="rd-tag rd-tag--orange">#jekyll</span>
    </div>
  </div>
</div>

{% capture filter_eg %}
{% raw %}
```liquid
<!-- 1. Include the Tag Filter component and specify the CSS selector of the targets -->
{% include comps/tag-filter.html target=".rd-blog-card" %}

<!-- 2. Mark target elements with 'rd-filterable-item' (or your target selector) and 'data-tags' -->
<div class="rd-blog-grid">
  {% for post in site.posts %}
    <div class="rd-blog-card rd-filterable-item" data-tags="{{ post.tags | join: ',' | downcase }}">
      <!-- Card Content -->
    </div>
  {% endfor %}
</div>
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=filter_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `target` | String | `.rd-filterable-item` | The CSS selector of the elements to be filtered. |
| `tags` | String | | Optional comma-separated list of explicit tags (e.g. `css,js`). If omitted, tags are auto-extracted from targets. |
| `all_label` | String | `All` | The label text for the reset/all button. |
| `id` | String | `default` | Unique ID suffix for the filter container to prevent namespace collisions if using multiple filters. |
| `class` | String | | Optional CSS class to append to the filter container. |

---

{% include comps/heading.html tag="h2" text="Layout Integration" icon="settings" size=20 %}

To enable tag filtering on standard layouts like **Blog** or **Collection Indexes**, you can configure it directly in your page front-matter:

```yaml
---
layout: blog
title: Engineering Blog
enable_tag_filter: true
---
```
