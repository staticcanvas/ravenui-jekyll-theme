---
layout: default
title: Depends Upon
output-title: true
tags: [ui, documentation, components, dependencies]
description: A structured dependency listing component that documents what a page or component requires — CDN scripts, Ruby gems, npm packages, or internal components.
enable_search: true
depends_upon:
  - name: "Lucide Icons"
    type: js-cdn
    version: "0.400.0"
    link: "https://lucide.dev"
    description: "SVG icon library used for type badge icons within this component."
---

Use `depends-upon.html` to document the external and internal dependencies of any component or documentation page. Supports structured objects with type categorisation, version pinning, external links, and a full or compact display mode.

{% include comps/heading.html tag="h2" text="Live Examples" icon="package-check" size=20 %}

**Full structured list (from front-matter `depends_upon`):**

{% include comps/depends-upon.html items=page.depends_upon %}

**Mixed types:**

{% assign demo_deps = "" | split: "" %}
{% capture _dep1 %}{"name":"Lucide Icons","type":"js-cdn","version":"0.400.0","link":"https://lucide.dev","description":"SVG icon library loaded via CDN or local bundle."}{% endcapture %}

{% include comps/depends-upon.html items=page.depends_upon title="Component Requirements" %}

**Compact (pill) mode:**

{% include comps/depends-upon.html items=page.depends_upon compact=true %}

{% include comps/spacer.html size="sm" %}

{% capture deps_code %}
{% raw %}
```yaml
# In front-matter:
depends_upon:
  - name: "Lucide Icons"
    type: js-cdn
    version: "0.400.0"
    link: "https://lucide.dev"
    description: "SVG icon library, loaded via CDN or local bundle."
  - name: "jekyll-feed"
    type: ruby-gem
    version: "0.17.0"
    link: "https://github.com/jekyll/jekyll-feed"
    description: "Generates Atom feed for posts."
  - name: "icon.html"
    type: component
    link: "/components/icon/"
    description: "Internal icon component dependency."
```

```liquid
{# Render from front-matter #}
{% include comps/depends-upon.html items=page.depends_upon %}

{# From a _data/ file: site.data.deps.callout #}
{% include comps/depends-upon.html data_source="deps.callout" %}

{# Compact pill-only mode #}
{% include comps/depends-upon.html items=page.depends_upon compact=true %}

{# Custom title #}
{% include comps/depends-upon.html items=page.depends_upon title="Required by this page" %}

{# Hide the header #}
{% include comps/depends-upon.html items=page.depends_upon title="" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=deps_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `items` | Array | — | Array of dependency objects or plain name strings. |
| `data_source` | String | — | Dot-notation path into `site.data` (e.g. `"deps.callout"`). Used when `items` is not set. |
| `title` | String | `"Dependencies"` | Heading label. Set to `""` to suppress the header entirely. |
| `compact` | Boolean | `false` | Pill-only compact display — hides descriptions. |
| `class` | String | — | Additional CSS classes for the wrapper element. |

---

{% include comps/heading.html tag="h2" text="Dependency Object Schema" icon="file-code" size=20 %}

| Key | Type | Required | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | Yes | Display name of the dependency. |
| `type` | String | No | Dependency category — controls badge colour. See types below. |
| `version` | String | No | Version number (rendered as `v{version}`). |
| `link` | String | No | URL to docs, GitHub, or package registry. |
| `description` | String | No | Short description of what the dependency does. |
| `package` | String | No | Package identifier (e.g. `@pagefind/default-ui`, `jekyll-feed`). |

---

{% include comps/heading.html tag="h2" text="Dependency Types" icon="tag" size=20 %}

| Type value | Badge label | Typical use |
| :--- | :--- | :--- |
| `js-cdn` | CDN | JavaScript loaded via CDN URL |
| `js-local` | Local JS | JavaScript bundled locally |
| `css-cdn` | CSS CDN | Stylesheet loaded from CDN |
| `ruby-gem` | Ruby Gem | Jekyll plugin or Gem dependency |
| `component` | Component | Internal RavenUI component |
| `plugin` | Plugin | Jekyll plugin (internal or third-party) |
| `npm` | npm | npm package |
| `other` | External | Anything else (default fallback) |
