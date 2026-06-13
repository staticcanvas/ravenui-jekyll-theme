---
layout: default
title: Theme Colors
output-title: true
tags: [branding, styling, design-system]
description: Showcase of the Zero-Dark color palette and UI surface system.
enable_search: true
---
Zero-Dark features a high-density, professional dark palette designed for technical documentation. Below is the canonical list of brand colors and interface surface specifications.

{% include comps/heading.html tag="h2" text="Brand Colors" icon="palette" size=20 %}

{% assign brand_palette = "
- title: Viridian
  subtext: Primary Brand Accent
  color: '#00ff9d'
- title: Note
  subtext: UI Informational / Secondary
  color: '#9B7AE0'
- title: Warning
  subtext: UI Warnings
  color: '#E8994A'
- title: Danger
  subtext: UI Critical Errors
  color: '#E05A5A'
" | from_yaml %}

{% include comps/grid-palette.html items=brand_palette size="240px" height="120px" %}

---

{% include comps/heading.html tag="h2" text="Interface Surfaces" icon="layers" size=20 %}

These colors define the background layers, panels, and cards that build the high-contrast UI depth.

{% assign surface_palette = "
- title: Black
  subtext: Deep Surface Backing
  color: '#0A0C0E'
- title: Void
  subtext: Base Background
  color: '#10141A'
- title: Ink
  subtext: Default Panel Background
  color: '#161B24'
- title: Slate
  subtext: Secondary Background
  color: '#1E2530'
- title: Steel
  subtext: Tertiary / Input Surface
  color: '#2A3340'
" | from_yaml %}

{% include comps/grid-palette.html items=surface_palette size="200px" height="90px" %}

---

{% include comps/heading.html tag="h2" text="Typography Contrast Hierarchy" icon="type" size=20 %}

Text colors are structured to optimize readability from crisp headers down to subtle meta text.

{% assign text_palette = "
- title: White
  subtext: High-contrast Accent
  color: '#EDF1F5'
- title: Ghost
  subtext: High-contrast Body Text
  color: '#D6DFE7'
- title: Silver
  subtext: Standard Body Text
  color: '#B8C5D0'
- title: Ash
  subtext: Secondary Muted Text
  color: '#8A9BAC'
- title: Smoke
  subtext: Low-contrast Meta Text
  color: '#5A6E82'
- title: Mist
  subtext: Deep Muted Annotations
  color: '#3D4D5E'
" | from_yaml %}

{% include comps/grid-palette.html items=text_palette size="200px" height="90px" %}

---

{% include comps/heading.html tag="h2" text="Terminal Emulation Colors" icon="terminal" size=20 %}

The colors used for inline command blocks and simulated CLI execution.

{% assign terminal_palette = "
- title: Terminal Green
  subtext: success / output
  color: '#00FF9D'
- title: Terminal Blue
  subtext: directory / info
  color: '#4DA3FF'
- title: Terminal Purple
  subtext: parameters / tools
  color: '#B06CF7'
- title: Terminal Orange
  subtext: warnings / alerts
  color: '#FF9E57'
- title: Terminal Red
  subtext: stderr / errors
  color: '#FF6B6B'
" | from_yaml %}

{% include comps/grid-palette.html items=terminal_palette size="200px" height="90px" %}
