---
layout: default
title: Navigation
output-title: true
tags: [ui, navigation, sidebar]
description: Configuring the dual-sidebar system and mobile navigation menu.
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

{% include comps/heading.html tag="h2" text="Table of Contents (TOC)" icon="menu" size=20 color="cyan" %}

The "***On This Page***" section appears in the **right sidebar** on desktop viewports. It is dynamic and automatically parses your content for `h2` and `h3` tags.

- **Desktop:** Configurable default state via `zd_toc_default_open`.
- **Mobile:** Accessible via the floating utility toggle button.
- **Sync:** The TOC remains sticky as you scroll, highlighting your progress through the page.

---

{% include comps/heading.html tag="h2" text="Mobile Experience" icon="smartphone" size=20 %}

On smaller screens, Zero-Dark utilizes a **Dual-Toggle System**:

1. **Navigation Toggle:** Opens the site-wide sidebar as a full-page overlay.
2. **TOC Toggle:** Opens the current page structure.

**Intelligent Switching:**
When one menu is opened, the other automatically closes to prevent UI overlap. Clicking any link in either menu will automatically dismiss the overlay and navigate to the target section.

This behavior ensures accessibility and ease-of-use on all devices, adhering to **Fluent UI** information hierarchy principles.
