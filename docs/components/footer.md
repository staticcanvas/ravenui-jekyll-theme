---
layout: default
title: Footer Components
parent: /components/
description: Renders configurable footer grids with multi-column layouts and discrete item blocks.
enable_search: true
---
RavenUI supports building modular, responsive footers using grid components. You can construct footers in 2-column or 3-column layouts using individual, highly configurable footer items.

{% include comps/heading.html tag="h2" text="Footer Item" icon="package" size=20 %}

The `footer-item.html` component represents a single discrete block within a column. It supports multiple types of content, including links, brand logos, images, icons, inline text, badges, and iframe embeds.

💠 **Parameters:**

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `type` | String | Type of footer item: `link`, `icon`, `logo`, `image`, `iframe`, `badge`, `text` (default). |
| `text` | String | Core text content (used for links, titles, or inline text). |
| `url` | String | Target URL for links and icons. |
| `icon` | String | Lucide icon name (for links, icons, and badges). |
| `color` | String | Accent color (specifically for icons and badge colors). |
| `src` | String | Source URL (for logos, images, and iframe embeds). |
| `alt` | String | Alt text description for images or logos. |
| `subtext` | String | Sub-title or descriptive string (specifically for `logo` types). |
| `style` | String | Inline CSS styles to apply to the item wrapper. |

---

{% include comps/heading.html tag="h2" text="Footer Columns" icon="grid" size=20 %}

Columns can be arranged using either `footer-2col.html` (two equal columns) or `footer-3col.html` (three equal columns). They accept arrays of items representing the content for each column.

🟩 **2-Column Grid Parameters:**

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `col1` | Array | List of item objects for Column 1. |
| `col1_title` | String | Optional title/header text for Column 1. |
| `col2` | Array | List of item objects for Column 2. |
| `col2_title` | String | Optional title/header text for Column 2. |

🟩 **3-Column Grid Parameters:**

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `col1` | Array | List of item objects for Column 1. |
| `col1_title` | String | Optional title/header text for Column 1. |
| `col2` | Array | List of item objects for Column 2. |
| `col2_title` | String | Optional title/header text for Column 2. |
| `col3` | Array | List of item objects for Column 3. |
| `col3_title` | String | Optional title/header text for Column 3. |

---

{% include comps/heading.html tag="h2" text="Usage Example" icon="code" size=20 %}

Below is a configuration blueprint demonstrating how to define footer columns within `_config.yml`:

{% capture config_example %}
```yaml
theme_settings:
  footer:
    columns:
      - title: "Product"
        items:
          - type: link
            text: "Features"
            url: "/features"
          - type: link
            text: "Documentation"
            url: "/docs"
      - title: "Resources"
        items:
          - type: link
            text: "Blog"
            url: "/blog"
          - type: badge
            text: "v1.16.2"
            color: "var(--rd-clr-viridian)"
      - title: "Connect"
        items:
          - type: icon
            icon: "github"
            url: "https://github.com/staticcanvas"
          - type: text
            text: "RavenUI theme for Jekyll."
```
{% endcapture %}
{% include comps/example-code.html content=config_example %}
