---
layout: default
title: Layouts
output-title: true
tags: [ui, layout, architecture]
description: Understanding the structural foundation and page templates of ZeroDark SP.
---

ZeroDark SP is built on a high-density, three-column grid system that prioritizes information hierarchy and technical clarity.

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

| Layout | Usage | Description |
| :--- | :--- | :--- |
| `default` | Docs | The core three-column documentation template. |
| `space` | Hero | A cinematic, center-aligned layout with starfield animations. |
| `splash` | Landing | Minimalist variants (Terminal, App, Docs) for entry pages. |
| `post` | Articles | Optimized for long-form content with author and date metadata. |
| `portfolio` | Portfolio | A visual-first showcase layout for project galleries. |
| `metrics` | Stats | A data-driven layout optimized for dashboards and metrics. |
| `blog-list` | Blog Index | A high-density linear list for chronological post browsing. |
| `card-index` | Navigation | A card-based navigation portal using `site.data.navigation`. |

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
