---
layout: splash
variant: terminal
title: System Boot Sequence
permalink: /examples/splash-terminal/
description: Example page demonstrating the terminal variant of the splash layout.
enable_search: true
---
# RAVENUI SYSTEM OPERATIONAL

{% capture term_output %}
<span class="fg-muted">></span> boot --verbose<br>
<span class="fg-highlight">✓</span> Loading kernel: 100% complete.<br>
<span class="fg-info">i</span> Initializing RavenUI interface...<br>
<span class="fg-highlight">✓</span> System online. All subsystems nominal.
{% endcapture %}

{% include comps/terminal.html title="system_monitor.sh" content=term_output %}

<div style="margin-top: 2rem;">
  {% include comps/button.html url="/layouts/" text="Back to Layouts" icon="arrow-left" %}
</div>
