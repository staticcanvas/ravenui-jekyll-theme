---
layout: default
title: Variables Reference
output-title: true
tags: [liquid, variables, configuration, reference]
description: Complete reference for all _config.yml settings, theme_settings namespaces, page front-matter overrides, and Liquid variables in RavenUI.
permalink: /variables/
enable_search: true
---

This page is the canonical reference for all configuration variables, Jekyll global objects, and page-level metadata options in the **RavenUI Jekyll Theme**. Bookmark this page — it covers every setting you can set in `_config.yml` or a page's front-matter.

---

{% include comps/heading.html tag="h2" text="Jekyll Global Objects" icon="globe" size=20 %}

Liquid templates have access to the following standard global scopes:

| Object | Description |
| :--- | :--- |
| `site` | Global configuration from `_config.yml`, data files, and all pages/posts. |
| `page` | Metadata from the current page/post front-matter. |
| `layout` | Metadata from the active layout file's front-matter. |
| `content` | Rendered HTML content inserted by a layout template. |
| `jekyll` | Jekyll build info: `jekyll.environment`, `jekyll.version`. |

---

{% include comps/heading.html tag="h2" text="Site-Level Shorthand Variables" icon="zap" size=20 %}

These root-level keys in `_config.yml` are accessed as `site.<key>` in Liquid:

| Variable | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | — | Site title displayed in `<title>` tags and the header. |
| `description` | String | — | Site description for SEO meta tags. |
| `logo_text` | String | `RAVEN` | Brand text shown in the header and sidebar. |
| `logo_subtext` | String | `UI` | Subtitle after `//` in the header brand. |
| `copyright` | String | — | Copyright line in the footer. |
| `version` | String | — | Current theme/site version. Used by `tag.html` for `text="latest"` resolution. |
| `github_username` | String | — | GitHub username for social links and edit-page links. |
| `twitter_username` | String | — | Twitter/X username for social links. |
| `linkedin_username` | String | — | LinkedIn username for social links. |
| `rd_output_title_default` | Boolean | `true` | Default `output-title` state for all pages. |
| `rd_toc_default_open` | Boolean | `false` | Whether the TOC panel starts open on wide screens. |
| `rd_toc_levels` | Array | `[h2, h3]` | Heading tags scanned by the TOC component. |
| `rd_code_copy` | Boolean | `false` | Enable copy-to-clipboard buttons on code blocks. |
| `rd_code_lang` | Boolean | `false` | Enable language badge labels on code blocks. |
| `rd_show_version` | Boolean | `false` | Show version badge in the sidebar brand. |
| `rd_show_powered_by` | Boolean | `false` | Show "Powered by RavenUI" in the footer. |
| `rd_accent_color` | String | `#00ff9d` | Global accent color override (CSS color). |
| `rd_nav_spacing` | String | `compact` | Sidebar link spacing (`compact`, `tight`, `comfy`, `spacy`). |
| `rd_headings_always_visible` | Boolean | `false` | Make heading anchor links always visible (not hover-only). |
| `rd_debug` | Boolean | `false` | Enable debug/draft mode features. |
| `rd_use_cdn` | Boolean | `true` | Load JS assets from CDN. |
| `font_awesome` | Boolean | `false` | Load Font Awesome icon library. |

---

{% include comps/heading.html tag="h2" text="theme_settings Namespace" icon="settings" size=20 %}

Nested under `theme_settings:` in `_config.yml`.

### **Environment**

| Key | Type | Options | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.environment` | String | `development`, `production` | Controls draft visibility and dev-only features. |

### **Logo**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.logo.path` | String | — | Path to the logo SVG or image. |
| `theme_settings.logo.height` | String | `32px` | Logo element height. |
| `theme_settings.logo.layout` | String | `inline` | Brand layout: `inline`, `stacked`, `split`. |
| `theme_settings.logo.alt` | String | `site.title` | Alt text for the logo image. |

### **Header**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.header.enabled` | Boolean | `true` | Show/hide the top navigation bar. |
| `theme_settings.header.sticky` | Boolean | `false` | Make header sticky at the top of the viewport. |
| `theme_settings.header.align` | String | `center` | Nav link alignment: `left`, `center`, `right`. |
| `theme_settings.header.density` | String | `default` | Vertical padding: `compact`, `default`, `relaxed`. |

