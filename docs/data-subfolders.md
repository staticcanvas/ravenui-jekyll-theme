---
layout: default
title: 'Data Subfolders'
output-title: true
tags: [data, yaml, json, organization, subfolders]
description: 'Organizing and referencing data files stored in subfolders under the _data/ directory.'
enable_search: true
permalink: /data-subfolders/
---

Jekyll supports organising data files into subdirectories under `_data/`. Subdirectories allow you to group related datasets logically — for example, separating product data from navigation data — without polluting the top-level `_data/` namespace. Files are accessed using dot-notation: `site.data.<subfolder>.<filename>`.

{% include comps/heading.html tag="h2" text="Directory Structure Example" icon="folder" size=20 %}

A well-organised `_data/` directory for a multi-product documentation site might look like this:

```
_data/
├── navigation.yml          → site.data.navigation
├── releases.yml            → site.data.releases
├── tags.yml                → site.data.tags
├── products/
│   ├── accessories.yml     → site.data.products.accessories
│   └── software.yml        → site.data.products.software
└── api/
    └── endpoints.json      → site.data.api.endpoints
```

Each file is accessed independently. There is no automatic merging of sibling files within the same folder.

---

{% include comps/heading.html tag="h2" text="Accessing Subfolder Data in Liquid" icon="code" size=20 %}

Access follows the same dot-notation pattern as top-level files, with the subfolder name inserted between `site.data` and the filename:

```liquid
{% for item in site.data.products.accessories %}
  <p>{{ item.name }} — {{ item.sku }}</p>
{% endfor %}
```

You can also assign subfolder data to a variable for repeated use on the same page:

```liquid
{% assign accessories = site.data.products.accessories %}
{% for item in accessories %}
  {{ item.name }}
{% endfor %}
```

---

{% include comps/heading.html tag="h2" text="Accessing Subfolder Data in RavenUI Components" icon="package" size=20 %}

The `data_source` parameter accepts dot-separated paths that mirror the `site.data` access pattern. Provide the subfolder path and filename (without extension) separated by dots:

```liquid
{% include comps/datatable.html
  data_source="products.accessories"
  headers="name:Name,sku:SKU,price:Price,status:Status" %}
```

```liquid
{% include comps/timeline.html
  data_source="api.endpoints"
  title_key="method"
  body_key="description" %}
```

The component resolves the data identically to a top-level file — the dot-notation simply traverses the `site.data` object one level deeper.

---

{% include comps/heading.html tag="h2" text="Nesting Depth" icon="layers" size=20 %}

Jekyll supports arbitrary nesting depth. A two-level subfolder example:

```
_data/
└── docs/
    └── en/
        └── getting_started.yml   → site.data.docs.en.getting_started
```

Access in Liquid:

```liquid
{% for section in site.data.docs.en.getting_started %}
  <h3>{{ section.title }}</h3>
{% endfor %}
```

And in a RavenUI component:

```liquid
{% include comps/datatable.html data_source="docs.en.getting_started" headers="title:Section,url:URL" %}
```

{% include comps/callout.html type="note" title="Deep Nesting Warning" content="While Jekyll supports arbitrary depth, deeply nested structures can make Liquid templates harder to read and maintain. Prefer two levels of nesting at most for clarity." %}

---

{% include comps/heading.html tag="h2" text="Naming Conventions" icon="tag" size=20 %}

### **Recommended Conventions**

| Rule | Recommended | Avoid |
| :--- | :--- | :--- |
| File and folder names | `snake_case` or `kebab-case` | Spaces, uppercase, special characters |
| Hyphens in names | `my_folder` (underscores) | `my-folder` (hyphens in folder names) |
| Extensions | `.yml` for YAML | `.yaml` (inconsistent across the project) |

{% include comps/callout.html type="caution" title="Hyphens in Folder Names" content="Jekyll converts hyphens in _data/ folder names to underscores when building the site.data object. A folder named `my-folder` is accessed as `site.data.my_folder`, not `site.data.my-folder`. Use underscores in folder names to avoid ambiguity." %}

This does **not** apply to filenames — `site.data.folder.my-file` will work, though `my_file` is still the cleaner convention.

---

{% include comps/heading.html tag="h2" text="Use Cases" icon="briefcase" size=20 %}

Subfolder organisation is valuable whenever data sets can be grouped by domain or scope:

- **Multi-product sites** — one subfolder per product (`products/alpha.yml`, `products/beta.yml`)
- **API documentation sets** — endpoints per service (`api/auth.json`, `api/billing.json`)
- **Localisation data** — per-language strings (`i18n/en.yml`, `i18n/fr.yml`)
- **Per-section navigation** — scoped menus (`nav/docs.yml`, `nav/blog.yml`)
- **Release history by year** — `releases/2025.yml`, `releases/2026.yml`

This structure scales well as the site grows and prevents the root `_data/` directory from becoming unwieldy.

---

{% include comps/heading.html tag="h2" text="Caveats" icon="alert-triangle" size=20 %}

{% include comps/callout.html type="note" title="Build Performance" content="Jekyll reads and parses every file in _data/ on each build. Large, deeply nested data trees with many files can noticeably increase compilation time. Keep data files focused, flat where possible, and remove unused files from _data/ before production builds." %}

- Jekyll does **not** lazy-load data files; all are parsed at startup regardless of which pages reference them.
- Unused data files still contribute to build time — clean up obsolete files periodically.
- Very large CSV or JSON files (thousands of rows) are better served via a static API endpoint than a `_data/` file, as they block the Jekyll compilation process.
