---
layout: splash
variant: app
title: Welcome to Zero-Dark
permalink: /splash/
description: A high-performance, professional Jekyll theme for technical documentation.
metrics_data:
  - title: "Build Speed"
    value: "210ms"
    icon: "zap"
    color: "var(--zd-clr-highlight)"
    trend: "+42%"
    trend_type: "up"
  - title: "Theme Assets"
    value: "38kb"
    icon: "package"
    color: "var(--zd-clr-blue)"
    trend: "-15%"
    trend_type: "down"
  - title: "Core Modules"
    value: "67"
    icon: "cpu"
    color: "var(--zd-clr-purple)"
---

<style>
  .zd-splash-showcase-grid {
    display: grid;
    grid-template-columns: 1fr;
    gap: 2rem;
    margin-block-end: 4rem;
    width: 100%;
  }
  @media (min-width: 48rem) {
    .zd-splash-showcase-grid {
      grid-template-columns: 1.2fr 1fr;
    }
  }
  .zd-splash-section-title {
    text-align: center;
    margin-block: 4rem 2rem;
  }
  .zd-splash-card-link {
    text-decoration: none;
    color: inherit;
    display: block;
    transition: transform 0.2s cubic-bezier(0.4, 0, 0.2, 1), border-color 0.2s ease;
  }
  .zd-splash-card-link:hover {
    transform: translateY(-4px);
  }
</style>

<div style="text-align: center; margin-block: 3rem 4rem;">
  <h1 class="font-heading fz-xxl fw-900" style="margin-block-end: 0.5rem; letter-spacing: -0.03em;">Zero-Dark <span class="fg-highlight">SP</span></h1>
  <p class="fz-lg fg-muted" style="margin-block-end: 2rem; min-height: 1.8rem;">
    {% include comps/typewriter.html words="A professional documentation engine.|Refined Fluent UI aesthetics.|Highly customizable layout systems.|Sub-second developer feedback loops." speed=60 delay=2500 id="splash-typewriter" %}
  </p>
  <div style="display: flex; gap: 1rem; justify-content: center; align-items: center; flex-wrap: wrap;">
    {% include comps/button.html url="/" text="Explore Documentation" icon="book-open" color="var(--zd-clr-highlight)" size="1rem" %}
    {% include comps/button.html url="/layouts/" text="View Templates" icon="layout" color="var(--zd-clr-platinum)" size="1rem" border-color="#333" %}
  </div>
</div>

<div class="zd-splash-showcase-grid">
  <div>
    {% capture term_content %}
<span class="fg-muted"># Initialize Zero-Dark in your Jekyll site</span>
<span class="fg-highlight">$</span> bundle init
<span class="fg-highlight">$</span> echo 'gem "zero-dark-sp"' >> Gemfile
<span class="fg-highlight">$</span> bundle install
<span class="fg-muted"># Generate Pagefind Search Index</span>
<span class="fg-highlight">$</span> bundle exec jekyll build
<span class="fg-highlight">$</span> npx pagefind --site _site

<span class="fg-info">i</span> System Online: 67 components compiled successfully.
<span class="fg-highlight">✓</span> Live server running at http://localhost:4000
    {% endcapture %}
    {% include comps/terminal.html title="developer@zerodark-sp:~" content=term_content %}
  </div>
  
  <div style="display: flex; flex-direction: column; gap: 1.5rem; justify-content: space-between;">
    <div>
      <h4 class="font-mono fz-xs fg-muted" style="text-transform: uppercase; margin-bottom: 0.5rem; letter-spacing: 0.1em;">// Live Metrics Showcase</h4>
      {% include comps/metrics.html items=page.metrics_data grid_size="140px" %}
    </div>
    
    <div>
      <h4 class="font-mono fz-xs fg-muted" style="text-transform: uppercase; margin-bottom: 0.5rem; letter-spacing: 0.1em;">// Sub-second Build Speeds (ms)</h4>
      {% include comps/svgcharts.html type="bar" labels="Core,Roadmap,Charts,Table,Modal,Full Site" data="42,88,110,140,65,210" height=120 %}
    </div>
  </div>
</div>

<h2 class="zd-splash-section-title font-heading fz-xl fw-800">**Out-of-the-Box Feature Set**</h2>

{% capture features %}
    {% include comps/feature-card.html 
       icon="search" 
       title="WASM-Powered Search" 
       description="Pre-integrated with Pagefind for sub-second, client-side search indexing." 
       color="var(--zd-clr-highlight)"
    %}
    {% include comps/feature-card.html 
       icon="layers" 
       title="Responsive Layouts" 
       description="Multiple viewport layouts including Space, Portfolio, Metrics, and Blog List." 
       color="var(--zd-clr-blue)"
    %}
    {% include comps/feature-card.html 
       icon="terminal" 
       title="Developer First DX" 
       description="A rich set of HTML components (mermaid, charts, terminals, tags, and tabs) with zero third-party tracking." 
       color="var(--zd-clr-purple)"
    %}
{% endcapture %}
{% include comps/feature-grid.html content=features %}

<h2 class="zd-splash-section-title font-heading fz-xl fw-800">**Layout Templates**</h2>

<div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 1.5rem; width: 100%; margin-block-end: 4rem;">
  <a href="{{ '/examples/space/' | relative_url }}" class="zd-splash-card-link">
    {% include comps/card.html glass=true icon="star" title="Space" content="Cinematic center-aligned layout with animated canvas starfield." %}
  </a>
  <a href="{{ '/examples/portfolio/' | relative_url }}" class="zd-splash-card-link">
    {% include comps/card.html glass=true icon="briefcase" title="Portfolio" content="Visual-first project showcase optimized for galleries." %}
  </a>
  <a href="{{ '/examples/metrics/' | relative_url }}" class="zd-splash-card-link">
    {% include comps/card.html glass=true icon="activity" title="Metrics" content="Data-driven dashboard layout optimized for stats." %}
  </a>
  <a href="{{ '/examples/blog-list/' | relative_url }}" class="zd-splash-card-link">
    {% include comps/card.html glass=true icon="file-text" title="Blog List" content="High-density chronological index of long-form articles." %}
  </a>
</div>