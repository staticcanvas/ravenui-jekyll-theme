---
layout: default
title: Search Integration
output-title: true
tags: [search, pagefind, wasm]
description: Blazing fast, client-side search powered by Pagefind WASM.
---

ZeroDark SP utilizes [Pagefind](https://pagefind.app/), a high-performance search library that indexes your site and runs entirely in the browser.

{% include comps/heading.html tag="h2" text="How it Works" icon="help-circle" size=20 %}

Pagefind works by pre-indexing your static files after the Jekyll build. It generates a small WASM search index that is downloaded by the client only when they start searching.

- **Zero Server Overhead:** No database or backend required.
- **Instant Results:** Search millions of words in milliseconds.
- **Low Bandwidth:** The index is split into small chunks, only downloading what is needed.

---

{% include comps/heading.html tag="h2" text="Installation & Indexing" icon="download" size=20 %}

The theme is pre-configured with the Pagefind UI. To enable search on your hosted site, follow these steps:

#### 1. Build your site
```bash
bundle exec jekyll build
```

#### 2. Run the indexer
You can use `npx` to run Pagefind without installing it globally:
```bash
npx pagefind --site _site
```

#### 3. Automated Script
We include a `gen-pagefind.sh` script in the root directory to simplify this process:
```bash
./gen-pagefind.sh
```

---

{% include comps/heading.html tag="h2" text="UI Integration" icon="monitor" size=20 %}

The search interface is integrated into the ZeroDark SP modal system.

- **Trigger:** Click the "Search Docs..." box in the left sidebar.
- **Keyboard Shortcut:** Press the `/` key to open the modal from anywhere.
- **Auto-Focus:** The search input is automatically focused upon opening.
- **Sub-results:** Pagefind is configured to show headings and excerpts for better context.
