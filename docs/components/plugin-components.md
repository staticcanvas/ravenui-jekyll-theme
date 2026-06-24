---
layout: default
title: Plugin-Powered Components
output-title: true
tags: [components, plugins, feed, pagination, gist]
description: Enhance your documentation site using components that integrate with popular Jekyll plugins.
permalink: /components/plugin-components/
enable_search: true
---

RavenUI provides first-class component wrappers for the most popular, long-lived Jekyll plugins. These components are automatically responsive, conform to the theme's high-contrast design variables, and support advanced rendering options.

---

{% include comps/heading.html tag="h2" text="1. Paginator (paginator.html)" icon="list" size=20 %}

The `paginator.html` component renders a beautiful, premium pagination panel for blogs or listings. It integrates directly with Jekyll's built-in **`jekyll-paginate`** or **`jekyll-paginate-v2`** plugins.

> [!NOTE]
> **Automatic Lifecyle**
> The component automatically resolves page paths and disables arrows when at the first or last page. It will output nothing if there is only a single page (`paginator.total_pages <= 1`).

### **Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `class` | String | — | Optional custom CSS class for wrapping element. |

### **Usage Example**

To use pagination, you must configure `jekyll-paginate` in your `_config.yml` (e.g., `paginate: 5`) and place the loop on a paginated HTML page:

{% raw %}
```liquid
<!-- Loop through paginated posts -->
{% for post in paginator.posts %}
  {% include comps/card.html title=post.title content=post.excerpt %}
{% endfor %}

<!-- Render pagination controls -->
{% include comps/paginator.html %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="2. GitHub Gist Wrapper (gist.html)" icon="github" size=20 %}

The `gist.html` component provides a clean frame around Jekyll's native **`jekyll-gist`** plugin, adding a structured header with a GitHub icon, a file name indicator, and a direct hyperlink to the external Gist source.

### **Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | **Required** | The unique hash identifier of the GitHub Gist. |
| `file` | String | — | Optional specific filename to render from the Gist. |
| `class` | String | — | Optional custom CSS class. |

### **Usage Example**

{% raw %}
```liquid
{% include comps/gist.html id="d8ad5039f60bc9c4f4205dcbf1e285a8" file="test.js" %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="3. Feed Subscription Widget (feed-widget.html)" icon="rss" size=20 %}

The `feed-widget.html` component integrates with the **`jekyll-feed`** plugin to render a subscription card or button linking directly to the generated RSS/Atom feed.

### **Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `compact` | Boolean | `false` | If `true`, renders only a clean action button. If `false`, renders a full subscription card. |
| `title` | String | `"Subscribe to RSS Feed"` | The header text of the feed card. |
| `description` | String | `"Stay updated..."` | Body description text detailing what the feed provides. |
| `class` | String | — | Optional custom CSS class. |

### **Usage Examples**

* 🔹 **Full Subscription Card:**
  {% raw %}
  ```liquid
  {% include comps/feed-widget.html %}
  ```
  {% endraw %}

* 🔹 **Compact RSS Link Button:**
  {% raw %}
  ```liquid
  {% include comps/feed-widget.html compact=true %}
  ```
  {% endraw %}
