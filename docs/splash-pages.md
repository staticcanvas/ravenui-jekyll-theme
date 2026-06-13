---
layout: default
title: Splash Pages
output-title: true
tags: [ui, layout, splash, landing]
description: Specialized components and layouts for building high-impact landing pages.
---

Zero-Dark provides a suite of advanced components specifically designed for the `splash` layout, allowing you to create professional product landing pages and entry points.

{% include comps/heading.html tag="h2" text="Splash Components" icon="box" size=24 %}

The following components are optimized for use within `splash` and `space` layouts.

---

{% include comps/heading.html tag="h2" text="Hero Card" icon="zap" size=20 %}

A high-impact centered block for primary calls-to-action.

{% capture hero_code %}
{% raw %}
{% include comps/hero-card.html 
   title="Next-Gen Documentation" 
   description="Blazing fast search, modular styling, and advanced iconography." 
   cta_text="Get Started" 
   cta_url="/installation/" 
%}
{% endraw %}
{% endcapture %}

{% include comps/hero-card.html 
   title="Zero-Dark" 
   description="A professional, high-performance Jekyll theme engineered for technical documentation and long-form readability." 
   cta_text="View Installation" 
   cta_url="/installation/" 
%}

---

{% include comps/heading.html tag="h2" text="Terminal Window" icon="terminal" size=20 %}

An emulated terminal window with stylized controls and monospaced output.

{% capture term_content %}
<span class="fg-muted">></span> npm install zero-dark-sp<br>
<span class="fg-highlight">✓</span> Package installed successfully.<br>
<span class="fg-muted">></span> jekyll serve<br>
<span class="fg-info">i</span> Server running at http://localhost:4000
{% endcapture %}

{% include comps/terminal.html title="bash" content=term_content %}

---

{% include comps/heading.html tag="h2" text="Feature Grid & Cards" icon="grid" size=20 %}

Display your project's key selling points using the responsive feature grid.

{% capture features %}
    {% include comps/feature-card.html 
       icon="zap" 
       title="Fast Performance" 
       description="WASM-powered search and optimized SCSS for sub-second builds." 
    %}
    {% include comps/feature-card.html 
       icon="box" 
       title="Modular Design" 
       description="Refactored into 18+ discrete modules to simplify customization." 
       color="#3399ff"
    %}
    {% include comps/feature-card.html 
       icon="shield" 
       title="Secure & Reliable" 
       description="Built on standard Jekyll principles with zero tracking or bloat." 
       color="#ffcc00"
    %}
{% endcapture %}

{% include comps/feature-grid.html content=features %}

---

{% include comps/heading.html tag="h2" text="Glassmorphism Card" icon="layers" size=20 %}

A modern, translucent card style with backdrop blur.

{% include comps/card.html 
   glass=true 
   icon="cpu" 
   title="Deep Integration" 
   content="Native support for Lucide animations and interactive triggers." 
%}

---

{% include comps/heading.html tag="h2" text="Package Tabs" icon="package" size=20 %}

A tabbed interface for displaying installation commands across different package managers.

{% include comps/package-tabs.html package="zero-dark-sp" %}
