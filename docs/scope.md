---
layout: default
title: Philosophy & Scope
output-title: true
tags: [scope, philosophy, design]
description: Architectural scope, design guidelines, performance budgets, and core boundaries of the RavenUI theme.
permalink: /scope/
enable_search: true
---

RavenUI is a documentation-first theme designed for technical writing, API reference hubs, and developer guides. Taking inspiration from the Laravel design philosophy, it prioritizes **high information density**, **pristine typographic legibility**, and **zero-friction customizability**.

---

{% include comps/heading.html tag="h2" text="Design Philosophy" icon="heart" size=20 %}

We believe documentation is a developer's primary workspace. Therefore, the interface should get out of the way while providing high-utility navigation and interactive components.

* **Contrast Over Clutter:** Interfaces utilize high-contrast borders and subtle background elevations instead of heavy graphical fills.
* **Typographical Hierarchy:** Clear distinction between prose headers (Fraunces serif) and technical code elements (IBM Plex Sans/Mono).
* **System Settings Gateways:** Centralized switches in `_config.yml` handle layout densities and animation speeds globally, eliminating ad-hoc page styling hacks.

---

{% include comps/heading.html tag="h2" text="Performance Budget" icon="activity" size=20 %}

To ensure fast load times on all network connections and devices, RavenUI enforces a strict client-side budget:

### **Asset Size Boundaries**
* **Core Stylesheet:** The minified CSS bundle (`assets/css/main.css`) is budgeted to stay under **35 KB** gzipped.
* **Core JavaScript:** Script modules (`assets/js/ui.js`) are written in native vanilla ESM (ES Modules) without heavy frameworks (React/Vue/jQuery) and compile to under **15 KB**.

### **Pluggable Assets Delivery**
By default, heavy external libraries (GSAP, Chart.js, Mermaid.js) are only loaded if their feature flags are enabled in page metadata or site settings. When enabled, developers can choose between fast CDN endpoints and local offline copies for restricted corporate environments.

---

{% include comps/heading.html tag="h2" text="Architectural Boundaries" icon="layers" size=20 %}

A key part of maintaining a clean development workflow is knowing what a tool is *not* built to do. RavenUI makes several intentional boundary decisions:

### **Manual Curation by Default**
RavenUI defaults to using `_data/navigation.yml` to define layout navigation. We choose this manual approach over automatic file-system mapping because it gives developers complete control over page ordering, categories, icons, and status badges without polluting filenames with numeric ordering prefixes.

### **Optional Collection Support**
For dynamic sites with hundreds of pages (e.g. blog posts, API command references), collections can be toggled via a feature flag (`collections: true`). This maps file trees to dynamic list/grid layouts seamlessly.

### **No Collection Sibling Navigation**
RavenUI does not support collection sibling page mapping out of the box (e.g. linking to the next alphabetical file in a folder). This prevents sidebar bloat and layout tearing on large documentation hubs.
