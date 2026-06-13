---
layout: default
title: Navigation
output-title: true
tags: [ui, navigation, sidebar]
description: Configuring the dual-sidebar system and mobile navigation menu.
enable_search: true
---
Zero-Dark features a high-density, three-column layout designed for maximum technical clarity.

{% include comps/heading.html tag="h2" text="Sidebar Navigation (Site-Wide)" icon="home" size=20 %}

The site-wide navigation is controlled via `_data/navigation.yml`. This system supports **Lucide Icons** and automatic active-link highlighting.

**Structure Example:**
```yaml
- title: Getting Started
  links:
    - text: Introduction
      url: /
      icon: home
      color: "#00ff9d"
    - text: Installation
      url: /installation/
      icon: download
      color: "#3399ff"
- title: Configuration
  links:
    - text: Site Settings
      url: /configuration/
      icon: settings
      color: "#ffcc00"
    - text: Navigation
      url: /navigation/
      icon: menu
    - text: Search Integration
      url: /search/
      icon: search
    - text: Layouts
      url: /layouts/
      icon: layout
- title: Components
  links:
    - text: Callouts
      url: /callouts/
      icon: alert-circle
      color: "#ff4444"
    - text: Iconography
      url: /icons/
      icon: type
      color: "#00ff9d"
    - text: API Reference
      url: /api-reference/
      icon: code
    - text: Visual Elements
      url: /visual-elements/
      icon: eye
- title: Advanced
  links:
    - text: Customization
      url: /customization/
      icon: sliders
      color: "#3399ff"
```

**Icons:**
Specify any name from the [Lucide Icon Library](https://lucide.dev/icons). They will be automatically rendered at 14px in the sidebar, see [Zero-Dark Icon Reference](/icons/).

 - **Colors:** You can specify a color for the icon, or use the default color from the Lucide icon library.
 - **Animations:** Zero-Dark supports animations for icons
 - **Sizes:** You can specify a size for the icon, or use the default size from the Lucide icon library.
 
 **See:** [Zero-Dark Icon Reference](/LuceIcons/)

---

{% include comps/heading.html tag="h2" text="Header Navigation" icon="compass" size=20 %}

Zero-Dark supports an optional **Top Header Bar** layout that displays a glassmorphism navigation bar across the top of the viewport.

### **Header Data Structure**

Header links are defined in `_data/navheader.yml`. The data structure supports **Lucide Icons** and external links:

```yaml
- text: Docs
  url: /
  icon: book-open
- text: Components
  url: /components/
  icon: package
- text: Blog
  url: /blog/
  icon: file-text
- text: GitHub
  url: https://github.com/staticcanvas/zero-dark-jekyll-theme
  icon: github
  external: true
```

### **Automatic Layout Adjustments**

When active, the theme automatically:
- Hides the redundant logo/brand section from the sidebar on desktop screens.
- Offsets the sidebars' sticky positions and heights by `56px` to prevent layout clipping.
- Re-binds search and social icon triggers seamlessly.

---

{% include comps/heading.html tag="h2" text="Table of Contents (TOC)" icon="menu" size=20 color="cyan" %}

The "***On This Page***" section appears in the **right sidebar** on desktop viewports. It is dynamic and automatically parses your content for headings.

- **Desktop:** Configurable default state via `zd_toc_default_open`.
- **Mobile:** Accessible via the floating utility toggle button.
- **Sync:** The TOC remains sticky as you scroll, highlighting your progress through the page.

### **Custom TOC Styles**

You can configure different TOC designs, font size densities, and animations inside your `_config.yml` under `theme_settings.toc`:

```yaml
theme_settings:
  toc:
    style: nodes              # Layout style: simple, lines, nodes
    density: default          # Font sizing density: compact, default, relaxed
    animations: true          # Enable/disable TOC specific animations (page load, hover)
```

- **`style`**: Layout style for TOC links.
  - **`simple`**: A clean, border-left layout where active links draw a highlighting line.
  - **`lines`**: Renders a vertical line on the left side of the TOC, marking active links with matching vertical segments.
  - **`nodes`**: A timeline/stepper layout rendering circular indicators on the left line, which dynamically fill when active.
- **`density`**: Controls font size density (`compact`, `default`, `relaxed`).
- **`animations`**: When set to `true`, enables dedicated CSS animations on the TOC, such as sliding up on page load and sliding links horizontally on hover. Respects user system reduced motion preference.

---

{% include comps/heading.html tag="h2" text="Mobile Experience" icon="smartphone" size=20 %}

On smaller screens, Zero-Dark utilizes a **Dual-Toggle System**:

1. **Navigation Toggle:** Opens the site-wide sidebar as a full-page overlay.
2. **TOC Toggle:** Opens the current page structure.

**Intelligent Switching:**
When one menu is opened, the other automatically closes to prevent UI overlap. Clicking any link in either menu will automatically dismiss the overlay and navigate to the target section.

This behavior ensures accessibility and ease-of-use on all devices, adhering to **Fluent UI** information hierarchy principles.
