---
layout: default
title: Runtime Metadata
output-title: true
tags: [debug, metadata, configuration]
description: Displays Ruby runtime, Jekyll engine, Bundler, and active plugin version metadata for debugging.
enable_search: true
---

The `runtime-metadata.html` component provides a unified visualization of the site's compiler and dependency environment. It dynamically retrieves versions of Ruby, Jekyll, Bundler, loaded gem-based plugins, and local scripts.

> [!NOTE]
> This component relies on the custom Jekyll Generator plugin located at `_plugins/runtime_metadata.rb`. If custom plugins are disabled, the component will render a warning block.

---

{% include comps/heading.html tag="h2" text="Live Example (Table)" icon="layout" size=20 %}

{% include comps/runtime-metadata.html layout="table" %}

{% capture table_code %}
{% raw %}
```liquid
{% include comps/runtime-metadata.html layout="table" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=table_code %}

---

{% include comps/heading.html tag="h2" text="Live Example (Cards)" icon="grid" size=20 %}

{% include comps/runtime-metadata.html layout="cards" %}

{% capture cards_code %}
{% raw %}
```liquid
{% include comps/runtime-metadata.html layout="cards" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=cards_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `layout` | String | `table` | Render style for the metadata: `table` or `cards`. |
| `class` | String | | Additional custom CSS classes for the container. |

---

{% include comps/heading.html tag="h2" text="Data Schema" icon="database" size=20 %}

The plugin exposes the environment details via `site.runtime_metadata` in the following format:

```json
{
  "jekyll": "4.3.4",
  "ruby": "3.2.2",
  "ruby_platform": "x86_64-linux",
  "bundler": "2.4.10",
  "plugins": {
    "jekyll-seo-tag": "2.8.0",
    "jekyll-feed": "0.17.0"
  },
  "local_plugins": [
    "from_yaml.rb",
    "runtime_metadata.rb"
  ]
}
```
