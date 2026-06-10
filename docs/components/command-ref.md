---
layout: default
title: Command Reference
output-title: true
tags: [ui, documentation, CLI]
description: A high-density component for documenting CLI commands, task options, and parameters.
---

The `command-ref.html` component provides a structured, visually distinct block for documenting CLI commands, arguments, option flags, or task variables.

## **Live Example**

{% capture cmd_params %}
<li>
    <code>--force</code>
    <span class="zd-api-param-type">Boolean</span>
    <span class="zd-api-param-desc">Overwrite existing files without prompting.</span>
</li>
<li>
    <code>--env</code>
    <span class="zd-api-param-type">String</span>
    <span class="zd-api-param-desc">Deployment target environment (development, production).</span>
</li>
{% endcapture %}

{% include comps/command-ref.html 
    name="zero-dark build" 
    badge="v1.0" 
    signature="zero-dark build [options]"
    description="Compile code bases and optimize site assets."
    params=cmd_params
    returns="Exits with code 0 on success, or non-zero on compilation failure."
    example="zero-dark build --env production --force"
%}

{% capture cmd_code %}
{% raw %}
```liquid
{% capture cmd_params %}
<li>
    <code>--force</code>
    <span class="zd-api-param-type">Boolean</span>
    <span class="zd-api-param-desc">Overwrite files.</span>
</li>
{% endcapture %}

{% include comps/command-ref.html 
    name="zero-dark build" 
    signature="zero-dark build [options]"
    params=cmd_params 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=cmd_code %}

---

## **API Reference**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `name` | String | | The name of the command or CLI task. |
| `badge` | String | | Optional status/version label. |
| `signature` | String | | Code snippet showing command usage. |
| `description` | String | | Markdown-supported description of the command. |
| `params` | String | | HTML list items for parameters. |
| `returns` | String | | Markdown-supported description of the return value or side-effects. |
| `example` | String | | Markdown-supported usage example. |
