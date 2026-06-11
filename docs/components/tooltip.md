---
layout: default
title: Context Tooltip
output-title: true
tags: [ui, elements, accessibility, text]
description: A pure-CSS context tooltip component for definitions, annotations, and abbreviations.
---

The `tooltip.html` component provides a lightweight, pure-CSS tooltip popup for words, abbreviations, or definitions. Because it relies entirely on CSS attributes and pseudo-elements, it requires zero JavaScript to run and works instantly.

{% include comps/heading.html tag="h2" text="Live Example" icon="info" size=20 %}

Hover over the following highlighted words to see tooltips in action:

* We love compiling static pages using {% include comps/tooltip.html term="Jekyll" definition="A simple, blog-aware, static site generator written in Ruby." position="top" %}.
* Always adhere to the guidelines when building {% include comps/tooltip.html term="UI" definition="User Interface" position="bottom" %} components.
* Hover {% include comps/tooltip.html term="leftwards" definition="This is a left tooltip!" position="left" %} or {% include comps/tooltip.html term="rightwards" definition="This is a right tooltip!" position="right" %} to test alignment.

{% capture tooltip_eg %}
{% raw %}
```liquid
We love compiling static pages using {% include comps/tooltip.html term="Jekyll" definition="A simple, blog-aware, static site generator written in Ruby." position="top" %}.

Always adhere to the guidelines when building {% include comps/tooltip.html term="UI" definition="User Interface" position="bottom" %} components.
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=tooltip_eg %}

---

{% include comps/heading.html tag="h2" text="Sizing and Overflow Notes" icon="alert-circle" size=20 %}

* **No wrapping:** Tooltips render using `white-space: nowrap` for clean presentation. Keep definition texts concise.
* **Viewport boundary:** Ensure parent containers have `overflow: visible` to prevent tooltips from being clipped at the container edge.

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **tooltip.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `term` | String | | The text label visible on the page that triggers the tooltip. |
| `definition` | String | | The tooltip bubble text displayed on hover. |
| `position` | String | `top` | Tooltip alignment relative to the term (`top`, `bottom`, `left`, `right`). |
| `class` | String | | Optional custom CSS class. |
