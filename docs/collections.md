---
layout: default
title: Jekyll Collections
output-title: true
tags: [collections, architecture, layouts]
description: Learn how to group content and auto-generate navigation layouts using RavenUI's collections system.
enable_search: true
---
RavenUI features a robust, high-performance Jekyll collections integration that coexists seamlessly with the standard static sidebar navigation. This allows you to manage content-heavy guides, references, or tutorials without duplicating metadata in navigation files.

---

{% include comps/heading.html tag="h2" text="Configuration" icon="settings" size=20 %}

To enable Jekyll collections in your theme, first register the collection in your `_config.yml` file, and toggle the collection sidebar rendering option:

```yaml
# 1. Enable collections in theme settings
theme_settings:
  collections:
    enabled: true           # Toggles dynamic collections in sidebar navigation

# 2. Define your collections
collections:
  tutorials:
    output: true
    permalink: /tutorials/:path/
    title: "Tutorials"      # Sidebar group heading
    divider: true           # Render divider before this group
```

---

{% include comps/heading.html tag="h2" text="Document Front-Matter" icon="file-text" size=20 %}

Each document within your collection (e.g. located in your `_tutorials/` folder) should define standard front-matter metadata to control sorting, grouping, and styling:

```yaml
---
layout: default
title: "Jekyll Collections Basics"
description: "Understand the fundamentals of content collections in Jekyll."
order: 1                    # Sort order within the group
group: "Getting Started"    # Optional subheading group
icon: "book-open"           # Lucide icon name
color: "#00ff9d"            # Accent color for icon
tags: [basics, intro]
---
```

---

{% include comps/heading.html tag="h2" text="Dynamic Layout Styles" icon="layout" size=20 %}

RavenUI provides a generic `collection.html` layout that can compile and display collections in 5 different visual styles:

| Layout Style | Usage | Live Previews |
| :--- | :--- | :--- |
| `list` | High-density linear lists | [List View]({{ "/examples/collections-list/" | relative_url }}) |
| `grid` | Standard cards grids | [Grid View]({{ "/examples/collections-grid/" | relative_url }}) |
| `cards` | Detailed summary cards with tags | [Detailed Cards]({{ "/examples/collections-cards/" | relative_url }}) |
| `tree` | Folder/Category tree directory | [Tree Directory]({{ "/examples/collections-tree/" | relative_url }}) |
| `pathways` | Chronological roadmaps or pipelines | [Pathway Roadmap]({{ "/examples/collections-pathway/" | relative_url }}) |

To create an index page for a collection, specify `layout: collection` and define the collection name and target style in the front-matter:

```yaml
---
layout: collection
collection_name: tutorials
layout_style: grid
title: "Tutorials Directory"
---
```

---

{% include comps/heading.html tag="h2" text="Sorting, Tag Filtering, and Ordering" icon="filter" size=20 %}

### **Tag Filtering**
You can filter a collection index to show only documents matching a specific tag by setting `filter_tag` in the index page front-matter:

```yaml
layout: collection
collection_name: tutorials
layout_style: grid
filter_tag: basics
```

### **Sorting & Ordering**
By default, collection layouts sort documents by `weight` or `order` front-matter parameters. You can customize the sorting key using the `sort_by` front-matter parameter:
* `order` / `weight` (default): Ascending numeric order.
* `date`: Sorts documents by their `date` front-matter parameter (descending/newest first).
* `title`: Sorts alphabetically by title.

Example configuration:

```yaml
layout: collection
collection_name: tutorials
layout_style: list
sort_by: date
```

---

{% include comps/callout.html type="note" title="GitHub Pages Compatibility" content="Because the entire RavenUI collections engine is written in native Liquid and SASS, it is fully compatible with GitHub Pages safe mode execution." %}

