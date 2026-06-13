---
layout: default
title: Releases
output-title: true
tags: [ui, git, history]
description: A vertical timeline for displaying project release notes.
enable_search: true
---
The `releases.html` component renders a structured timeline of release notes, perfect for project history or changelogs.

{% include comps/heading.html tag="h2" text="Live Example" icon="github" size=20 %}

{% capture my_releases %}
- tag_name: "v1.3.4"
  published_at: "2026-06-08"
  name: "Modular SCSS"
  body: "Refactored SCSS architecture."
  html_url: "#"
{% endcapture %}

{% assign release_data = my_releases | from_yaml %}
{% include comps/releases.html data=release_data %}

---

{% include comps/heading.html tag="h2" text="Automatic Site Data" icon="database" size=20 %}

If no `data` parameter is passed, the component automatically attempts to pull from `_data/releases.yml`.

{% include comps/releases.html %}

{% capture auto_code %}
```liquid
<!-- Automatically pulls from _data/releases.yml -->
{% include comps/releases.html %}
```
{% endcapture %}
{% include comps/example-code.html content=auto_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data` | Array | | An array of release objects (compatible with GitHub/GitLab API schemas). |
