---
layout: default
title: Configuration
output-title: true
tags: [setup, config, yaml]
description: Global settings and metadata controls for the ZeroDark SP theme.
---

ZeroDark SP uses a mix of standard Jekyll settings and custom theme-level controls defined in your `_config.yml` and page frontmatter.

{% include comps/heading.html tag="h2" text="Theme Settings" icon="settings" size=20 %}

The `theme_settings` block in `_config.yml` houses advanced customizations for branding and interface behavior.

```yaml
theme_settings:
  logo:
    path: /assets/img/logo.svg
    height: 32px
  scroll_progress: true
```

| Field | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `logo.path` | String | `null` | Path to an image logo displayed in the sidebar. |
| `logo.height` | String | `32px` | Visual height of the sidebar logo. |
| `scroll_progress` | Boolean | `true` | Global toggle for the reading progress bar. |

---

{% include comps/heading.html tag="h2" text="Page-Level Controls" icon="file-text" size=20 %}

Every page can control its own visibility and header output via the following YAML fields:

| Field | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `output-title` | Boolean | `true` | Whether to render the `h1` and `tags` at the top. |
| `scroll_progress`| Boolean | `site default`| Per-page override for the reading progress bar. |
| `tags` | Array | `[]` | A list of strings to be displayed as highlighted pills. |
| `description` | String | `""` | Subtext appearing directly under the title. |
| `zd_nav_spacing` | String | `compact` | Global density: `compact`, `tight`, `comfy`, `spacy`. |

<br>

**Example Header:**

```yaml
---
layout: default
title: Advanced Setup
output-title: true
scroll_progress: false
tags: [advanced, internal]
description: This guide covers the low-level architecture.
---
```

---

{% include comps/heading.html tag="h2" text="Global Site Settings" icon="globe" size=20 %}

Define these in your root `_config.yml` to customize the identity of your documentation.

```yaml
# Theme Features
zd_output_title_default: true
zd_toc_default_open: true
zd_code_copy: true
zd_code_lang: true

title: ZeroDark Docs
logo_text: ZERODARK
logo_subtext: SP
copyright: "© 2026 ZeroDark Systems."
```

{% include comps/heading.html tag="h2" text="Search Integration (Pagefind)" icon="search" size=20 %}

ZeroDark SP is pre-configured for **Pagefind**, a WASM-based search engine.

**Setup:**
1. Build your site: `bundle exec jekyll build`
2. Index with Pagefind: `npx pagefind --site _site`
3. The search modal will automatically handle results based on your content.

**Usage:**
- Click the **Search Docs...** trigger in the sidebar.
- Use the `/` keybinding to open the search modal instantly.
- Press `Esc` to close.

For detailed configuration of the search index, see the [Pagefind Documentation](https://pagefind.app/docs/).

---

{% include comps/heading.html tag="h2" text="CDN vs Local Assets" icon="globe" size=20 %}

ZeroDark SP allows you to toggle between using content delivery networks (CDNs) and locally-hosted script files for maximum security, privacy, and offline compatibility.

### Toggle Switch

You can control this globally in your `_config.yml` via the `zd_use_cdn` setting:

```yaml
zd_use_cdn: true  # Default: Uses high-performance CDNs for asset loading
# Set to false to load local vendor assets from the theme's assets directory
```

### Pinned Script & Asset Versions

Below are the third-party assets integrated into ZeroDark SP:

| Asset Library | Version | CDN URL / Source | Local File Location |
| :--- | :--- | :--- | :--- |
| **Lucide Icons** | `0.400.0` | `https://unpkg.com/lucide@0.400.0/dist/umd/lucide.min.js` | `/assets/js/vendor/lucide.0.400.0.min.js` |
| **Simple Icons** | Dynamic | `https://cdn.simpleicons.org/{slug}/{hex}` | *Always fetched dynamically from Simple Icons CDN* |
| **Font Awesome** | `6.5.2` | `https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css` | `/assets/css/vendor/fontawesome.6.5.2.min.css` |
| **Pagefind** | `1.1.0` | *Built dynamically during site compilation* | `/pagefind/pagefind-ui.js` / `/pagefind/pagefind-ui.css` |
| **LogCAD** | `1.1.0` | `https://esm.sh/@staticcanvas/logcad@1.1.0` | *Dynamic ESM CDN import* |
| **SnailTrail** | `1.0.0` | `https://esm.sh/@staticcanvas/snailtrail@1.0.0` | *Dynamic ESM CDN import* |

> [!NOTE]
> If `zd_use_cdn` is set to `false`, make sure the corresponding vendor files are present in your site's local assets.
