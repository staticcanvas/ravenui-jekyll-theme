---
layout: default
title: Introduction
output-title: true
tags: [docs, jekyll, technical]
description: ZeroDark SP is a high-performance Jekyll theme engineered for technical documentation.
---

ZeroDark SP is a professional Jekyll theme optimized for technical documentation and long-form readability.

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
2. Clone the ZeroDark SP repository.
3. Run `./bundle.sh` to sync dependencies.

{% include comps/heading.html tag="h3" text="VHS Preview" icon="monitor" size=20 %}

{% capture vhs_content %}
    <h2 style='color:var(--zd-clr-highlight); margin:0;'>SYSTEM ONLINE</h2>
    <p style='font-family:var(--zd-font-mono); font-size:0.8rem;'>LOADING DATA STREAM... v1.3.4</p>
{% endcapture %}

{% include comps/vhs.html content=vhs_content %}
