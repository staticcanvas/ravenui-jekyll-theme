---
layout: default
title: API Reference
output-title: true
tags: [ui, documentation, api]
description: A high-density component for documenting code structures, functions, and parameters.
---

The `api-ref.html` component provides a structured, visually distinct block for documenting API methods, configuration variables, or function signatures.

{% include comps/heading.html tag="h2" text="Live Example" icon="code" size=20 %}

{% capture api_params %}
<li>
    <code>name</code>
    <span class="zd-api-param-type">String</span>
    <span class="zd-api-param-desc">The identifier for the API block.</span>
</li>
<li>
    <code>badge</code>
    <span class="zd-api-param-type">String</span>
    <span class="zd-api-param-desc">Optional version or status badge.</span>
</li>
{% endcapture %}

{% include comps/api-ref.html 
    name="api-ref.html" 
    badge="v1.0" 
    signature="include comps/api-ref.html name='...'"
    description="Render a structured API documentation block."
    params=api_params
    returns="A styled HTML fragment."
    example="Check the live examples in this documentation."
%}

{% capture api_code %}
{% raw %}
```liquid
{% capture my_params %}
<li><code>id</code> ...</li>
{% endcapture %}

{% include comps/api-ref.html 
    name="MyFunction" 
    params=my_params 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=api_code %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="sliders" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | | The title of the API block. |
| `badge` | String | | Optional status/version label. |
| `signature` | String | | Code snippet for the usage signature. |
| `description` | String | | Markdown-supported description. |
| `params` | String | | HTML list items for parameters. |
| `returns` | String | | Markdown-supported return description. |
| `example` | String | | Markdown-supported usage example. |
