---
layout: default
title: Layouts
output-title: true
tags: [ui, layout, architecture]
description: Understanding the structural foundation and page templates of RavenUI.
enable_search: true
---
RavenUI is built on a high-density, three-column grid system that prioritizes information hierarchy and technical clarity.

{% include comps/heading.html tag="h2" text="The Main Layout" icon="layout" size=20 %}

The `default.html` layout is the engine of the theme. It manages the dual-sidebar system, the search modal, and core utility scripts.

#### 1. Sidebar Left (Site Navigation)
- Contains the logo, social links, and the global navigation menu.
- Sticky on desktop, overlay on mobile.
- Controlled via `_data/navigation.yml`.

#### 2. Main Content Area
- Fluid width with a max-width of 1600px.
- High-contrast typography and stylized markdown overrides.
- Features an optional hero section with title, description, and tags.

#### 3. Sidebar Right (Page TOC)
- Dynamic table of contents that highlights as you scroll.
- Automatically hidden on smaller viewports (accessible via utility toggle).

---

{% include comps/heading.html tag="h2" text="Page Templates" icon="copy" size=20 %}

We provide several specialized layouts for different content types:

| Layout | Usage | Description | Live Preview |
| :--- | :--- | :--- | :--- |
| `default` | Docs | The core three-column documentation template. | _Standard Docs_ |
| `blank` | Landing/Canvas | Strips away header, sidebar, and TOC to offer a completely clean canvas. | [Preview Example]({{ "/examples/blank/" | relative_url }}) |
| `blog` | Blog Index | Dynamic unified post index supporting list or grid layout options. | [List Layout]({{ "/blog/" | relative_url }}) \| [Grid Layout]({{ "/blog-grid/" | relative_url }}) |
| `article` | Deep-Dive Posts | Premium long-form article template with hero banner, author bio card, and pagination. | [Welcome Article]({{ "/docs/engineering/2026/06/08/welcome/" | relative_url }}) |
| `space` | Hero | A cinematic, center-aligned layout with starfield animations. | [Preview Example]({{ "/examples/space/" | relative_url }}) |
| `splash` | Landing | Minimalist variants (Terminal, App, Docs) for entry pages. | [Terminal]({{ "/examples/splash-terminal/" | relative_url }}) \| [App]({{ "/examples/splash-app/" | relative_url }}) \| [Docs]({{ "/examples/splash-docs/" | relative_url }}) |
| `post` | Articles | Optimized for long-form content with author and date metadata. | _Standard Post_ |
| `portfolio` | Portfolio | A visual-first showcase layout for project galleries. | [Preview Example]({{ "/examples/portfolio/" | relative_url }}) |
| `metrics` | Stats | A data-driven layout optimized for dashboards and metrics. | [Preview Example]({{ "/examples/metrics/" | relative_url }}) |
| `card-index` | Navigation | A card-based navigation portal using `site.data.navigation`. | _Gallery Index_ |


{% include comps/heading.html tag="h2" text="Splash Variants" icon="monitor" size=20 %}

The `splash` layout supports a `variant` frontmatter field to trigger different visual modes:

- **Terminal:** A retro-tech aesthetic with a command-line header and blinking cursor.
- **App:** A clean, centered product landing page style.
- **Docs:** A focused introduction layout.

```yaml
---
layout: splash
variant: terminal
title: System Online
---
```

---

{% include comps/heading.html tag="h2" text="New Layout Templates" icon="plus-circle" size=20 %}

### **1. Blank Layout (`blank`)**
A minimalist layout designed for custom landing pages, dashboards, slide decks, or single-page applications. It strips out all global theme markup (header, left sidebar navigation, right sidebar TOC, footers) to provide an entirely clean canvas.

```yaml
---
layout: blank
title: "Custom Dashboard"
---
<!-- Your custom HTML/CSS here -->
```

### **2. Unified Blog Layout (`blog`)**
A highly configurable blog post feed layout. It supports filtering, item limiting, and dynamic layout switching directly from page metadata or central theme settings.

* **Layout Options:** `list` (linear logs) or `grid` (card-based grids).
* **Metadata Configurations:**
  * `blog_layout`: Force layout mode (`list` or `grid`).
  * `category_filter`: Show only posts belonging to a specific category.
  * `tag_filter`: Show only posts matching a specific tag.
  * `limit`: Limit the maximum number of posts rendered.

```yaml
---
layout: blog
blog_layout: grid
category_filter: Engineering
limit: 6
---
```

### **3. Technical Article Layout (`article`)**
A premium layout for deep-dive technical articles, tutorials, or research docs. It features:
* Optional banner images or gradient covers (`banner_image` or `banner_gradient` metadata).
* Author biography blocks at the bottom of the page (integrated with a centralized `_data/authors.yml` lookup file).
* Estimated reading time calculation.
* Post-to-post pagination links.

```yaml
---
layout: article
title: "RavenUI Architecture Overview"
author: staticcanvas
banner_gradient: "linear-gradient(135deg, #093325 0%, #061f17 100%)"
---
```

