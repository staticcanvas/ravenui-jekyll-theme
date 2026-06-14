---
layout: default
title: Hero Card
output-title: true
tags: [ui, components, splash]
description: A high-impact surface for landing pages or section introductions.
enable_search: true
---
The `hero-card.html` component is a large, centered container designed for primary call-to-actions (CTAs) and value propositions.

{% include comps/heading.html tag="h2" text="Live Example" icon="monitor" size=20 %}

{% capture hero_demo %}
    Showcase your primary value proposition with a large heading, tagline, and CTA.
{% endcapture %}

{% include comps/hero-card.html 
    title="RavenUI Systems" 
    description="The next generation of technical documentation." 
    content=hero_demo 
    cta_text="Get Started" 
    cta_url="/installation/" 
%}

{% capture hero_code %}
{% raw %}
```liquid
{% include comps/hero-card.html 
    title="RavenUI Systems" 
    description="..." 
    content="..."
    cta_text="Get Started" 
    cta_url="/installation/" 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=hero_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | | The main headline. |
| `description` | String | | Sub-headline or tagline. |
| `content` | String | | The body text or HTML. |
| `cta_text` | String | | Text for the primary action button. |
| `cta_url` | String | | URL for the primary action button. |
