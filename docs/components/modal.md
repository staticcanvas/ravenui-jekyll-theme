---
layout: default
title: Modal / Dialog
output-title: true
tags: [ui, interactive, dialogs]
description: A professional, accessible modal dialog overlay supporting focus trapping, ESC close, and keyboard navigation.
enable_search: true
---
The `modal.html` component implements an overlay dialog adhering to modern accessibility (WAI-ARIA) specifications. It features a blur-filtered backdrop, automatic focus capture on open, escape key binding, click-outside-to-dismiss behavior, and focus restoration to the trigger button upon close.

{% include comps/heading.html tag="h2" text="Live Example" icon="maximize" size=20 %}

{% capture test_modal_content %}
<h4>Accessible Dialog Content</h4>
<p>This modal container restricts tab focus to elements inside this dialog box. Pressing <kbd>Esc</kbd> or clicking the backdrop overlay will dismiss this modal.</p>
<button class="rd-btn rd-btn--secondary" data-rd-modal-close>Close Dialogue</button>
{% endcapture %}

{% include comps/modal.html id="demo-modal" title="System Settings Overlay" content=test_modal_content trigger_text="Open Dialog" %}

{% capture modal_eg %}
{% raw %}
```liquid
<!-- Capture the modal body content -->
{% capture modal_body %}
  <h4>Accessible Dialog Content</h4>
  <p>This modal container restricts tab focus to elements inside this dialog box.</p>
  <button class="rd-btn rd-btn--secondary" data-rd-modal-close>Close Dialogue</button>
{% endcapture %}

<!-- Render the modal trigger button and container -->
{% include comps/modal.html id="demo-modal" title="System Settings Overlay" content=modal_body trigger_text="Open Dialog" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=modal_eg %}

---

{% include comps/heading.html tag="h2" text="Manual Triggers" icon="terminal" size=20 %}

If you prefer to trigger the modal from a custom button element instead of using the built-in trigger button, simply omit the `trigger_text` parameter and add `data-rd-modal-trigger="YOUR_MODAL_ID"` to any HTML element:

```html
<button class="my-custom-btn" data-rd-modal-trigger="demo-modal">
  Launch Dialogue Custom
</button>
```

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **modal.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `rd-modal` | The unique ID of the modal dialogue (used for targeting triggers). |
| `title` | String | | The title text displayed in the header. |
| `content` | HTML/String | | The body content of the modal, typically captured in Liquid. |
| `trigger_text` | String | | Optional. If provided, renders a default theme button to trigger the modal. |
| `trigger_class` | String | | Optional. Extra CSS classes to apply to the default trigger button. |
| `class` | String | | Optional. Custom CSS classes for the modal container itself. |