### **Table of Contents (TOC)**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.toc.style` | String | `simple` | Link layout: `simple`, `lines`, `nodes`. |
| `theme_settings.toc.density` | String | `default` | Spacing: `compact`, `default`, `relaxed`. |
| `theme_settings.toc.animations` | Boolean | `true` | Enable scroll-highlight animations on TOC anchors. |

### **Code Blocks**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.code.lang_style` | String | `badge` | Language label style: `badge`, `header`. |

### **Borders**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.borders.style` | String | `solid` | Global border style: `solid`, `dotted`, `dashed`, `double`, `none`. |
| `theme_settings.borders.width` | String | `1px` | Border width (e.g. `1px`, `2px`). |
| `theme_settings.borders.color` | String | `default` | Border color token: `default`, `subtle`, `strong`, `accent`, or CSS color. |
| `theme_settings.borders.gradient.enable` | Boolean | `false` | Enable premium gradient borders. |
| `theme_settings.borders.gradient.type` | String | `linear` | Gradient type: `linear`, `radial`. |
| `theme_settings.borders.gradient.direction` | String | `135deg` | Direction for linear gradients. |
| `theme_settings.borders.gradient.colors` | Array | — | Color stops for the gradient border. |

### **Background**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.background.gradient.enable` | Boolean | `false` | Enable background gradient layer. |
| `theme_settings.background.gradient.type` | String | `linear` | Gradient type: `linear`, `radial`. |
| `theme_settings.background.gradient.direction` | String | `135deg` | Direction for linear gradient. |
| `theme_settings.background.gradient.colors` | Array | — | Color stop array for the gradient. |
| `theme_settings.background.backdrop.enable` | Boolean | `false` | Enable backdrop pattern overlay. |
| `theme_settings.background.backdrop.opacity` | Float | `0.05` | Backdrop pattern opacity. |
| `theme_settings.background.backdrop.pattern` | String | `grid` | Pattern style: `grid`, `dots`, `diagonal`. |
| `theme_settings.background.animation.enable` | Boolean | `true` | Enable background colour-shift animation. |
| `theme_settings.background.animation.speed` | String | `slow` | Animation speed: `slow`, `normal`, `fast`. |

### **Typography**

| Key | Type | Description |
| :--- | :--- | :--- |
| `theme_settings.typography.google_fonts` | String | Google Fonts URL query string for custom web fonts. |
| `theme_settings.typography.font_sans` | String | CSS `font-family` stack for body text. |
| `theme_settings.typography.font_mono` | String | CSS `font-family` stack for monospace/code. |
| `theme_settings.typography.h1.font_family` | String | Font family override for H1 headings. |
| `theme_settings.typography.h1.weight` | String | Font weight for H1 headings. |
| `theme_settings.typography.h2.font_family` | String | Font family override for H2 headings. |
| `theme_settings.typography.h2.weight` | String | Font weight for H2 headings. |
| `theme_settings.typography.h3.font_family` | String | Font family override for H3 headings. |
| `theme_settings.typography.h3.weight` | String | Font weight for H3 headings. |

### **Animations**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.animations.enabled` | Boolean | `true` | Master toggle for all animations. |
| `theme_settings.animations.page_loads` | Boolean | `true` | Subtle fade-in on page load. |
| `theme_settings.animations.page_load_style` | String | `fade-in-up` | Style: `fade-in`, `fade-in-up`, `slide-in-left`, `zoom-in`, `none`. |
| `theme_settings.animations.hover_effects` | Boolean | `true` | Micro-animations on interactive element hover. |
| `theme_settings.animations.view_transitions` | Boolean | `true` | View Transitions API for navigation. |

### **Search**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.search.provider` | String | `pagefind` | Search engine: `pagefind`, `lyra`, `algolia`. |
| `theme_settings.search.use_cdn` | Boolean | `true` | Load search library via CDN. |
| `theme_settings.search.algolia.app_id` | String | — | Algolia Application ID. |
| `theme_settings.search.algolia.api_key` | String | — | Algolia Search-Only API Key. |
| `theme_settings.search.algolia.index_name` | String | — | Algolia index name. |

