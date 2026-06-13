---
layout: default
title: Keyboard Shortcuts
output-title: true
tags: [ui, elements, accessibility, keyboard]
description: A component for rendering keyboard shortcut keys and shortcut groups side by side.
enable_search: true
---
The `kbd.html` and `kbd-group.html` components provide a styled representation of keyboard shortcuts conforming to modern Fluent UI design standards.

{% include comps/heading.html tag="h2" text="Live Example" icon="keyboard" size=20 %}

{% include comps/kbd.html key="Ctrl" %}
{% include comps/kbd.html key="K" %}

{% include comps/kbd-group.html keys="Ctrl,Shift,P" %}
{% include comps/kbd-group.html keys="⌘,K" separator="" %}

{% capture kbd_eg %}
{% raw %}
```liquid
<!-- Single Keyboard Key -->
{% include comps/kbd.html key="Ctrl" %}
{% include comps/kbd.html key="K" %}

<!-- Keyboard Shortcut Group -->
{% include comps/kbd-group.html keys="Ctrl,Shift,P" %}
{% include comps/kbd-group.html keys="⌘,K" separator="" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=kbd_eg %}

---

{% include comps/heading.html tag="h2" text="Sizing Options" icon="maximize-2" size=20 %}

Keyboard keys support three size variants: `sm`, `md` (default), and `lg`.

<div>
  {% include comps/kbd.html key="Ctrl" size="sm" %}
  {% include comps/kbd.html key="Ctrl" size="md" %}
  {% include comps/kbd.html key="Ctrl" size="lg" %}
</div>

{% capture sizes_eg %}
{% raw %}
```liquid
{% include comps/kbd.html key="Ctrl" size="sm" %}
{% include comps/kbd.html key="Ctrl" size="md" %}
{% include comps/kbd.html key="Ctrl" size="lg" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=sizes_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **kbd.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `key` / `text` | String | `key` | The keyboard key text label to display (e.g. `Ctrl`, `Shift`, `⌘`). |
| `size` | String | `md` | The size variant of the key (`sm`, `md`, `lg`). |
| `class` | String | | Optional custom CSS class. |

### **kbd-group.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `keys` | String | | A comma-separated list of keys to display (e.g., `Ctrl,Shift,P`). |
| `separator` | String | `+` | The separator character or HTML to display between keys. |
| `size` | String | `md` | The size variant for all keys inside the group (`sm`, `md`, `lg`). |
| `class` | String | | Optional custom CSS class. |
