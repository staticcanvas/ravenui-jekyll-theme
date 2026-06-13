---
layout: default
title: Breadcrumbs
output-title: true
tags: [ui, navigation, breadcrumbs]
description: Automatic breadcrumb navigation based on the page URL structure.
enable_search: true
---
The `breadcrumbs.html` component provides a standard way to display the user's current location within the site hierarchy. It automatically parses the page URL to generate a clickable trail.

{% include comps/heading.html tag="h2" text="Live Example" icon="map" size=20 %}

{% include comps/breadcrumbs.html %}

{% capture bread_code %}
{% raw %}
```liquid
{% include comps/breadcrumbs.html %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=bread_code %}

---

{% include comps/heading.html tag="h2" text="Features" icon="check-circle" size=20 %}

- **Automatic Parsing:** Dynamically generates paths from the URL.
- **Home Integration:** Includes a home icon for the root directory.
- **Capitalization:** Automatically capitalizes path segments and replaces hyphens with spaces.
- **Aria-Labeling:** Fully accessible with `aria-label="Breadcrumb"`.

---

{% include comps/callout.html type="info" title="Configuration" content="This component does not require any parameters. It relies on Jekyll's `page.url` and `page.title` to generate the output." %}
