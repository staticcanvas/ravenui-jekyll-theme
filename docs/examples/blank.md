---
layout: blank
title: Blank Canvas Demo
permalink: /examples/blank/
---
<div class="rd-blank-demo-wrapper" style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center; background: radial-gradient(circle at center, #111111 0%, #050505 100%); color: var(--rd-clr-platinum); font-family: var(--rd-font-sans); text-align: center; padding: 2rem; box-sizing: border-box;">
    <div class="rd-card" style="max-width: 500px; padding: 3rem; border: var(--rd-border); border-radius: 12px; background: rgba(10, 10, 10, 0.6); backdrop-filter: blur(8px); box-sizing: border-box; display: flex; flex-direction: column; align-items: center; justify-content: center;">
        <div style="color: var(--rd-clr-highlight); margin-block-end: 1.5rem; display: flex; justify-content: center; align-items: center;">
            {% include comps/icon.html name="ghost" size=48 %}
        </div>
        <h1 style="font-size: 2.25rem; font-weight: 700; margin-block-end: 1rem; color: var(--rd-clr-platinum); font-family: var(--rd-font-sans);">Blank Layout Canvas</h1>
        <p style="color: #888; font-size: 1rem; line-height: 1.6; margin-block-end: 2rem;">
            This page is rendered using the <code>blank</code> layout. It strips away all theme elements (header, sidebar, footer, TOC) to give you a clean slate for landing pages, full-screen apps, or custom slides.
        </p>
        <a href="{{ "/layouts/" | relative_url }}" class="rd-btn-outline" style="text-decoration: none;">
            {% include comps/icon.html name="arrow-left" size=14 %} Back to Layouts Docs
        </a>
    </div>
</div>
