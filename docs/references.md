---
layout: default
title: Reference Directory
output-title: true
tags: [references, links, documentation]
description: A central hub for external documentation, configuration APIs, template engines, and asset directories used in RavenUI.
permalink: /references/
enable_search: true
---

This directory compiles links and anchor references to the official documentation sites of the core technologies, libraries, and frameworks integrated into the **RavenUI Jekyll Theme**.

---

{% include comps/heading.html tag="h2" text="Jekyll & Liquid Engines" icon="settings" size=20 %}

Jekyll and Shopify Liquid power the theme's static generation and modular inclusions:

### **Jekyll Core References**
* [Global Variables Reference](https://jekyllrb.com/docs/variables/) - Specifications for the `site`, `page`, `content`, and `layout` scopes.
* [Configuration Options](https://jekyllrb.com/docs/configuration/) - Reference table for Jekyll base keys (baseurl, destination, plugins).
* [Collections Integration](https://jekyllrb.com/docs/collections/) - Patterns for configuring custom layouts, folder paths, and sorting for collections.

### **Liquid Reference**
* [Shopify Liquid Reference](https://shopify.github.io/liquid/) - Operators, loop structures, array filters, and conditional control flow guides.
* [Jekyll Liquid Extensions](https://jekyllrb.com/docs/liquid/) - Jekyll-specific tags and filters (`relative_url`, `absolute_url`, `markdownify`, `jsonify`).

---

{% include comps/heading.html tag="h2" text="Visual Elements & Iconography" icon="image" size=20 %}

RavenUI integrates vectors, typography, and math engines natively:

### **Icon Catalogs**
* [Lucide Icons Directory](https://lucide.dev/icons) - Searchable index for standard UI vector icons used in sidebars and headers.
* [Simple Icons Catalog](https://simpleicons.org/) - Repository of brand icons used in deployment tables and navigation sections.
* [Font Awesome Icons](https://fontawesome.com/icons) - Traditional icons library supported optionally via the custom styles module.

### **Typography & Fonts**
* [Google Fonts API](https://fonts.google.com/) - Specifications for configuring custom weights and serif stacks.

### **Data Visualization & Math**
* [KaTeX LaTeX Reference](https://katex.org/docs/supported.html) - Documentation for mathematical expressions and syntax formatting.
* [Mermaid.js Diagrams](https://mermaid.js.org/) - Code block diagram guidelines (flowcharts, sequence diagrams, mindmaps).

---

{% include comps/heading.html tag="h2" text="Search & Analytics Providers" icon="search" size=20 %}

Documentation search utilities and analytics engines:

### **Search Engines**
* [Pagefind WASM Documentation](https://pagefind.app/docs/) - Configuration details for index building, selectors, metadata, and CSS variable styling.
* [Algolia Search Docs](https://www.algolia.com/doc/) - Hosted search dashboard setup, API credentials, and query limits guides.

### **Analytics Trackers**
* [PostHog Event Tracking](https://posthog.com/docs) - Product analytics, user paths, and custom action recording.
* [Umami Analytics API](https://umami.is/docs) - Privacy-friendly analytics setup.
* [Plausible Documentation](https://plausible.io/docs) - Self-hosted event tracking guides.

---

{% include comps/heading.html tag="h2" text="Animations & UI Utilities" icon="zap" size=20 %}

Libraries supporting dynamic transitions and scroll effects:

* [GSAP Animation Docs](https://gsap.com/docs/) - Timeline orchestration and tweening methods.
* [Anime.js API Guide](https://animejs.com/documentation/) - Light-weight Javascript animation parameters.
* [Animate.css Cheat Sheet](https://animate.style/) - Reference classes for page-load animations.
* [AOS (Animate on Scroll)](https://michalsnik.github.io/aos/) - Trigger classes for viewport scroll events.
