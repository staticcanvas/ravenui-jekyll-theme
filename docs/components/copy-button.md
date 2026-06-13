---
layout: default
title: Standalone Copy Button
output-title: true
tags: [ui, elements, interactive, utilities]
description: A standalone button component to copy arbitrary text to the clipboard with visual success feedback.
---

The `copy-button.html` component provides a lightweight, stylized button that copies a specified string to the user's clipboard. It features instant visual feedback by temporarily updating the Lucide icon and applying success styling.

{% include comps/heading.html tag="h2" text="Live Example" icon="copy" size=20 %}

{% include comps/copy-button.html text="Hello from Zero-Dark!" label="Copy Greeting" %}
<br>
{% include comps/copy-button.html text="git clone https://gitlab.com/staticcanvas/zero-dark-sp.git" %}

{% capture copy_eg %}
{% raw %}
```liquid
<!-- Copy Button with Custom Label -->
{% include comps/copy-button.html text="Hello from Zero-Dark!" label="Copy Greeting" %}

<!-- Icon-Only Copy Button (Compact) -->
{% include comps/copy-button.html text="git clone https://gitlab.com/staticcanvas/zero-dark-sp.git" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=copy_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **copy-button.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `text` | String | | The exact string value to be copied to the clipboard. |
| `label` | String | | Optional text label to display next to the icon. |
| `icon` | String | `copy` | Optional custom Lucide icon name for the default state. |
| `size` | Integer | `12` | The size of the Lucide icon in pixels. |
| `class` | String | | Optional custom CSS class to append. |
