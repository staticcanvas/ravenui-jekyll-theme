---
layout: default
title: Git Tags
output-title: true
tags: [ui, git, versions]
description: A compact grid for displaying version tags and download links.
enable_search: true
---
The `git-tags.html` component provides a quick way to list project version tags with direct links to their source code or commit history. This is specifically designed for technical project documentation and version tracking.

{% include comps/heading.html tag="h2" text="Live Example" icon="tag" size=20 %}

{% capture my_tags %}
- name: "v1.3.3"
  commit: { sha: "a1b2c3" }
  zipball_url: "#"
- name: "v1.3.2"
  commit: { sha: "d4e5f6" }
  zipball_url: "#"
{% endcapture %}

{% assign tag_data = my_tags | from_yaml %}
{% include comps/git-tags.html data=tag_data %}

---

{% include comps/heading.html tag="h2" text="Automatic Site Data" icon="database" size=20 %}

If no `data` parameter is passed, the component automatically attempts to pull from `_data/tags.yml`.

{% include comps/git-tags.html %}

{% capture auto_code %}
```liquid
<!-- Automatically pulls from _data/tags.yml -->
{% include comps/git-tags.html %}
```
{% endcapture %}
{% include comps/example-code.html content=auto_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data` | Array | | An array of tag objects containing `name`, `commit.sha`, and `zipball_url`. |