### **Analytics**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.analytics.provider` | String | `none` | Provider: `posthog`, `google_analytics`, `umami`, `plausible`, `none`. |
| `theme_settings.analytics.enable_in_dev` | Boolean | `false` | Track events during local development. |
| `theme_settings.analytics.posthog.api_key` | String | — | PostHog project API key. |
| `theme_settings.analytics.posthog.host` | String | — | PostHog ingestion host URL. |
| `theme_settings.analytics.google_analytics.id` | String | — | Google Analytics Measurement ID (`G-...`). |
| `theme_settings.analytics.umami.website_id` | String | — | Umami website UUID. |
| `theme_settings.analytics.plausible.domain` | String | — | Plausible domain (e.g. `example.com`). |

### **Feedback, Likes & Comments**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.feedback.likes.enabled` | Boolean | `false` | Show page likes widget. |
| `theme_settings.feedback.comments.enabled` | Boolean | `false` | Enable comments section. |
| `theme_settings.feedback.comments.provider` | String | `giscus` | Comment provider: `giscus`, `disqus`. |

### **Version Switcher**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.versions.enabled` | Boolean | `false` | Show version switcher dropdown in sidebar. |
| `theme_settings.versions.current` | String | — | Currently active version label. |
| `theme_settings.versions.list` | Array | — | Array of `{ text, url }` version entries. |

### **Collections**

| Key | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `theme_settings.collections.enabled` | Boolean | `false` | Auto-populate sidebar from Jekyll collections. |

### **Dynamic Footer**

The footer is built from a `columns` array. Each column has a `title` and an `items` list:

| Item Property | Type | Values | Description |
| :--- | :--- | :--- | :--- |
| `type` | String | `link`, `text`, `icon` | Item rendering type. |
| `text` | String | — | Display text (for `link` and `text` types). |
| `url` | String | — | Target URL (for `link` and `icon` types). |
| `icon` | String | — | Lucide icon name (for `link` and `icon` types). |

---

{% include comps/heading.html tag="h2" text="Page Front-Matter Overrides" icon="file-text" size=20 %}

These keys can be set in any page or post's YAML front-matter block:

### **Layout & Identity**

| Key | Type | Description |
| :--- | :--- | :--- |
| `layout` | String | Template name: `default`, `blank`, `article`, `blog`, `post`. |
| `title` | String | Page title shown in `<h1>` and `<title>` tags. |
| `description` | String | Short summary for SEO meta and listing cards. |
| `output-title` | Boolean | Render the `<h1>` hero section. Overrides `rd_output_title_default`. |
| `permalink` | String | Custom URL path (e.g. `/my-page/`). |
| `draft` | Boolean | Mark page as draft — shows badge in development mode. |

### **Navigation & TOC**

| Key | Type | Description |
| :--- | :--- | :--- |
| `parent` | String | URL of the parent section (used by breadcrumbs). |
| `order` | Integer | Sort order within a collection or section. |
| `group` | String | Sub-group label for nested sidebar sections (collections). |
| `icon` | String | Lucide icon name shown in the sidebar link. |
| `color` | String | Accent color for the sidebar link icon. |
| `is_new_feature` | String/Boolean | Badge on sidebar link: `true` / `"new"` / `"updated"` / `"hot"`. |
| `enable_search` | Boolean | Opt page into the search index. |

### **Functional Overrides**

| Key | Type | Description |
| :--- | :--- | :--- |
| `scroll_progress` | Boolean | Show/hide the reading progress bar for this page. |
| `feedback` | Boolean | Show/hide the page helpfulness feedback widget. |
| `likes` | Boolean | Show/hide the static page likes widget. |
| `comments` | Boolean | Show/hide the comments block. |
| `tags` | Array | Tag labels for filtering and display (e.g. `[ui, data, charts]`). |
| `data_source` | String | Default `data_source` for components that support it on this page. |

---

{% include comps/heading.html tag="h2" text="Component Data Sourcing" icon="database" size=20 %}

Data-driven components (`timeline`, `roadmap`, `datatable`, `chartjs`, `steps`, `svgcharts`) accept data in two modes:

| Mode | Parameter | Description |
| :--- | :--- | :--- |
| **External file** | `data_source` | Dot-notation path inside `_data/` (e.g. `"history"` → `_data/history.yml`, `"project.roadmap"` → `_data/project/roadmap.yml`). |
| **Inline array** | `items` / `table_items` | Liquid variable or page front-matter array passed directly to the include. |

---

{% include comps/callout.html type="tip" title="Quick Lookup" content="Looking for a specific component's own parameters? Each component has its own documentation page under [Component Library](/components/)." %}
