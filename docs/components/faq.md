---
layout: default
title: FAQ Accordion
output-title: true
tags: [ui, interactive, structures, details]
description: Collapsible question-and-answer panels for common guidelines.
---

The `faq.html` and `faq-item.html` components work together to build collapsible, animated question-and-answer groups.

{% include comps/heading.html tag="h2" text="Live Example" icon="help-circle" size=20 %}

{% capture faq_eg_run %}
{% include comps/faq-item.html question="How do I override theme variables?" answer="Create a file at _sass/custom-variables.scss and import it before zero-dark-sp in main.scss." %}
{% include comps/faq-item.html question="Is Mermaid.js loaded locally?" answer="No, Mermaid.js is loaded dynamically from the CDN only if you enable 'mermaid: true' on your page or site configuration." %}
{% endcapture %}

{% include comps/faq.html content=faq_eg_run %}

{% capture faq_eg %}
{% raw %}
```liquid
{% capture faq_content %}
    {% include comps/faq-item.html question="How do I override variables?" answer="Create a custom file..." %}
    {% include comps/faq-item.html question="Is Mermaid.js loaded?" answer="Yes, if enabled..." %}
{% endcapture %}

{% include comps/faq.html content=faq_content %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=faq_eg %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **faq.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `content` | String | | The captured list of `faq-item.html` templates. |
| `class` | String | | Optional CSS class for the container group. |

### **faq-item.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `question` | String | `Question?` | The text query displayed in the accordion header. |
| `answer` | String | | The response content (supports standard inline Markdown/HTML). |
| `content` | String | | Alternate parameter for response content if passed via block formats. |
| `class` | String | | Optional CSS class for the detail card. |
