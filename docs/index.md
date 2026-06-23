---
layout: default
title: Introduction
output-title: true
tags: [docs, jekyll, technical]
description: RavenUI is a high-performance Jekyll theme engineered for technical documentation.
enable_search: true
---
RavenUI is a developer-first, component-heavy Jekyll theme framework and UI library engineered for building premium, high-performance technical documentation sites, API references, developer portals, and product knowledge bases. 

It is designed to serve as a robust base layout engine that supports deep structural customization. With over 70+ modular component includes, built-in search providers (including WASM-powered Pagefind), automated build hooks, and a highly customizable CSS design tokens architecture, RavenUI has evolved beyond a clean template into a comprehensive UI framework for technical sites.

---

{% include comps/heading.html tag="h2" text="Why RavenUI?" icon="zap" size=20 %}

* 🔹 **Component-Driven Architecture**: Over 70+ pre-designed utility and interactive components (like timelines, metrics dashboard cards, interactive tables, roadmaps, and alerts) ready to be embedded via clean tags.
* 🔹 **Automated Lifecycle Integration**: Leverages pre-build and post-build Jekyll hooks (via `_plugins/hooks.rb`) to automate git history extraction, search indexing, and HTML/CSS/JS minification.
* 🔹 **Premium Typography & Dark Aesthetics**: Zero-dark layout optimized for readability with modern typography (Fraunces and IBM Plex Sans) and micro-animations.
* 🔹 **Robust Extension Points**: Supports theme inheritance, allowing developers to build child themes by overriding SASS variables, layout slots, or configuration settings.

{% capture collections_notice %}
RavenUI is intentionally designed to prioritize structured, hierarchy-driven documentation via curated sidebar navigation (`_data/navigation.yml`). It does not support automatic Jekyll collection siblings (next/previous page lists) by design. For deep collections structures, a separate variant is planned to preserve the simplicity of the core theme.
{% endcapture %}
{% include comps/callout.html type="note" title="Architecture Decision" content=collections_notice %}

{% include comps/heading.html tag="h2" text="Project Status" icon="activity" size=20 %}

{% capture roadmap_content %}
    {% include comps/roadmap-item.html status='completed' title='Core Architecture' description='Stable grid and theme engine.' percent=100 %}
    {% include comps/roadmap-item.html status='completed' title='Advanced Iconography' description='Lucide icons with color and animation support.' percent=100 %}
    {% include comps/roadmap-item.html status='active' title='Enhanced Components' description='Implementing Roadmap v2 and Releases tracker.' percent=85 tasks="Advanced Roadmap | Releases & Tags | Icon Animations" %}
    {% include comps/roadmap-item.html title='Public Launch' description='Final documentation audit and performance optimization.' %}
{% endcapture %}

{% include comps/roadmap.html content=roadmap_content %}

{% capture roadmap_code %}
{% raw %}
```liquid
{% capture roadmap_content %}
    {% include comps/roadmap-item.html 
        status='active' 
        title='Enhanced Components' 
        description='Implementing Roadmap v2.' 
        percent=85 
    %}
{% endcapture %}

{% include comps/roadmap.html content=roadmap_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=roadmap_code %}

{% include comps/heading.html tag="h3" text="Documentation Features" icon="layers" size=20 %}

- [x] High-performance WASM Search
- [x] Responsive Table of Contents
- [x] Advanced Icon Animations
- [x] Fluent UI Aesthetic

{% include comps/heading.html tag="h3" text="Ordered Steps" icon="list" size=20 %}

1. Install Ruby and Bundler.
2. Clone the RavenUI repository.
3. Run `./bundle.sh` to sync dependencies.

{% include comps/heading.html tag="h3" text="VHS Preview" icon="monitor" size=20 %}

{% capture vhs_content %}
    <h2 style='color:var(--rd-clr-highlight); margin:0;'>SYSTEM ONLINE</h2>
    <p style='font-family:var(--rd-font-mono); font-size:0.8rem;'>LOADING DATA STREAM... v1.3.4</p>
{% endcapture %}

{% include comps/vhs.html content=vhs_content %}
