---
layout: default
title: Articles
output-title: true
tags: [blog, posts, articles, meta]
description: Guidelines for creating long-form content, blog posts, and technical articles.
---

Zero-Dark features a specialized `post` layout optimized for long-form readability and technical articles.

{% include comps/heading.html tag="h2" text="Frontmatter Configuration" icon="file-text" size=20 %}

To render an article correctly, ensure you include the required metadata in the YAML frontmatter.

```yaml
---
layout: post
title: "The Future of Static Documentation"
description: "Exploring the shift towards WASM-powered search and modular SCSS."
date: 2026-06-08
author: "StaticCanvas"
category: "Engineering"
tags: [jekyll, technical, wasm]
---
```

---

{% include comps/heading.html tag="h2" text="Article Metadata" icon="list" size=20 %}

The `post` layout automatically renders a meta header with the following elements:

- **Date:** Formatted using the standard Liquid date filter.
- **Author:** Displays the author name with a user icon.
- **Category:** Shows the primary category of the article.
- **Tags:** Renders the list of tags as stylized pills.

---

{% include comps/heading.html tag="h2" text="Readability & Styling" icon="type" size=20 %}

Technical articles in Zero-Dark are designed with a max-width of **80ch** to ensure optimal line length for reading. 

- **Typography:** Increased line-height (1.8) for better legibility.
- **Spacing:** Generous vertical margins between headings and paragraphs.
- **Code Blocks:** Full support for syntax highlighting and copy-to-clipboard.

{% include comps/callout.html type="note" title="Naming Convention" content="While Jekyll uses the term 'posts', we prefer the term 'Articles' in our documentation and UI for a more professional tone." %}
