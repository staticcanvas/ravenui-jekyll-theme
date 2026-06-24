---
layout: default
title: Index Warning Banner
output-title: true
tags: [alerts, debug, utility]
description: A helpful warning banner displayed on empty or unconfigured index pages to guide developer onboarding.
permalink: /components/index-warning/
enable_search: true
---

The `index-warning.html` component renders an interactive, collapsible alert panel designed to assist developers during the onboarding and scaffolding phases. It automatically alerts the developer if an index or home page is missing standard markdown structure, providing recommended components and quick setup scaffolds.

---

## **Usage**

The warning banner is wired to trigger dynamically within layouts when `page.index_warning: true` or when the page body is completely empty during local development:

{% raw %}
```liquid
{% include comps/index-warning.html %}
```
{% endraw %}

---

## **Collapsible Tips**

It includes a toggleable section displaying snippets for:
* Standard front-matter fields
* Common page configurations
* Component insertion syntax
