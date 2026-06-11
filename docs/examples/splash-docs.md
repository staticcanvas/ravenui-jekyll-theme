---
layout: splash
variant: docs
title: Documentation Hub
permalink: /examples/splash-docs/
description: Example page demonstrating the docs variant of the splash layout.
---

# ZeroDark Documentation Splash

A focused, elegant landing layout designed for starting points of documentation portals.

{% capture features %}
    {% include comps/feature-card.html 
       icon="book-open" 
       title="Technical Writing" 
       description="Designed with IBM Plex Sans and Fraunces for elegant typography and high readability." 
    %}
    {% include comps/feature-card.html 
       icon="cpu" 
       title="Interactive Features" 
       description="Includes progress bars, Chart.js/SVG charts, VHS players, and CodePens." 
    %}
{% endcapture %}
{% include comps/feature-grid.html content=features %}

<div style="margin-top: 2rem;">
  {% include comps/button.html url="/layouts/" text="Back to Layouts" icon="arrow-left" %}
</div>
