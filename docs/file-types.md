---
layout: default
title: 'File Types & Extensions'
output-title: true
tags: [jekyll, pages, file-types, html, markdown]
description: 'Explains when to use .md vs .html page extensions and how Jekyll parses each.'
enable_search: true
permalink: /file-types/
---

Jekyll processes both `.md` and `.html` files as pages. The file extension determines whether the Markdown parser (Kramdown) is involved before the Liquid template engine renders the final output. Choosing the right extension for each page avoids common rendering artifacts and keeps your markup predictable.

{% include comps/heading.html tag="h2" text="Overview" icon="file" size=20 %}

Every file in your site root (and configured collection directories) that has valid front matter is treated as a page. Jekyll's processing pipeline runs in this order:

1. **Front matter** is parsed and merged with `site` and `page` variables.
2. **Liquid** tags and filters are evaluated.
3. If the source extension is `.md`, **Kramdown** converts Markdown syntax to HTML.
4. The result is injected into the designated **layout**.

The extension you choose determines whether step 3 occurs, which has cascading implications for how HTML components and Liquid includes interact with the page content.

---

{% include comps/heading.html tag="h2" text="Markdown (.md) Pages" icon="file-text" size=20 %}

`.md` files are parsed by Kramdown before layout injection. Kramdown implements [GitHub Flavored Markdown](https://github.github.com/gfm/) (GFM) and supports:

- Fenced code blocks with language identifiers
- Pipe tables
- Footnotes and definition lists
- Inline HTML (with caveats — see [Parsing Caveats](#parsing-caveats) below)
- Attribute lists (`{: .class #id }`)

**Best suited for:** documentation pages, blog posts, changelogs, tutorials, and any content that is primarily prose with occasional code blocks.

```markdown
---
layout: default
title: My Documentation Page
---

## Introduction

This is a standard **Markdown** documentation page.
Kramdown converts this content before it enters the layout.
```

{% include comps/callout.html type="note" title="GFM Tables in Markdown" content="Standard pipe tables are fully supported in `.md` pages and are the recommended way to display reference data in documentation. RavenUI applies high-contrast table styles automatically." %}

---

{% include comps/heading.html tag="h2" text="HTML (.html) Pages" icon="code" size=20 %}

`.html` files are passed directly through the Liquid engine without any Markdown processing. What you write is what renders — no paragraph wrapping, no Markdown conversion.

**Best suited for:** complex layouts, dashboard pages, canvas designs, pages that embed multiple multi-line HTML components, and any page where exact tag control is required.

{% raw %}
```html
---
layout: default
title: My Dashboard Page
---

<div class="rd-grid rd-grid--3">
  {% include comps/card.html title="Metric A" value="1,204" %}
  {% include comps/card.html title="Metric B" value="98.4%" %}
  {% include comps/card.html title="Metric C" value="42ms" %}
</div>
```
{% endraw %}

{% include comps/callout.html type="tip" title="Avoid Paragraph Wrapping" content="If a Liquid include emits block-level HTML and you are in a `.md` file, Kramdown may wrap surrounding text in `<p>` tags that break layout flow. Use `.html` pages when component structure must remain pristine." %}

---

{% include comps/heading.html tag="h2" text="RavenUI Component Files" icon="package" size=20 %}

All RavenUI include components live under `_includes/comps/` and carry a `.html` extension. They are processed as Liquid templates regardless of the calling page's extension.

A component's `content` parameter can accept either Markdown or raw HTML depending on the calling context:

- When called from a `.md` page, any **Markdown passed via {% raw %}`{% capture %}`{% endraw %}** is first rendered by Kramdown, so the component receives HTML.
- When called from a `.html` page, you must pass fully-formed HTML or plain text; Markdown syntax will not be converted.

{% raw %}
```liquid
{% capture my_note %}
**This Markdown** is rendered by Kramdown first (when in a `.md` page).
{% endcapture %}
{% include comps/callout.html type="note" content=my_note %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="When to Choose Which" icon="git-branch" size=20 %}

### **Decision Reference**

| Scenario | Recommended Extension |
| :--- | :--- |
| Standard documentation page | `.md` |
| Blog post or changelog entry | `.md` |
| Dashboard or canvas layout | `.html` |
| Complex multi-component page | `.html` |
| Page with {% raw %}`{% capture %}`{% endraw %} blocks | `.md` with care |
| Precise tag control required | `.html` |
| SEO-focused prose content | `.md` |

---

{% include comps/heading.html tag="h2" text="Parsing Caveats" icon="alert-triangle" size=20 %}

### **Paragraph Wrapping Artifact**

Kramdown wraps bare text blocks in `<p>` tags. When an HTML component is placed directly inside a `.md` file alongside text, the surrounding whitespace can cause the adjacent text to be incorrectly wrapped, or the component's outer element to be nested inside a `<p>` tag — which is invalid HTML and produces browser-specific rendering bugs.

**Workaround:** Wrap multi-line HTML includes in a block-level `<div>` with a blank line above and below:

{% raw %}
```markdown
Preceding text paragraph.

<div>
{% include comps/modal.html id="my-modal" title="Example" content="..." %}
</div>

Following text paragraph.
```
{% endraw %}

The `modal.html` component documentation covers this pattern in detail. See [Modal / Dialog](/components/modal/) for a complete example and explanation.

---

{% include comps/heading.html tag="h2" text="Collection Documents" icon="layers" size=20 %}

Documents inside Jekyll collections (`_tutorials/`, `_posts/`, `_changelog/`, etc.) follow identical rules. The `.md` extension is the standard choice for most collection items. Use `.html` for custom collection items that require a precise, component-driven layout rather than prose content.

{% include comps/callout.html type="note" title="Collections Configuration" content="Collection source directories and their output settings are configured in `_config.yml` under the `collections` key. See the Jekyll Collections documentation page for full details." %}
