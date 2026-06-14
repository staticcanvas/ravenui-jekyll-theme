---
layout: portfolio
title: Portfolio Layout Example
permalink: /examples/portfolio/
description: Example page demonstrating the visual-first portfolio showcase layout.
enable_search: true
---
<div style="grid-column: 1 / -1; margin-bottom: 2rem; display: flex; justify-content: flex-start;">
  {% include comps/button.html url="/layouts/" text="Back to Layouts" icon="arrow-left" %}
</div>

{% capture project1 %}
<img src="https://picsum.photos/600/400?random=1" alt="Telemetry Pipeline" style="width: 100%; border-radius: 4px; margin-bottom: 1rem; border: var(--rd-border);">
A high-throughput visualization framework for real-time telemetry streaming and analysis.
<div style="margin-top: 1rem;">
  <span class="rd-tag">Rust</span>
  <span class="rd-tag">WASM</span>
</div>
{% endcapture %}
{% include comps/card.html title="Project Hyperion" content=project1 glass=true %}

{% capture project2 %}
<img src="https://picsum.photos/600/400?random=2" alt="Neural Architecture" style="width: 100%; border-radius: 4px; margin-bottom: 1rem; border: var(--rd-border);">
Deep neural network model architectures designed for embedded device inference.
<div style="margin-top: 1rem;">
  <span class="rd-tag">Python</span>
  <span class="rd-tag">PyTorch</span>
</div>
{% endcapture %}
{% include comps/card.html title="Aether Neural Engine" content=project2 glass=true %}

{% capture project3 %}
<img src="https://picsum.photos/600/400?random=3" alt="Cloud Infrastructure" style="width: 100%; border-radius: 4px; margin-bottom: 1rem; border: var(--rd-border);">
A declarative infrastructure orchestration tool targeting zero-trust multi-cloud grids.
<div style="margin-top: 1rem;">
  <span class="rd-tag">Go</span>
  <span class="rd-tag">gRPC</span>
</div>
{% endcapture %}
{% include comps/card.html title="Gridlock Orchestrator" content=project3 glass=true %}
