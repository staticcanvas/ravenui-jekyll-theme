---
layout: default
title: Terminal & Shell
output-title: true
tags: [ui, components, terminal, cli]
description: A high-fidelity terminal component for showcasing command-line interactions.
enable_search: true
---
Zero-Dark includes a professional `terminal.html` component that simulates a modern command-line interface with support for multiple tabs, status indicators, and syntax-highlighted commands.

{% include comps/heading.html tag="h2" text="Basic Usage" icon="terminal" size=20 %}

The terminal component is perfect for installation steps or demonstrating CLI tools.

{% capture terminal_content %}
<span class="fg-highlight">$</span> npm install zero-dark-sp
<span class="fg-muted">... downloading dependencies</span>
<span class="fg-success">DONE</span> Installed version 1.3.4
{% endcapture %}

{% include comps/terminal.html 
    title="bash" 
    content=terminal_content 
    user="gsnow" 
    host="zero-dark" 
%}

{% capture terminal_code %}
{% raw %}
```liquid
{% capture terminal_content %}
<span class="fg-highlight">$</span> npm install zero-dark-sp
{% endcapture %}

{% include comps/terminal.html 
    title="bash" 
    content=terminal_content 
    user="gsnow" 
    host="zero-dark" 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=terminal_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The HTML content to display inside the terminal window. |
| `title` | String | `terminal` | The text displayed in the active tab. |
| `user` | String | `user` | The username displayed in the prompt. |
| `host` | String | `localhost` | The hostname displayed in the prompt. |
| `id` | String | | Optional unique ID for the component. |

---

{% include comps/callout.html type="tip" title="Color Utilities" content="Use the built-in color classes like `.fg-highlight`, `.fg-success`, and `.fg-muted` inside the `content` capture to match the theme's aesthetic." %}
