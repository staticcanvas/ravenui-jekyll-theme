---
layout: default
title: Header Component
parent: /components/
description: Renders a modular, customizable top navigation bar supporting inline and sticky views.
enable_search: true
---

The `header.html` component provides a modular top header navigation bar. It dynamically pulls links from `_data/navheader.yml` and renders them with support for Lucide icons, Simple Icons, Font Awesome brands, search triggers, a theme toggle, and repository/social links.

💠 **Parameters:**

| Parameter | Type | Description |
| :--- | :--- | :--- |
| `inline` | Boolean | If `true`, disables sticky positioning and container constraints for placement inside custom canvas layouts (default: `false`). |
| `align` | String | Alignment of the navigation links: `left`, `center`, `right` (default: `site.theme_settings.header.align` or `center`). |
| `density` | String | Vertical spacing density: `compact`, `default`, `relaxed` (default: `site.theme_settings.header.density` or `default`). |

---

## **Usage Example**

To render the header as an inline component inside a custom landing page or blank layout container:

{% capture header_example %}
```liquid
{% include comps/header.html inline=true align="right" density="compact" %}
```
{% endcapture %}
{% include comps/example-code.html content=header_example %}

---

## **Data Structure**

The links in the navigation bar are defined in `_data/navheader.yml`. Here is an example schema structure:

{% capture yaml_example %}
```yaml
- text: "Docs"
  url: "/"
  icon: "home"
- text: "GitHub"
  url: "https://github.com/staticcanvas"
  icon: "github"
  source: "simple"
  external: true
- text: "Features"
  url: "/features"
  icon: "zap"
  is_new_feature: "hot"
```
{% endcapture %}
{% include comps/example-code.html content=yaml_example %}
