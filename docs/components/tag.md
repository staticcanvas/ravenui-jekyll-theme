---
layout: default
title: Tag Component
output-title: true
tags: [ui, elements, badges, versions]
description: A customizable component for rendering tags, badges, and version numbers.
enable_search: true
---
The `tag.html` component offers a dynamic way to render labels, metadata tags, badges, and releases/versions with special pre-built color styles.

{% include comps/heading.html tag="h2" text="Live Example" icon="tag" size=20 %}

{% include comps/tag.html text="Default Tag" %}
{% include comps/tag.html text="With Icon" icon="star" %}
{% include comps/tag.html text="Custom Color" color="#ff6b6b" icon="heart" %}

{% capture tag_eg %}
{% raw %}
```liquid
{% include comps/tag.html text="Default Tag" %}
{% include comps/tag.html text="With Icon" icon="star" %}
{% include comps/tag.html text="Custom Color" color="#ff6b6b" icon="heart" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=tag_eg %}

---

{% include comps/heading.html tag="h2" text="Version & Release Variants" icon="package" size=20 %}

Use predefined variant names inside the `type` parameter to style version tags according to semantic release guidelines.

<div class="rd-tag-container">
    {% include comps/tag.html text="v1.0.0-beta" type="beta" icon="activity" %}
    {% include comps/tag.html text="v1.0.0-rc1" type="rc" icon="git-pull-request" %}
    {% include comps/tag.html text="v1.0.0" type="release" icon="check" %}
    {% include comps/tag.html text="v2.0.0-breaking" type="major" icon="alert-triangle" %}
</div>

{% capture version_eg %}
{% raw %}
```liquid
<div class="rd-tag-container">
    {% include comps/tag.html text="v1.0.0-beta" type="beta" icon="activity" %}
    {% include comps/tag.html text="v1.0.0-rc1" type="rc" icon="git-pull-request" %}
    {% include comps/tag.html text="v1.0.0" type="release" icon="check" %}
    {% include comps/tag.html text="v2.0.0-breaking" type="major" icon="alert-triangle" %}
</div>
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=version_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `text` | String | `tag` | The text label to display. |
| `type` | String | `default` | Variant type (`default`, `beta`, `rc`, `release`, `major`, `version`). |
| `icon` | String | | Optional Lucide icon name to display before the text. |
| `color` | String | | Optional custom CSS color (hex, rgb, var) for dynamic borders/backgrounds. |
| `class` | String | | Optional CSS class to append to the tag. |
