---
layout: default
title: Callout
output-title: true
tags: [ui, elements, callouts]
description: Contextual alerts and notifications with multiple styles (note, tip, warning, danger).
enable_search: true
---
The `callout.html` component provides visually distinct blocks for important information, tips, warnings, and error messages.

{% include comps/heading.html tag="h2" text="Live Example" icon="alert-circle" size=20 %}

{% include comps/callout.html type="note" title="Information" content="This is a standard informational callout." %}
{% include comps/callout.html type="tip" title="Pro Tip" content="You can use liquid and markdown inside the content." %}
{% include comps/callout.html type="warning" title="Warning" content="Proceed with caution when modifying system files." %}
{% include comps/callout.html type="danger" title="Critical Error" content="Deployment failed due to missing environment variables." %}

{% capture call_code %}
{% raw %}
```liquid
{% include comps/callout.html type="note" title="Note" content="..." %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=call_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | String | `note` | `note`, `tip`, `warning`, `danger`. |
| `title` | String | | The bold title at the top of the callout. |
| `content` | String | | The body content (Markdown/Liquid supported). |
