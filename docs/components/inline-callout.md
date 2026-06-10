---
layout: default
title: Inline Callout
output-title: true
tags: [ui, elements, callouts, inline]
description: Contextual inline alerts and status indicators.
---

The `inline-callout.html` component provides a compact, inline layout version of our standard callout, ideal for embedding warning dots, minor tips, or statuses directly within lists or tables.

{% include comps/heading.html tag="h2" text="Live Example" icon="alert-circle" size=20 %}

{% include comps/inline-callout.html type="note" title="Status" content="System is fully operational." %}
{% include comps/inline-callout.html type="success" title="Success" content="Deployment complete." %}
{% include comps/inline-callout.html type="warn" title="Warning" content="High memory usage." %}
{% include comps/inline-callout.html type="danger" title="Error" content="Failed to connect to database." %}

{% capture inline_eg %}
{% raw %}
```liquid
{% include comps/inline-callout.html type="note" title="Status" content="System is fully operational." %}
{% include comps/inline-callout.html type="success" title="Success" content="Deployment complete." %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=inline_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | String | `note` | The callout type (`note`, `success`, `warn`, `danger`). |
| `title` | String | | The bold title prefix. |
| `content` | String | | The alert message body. |
