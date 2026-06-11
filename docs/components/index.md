---
layout: default
title: Components
output-title: true
description: A comprehensive library of high-impact Liquid components for documentation.
---

ZeroDark SP includes a wide range of custom components to help you build professional documentation quickly.

{% include comps/heading.html tag="h2" text="Display & Layout" icon="layout" size=20 %}
{% include comps/card-index.html section="Display & Layout" %}

{% include comps/heading.html tag="h2" text="Elements & Media" icon="layers" size=20 %}
{% assign media_items = "
- title: Icon (Lucide)
  url: /components/icon/
  icon: star
- title: Simple Icon
  url: /components/simple-icon/
  icon: github
  source: simple
- title: Font Awesome
  url: /components/font-awesome/
  icon: font-awesome
  source: fa
- title: Tags
  url: /components/tags/
  icon: tag
- title: Color Block
  url: /components/color-block/
  icon: palette
- title: Grid Palette
  url: /components/grid-palette/
  icon: grid
- title: Terminal
  url: /components/terminal/
  icon: terminal
- title: VHS Effect
  url: /components/vhs/
  icon: monitor
" | from_yaml %}
{% include comps/card-index.html section="Elements & Media" items=media_items %}

{% include comps/heading.html tag="h2" text="Interactive & Code" icon="code" size=20 %}
{% assign interactive_items = "
- title: Callout
  url: /components/callout/
  icon: alert-circle
- title: Button
  url: /components/button/
  icon: mouse-pointer
- title: Package Tabs
  url: /components/package-tabs/
  icon: package
- title: Example Code
  url: /components/example-code/
  icon: code
- title: Example Block
  url: /components/example-block/
  icon: box
- title: Command Reference
  url: /components/command-ref/
  icon: terminal
- title: API Reference
  url: /components/api-reference/
  icon: code
- title: Modal / Dialog
  url: /components/modal/
  icon: maximize
" | from_yaml %}
{% include comps/card-index.html section="Interactive & Code" items=interactive_items %}

{% include comps/heading.html tag="h2" text="Data & History" icon="database" size=20 %}
{% include comps/card-index.html section="Data & History" %}
