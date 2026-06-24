---
layout: default
title: Custom Component Tags
output-title: true
tags: [liquid, plugins, dx]
description: Write cleaner Liquid templates using RavenUI's custom block and inline component tags.
enable_search: true
---

RavenUI introduces custom Liquid tags as a high-performance, developer-friendly alternative to standard `{% raw %}{% include %}{% endraw %}` tags. These tags allow you to import theme components with a shorter syntax and support block captures for passing multiline HTML/Markdown content directly into components.

---

{% include comps/heading.html tag="h2" text="Inline Component Tag (rdi)" icon="code" size=20 %}

The `{% raw %}{% rdi %}{% endraw %}` tag renders a component in a single inline statement. It matches the behavior of standard `{% raw %}{% include %}{% endraw %}` but is cleaner and faster to write.

### **Syntax**
{% raw %}
```liquid
{% rdi [component_name] [key]=[value] [key2]=[value2] %}
```
{% endraw %}
Or specify the component type/name explicitly:
{% raw %}
```liquid
{% rdi component="[component_name]" [key]=[value] %}
```
{% endraw %}

### **Examples**
* 🔹 **Short Syntax:**
  {% raw %}
  ```liquid
  {% rdi badge text="Beta" type="warning" %}
  ```
  {% endraw %}
* 🔹 **Explicit Syntax:**
  {% raw %}
  ```liquid
  {% rdi component="badge" text="Beta" type="warning" %}
  ```
  {% endraw %}

---

{% include comps/heading.html tag="h2" text="Block Component Tag (rd)" icon="box" size=20 %}

The `{% raw %}{% rd %}{% endraw %}` tag is a block-level tag that captures any content inside it (including Markdown and HTML) and forwards it to the component as `include.content`. This eliminates the need for nesting verbose `{% raw %}{% capture %}{% endraw %}` statements.

### **Syntax**
{% raw %}
```liquid
{% rd [component_name] [key]=[value] %}
Captured content here.
{% endrd %}
```
{% endraw %}

### **Examples**
* 🔹 **Short Block Syntax:**
  {% raw %}
  ```liquid
  {% rd callout type="note" title="System Status" %}
  This is the body of the callout. It can contain **markdown** or HTML lists.
  {% endrd %}
  ```
  {% endraw %}
* 🔹 **Explicit Block Syntax:**
  {% raw %}
  ```liquid
  {% rd component="callout" type="note" title="System Status" %}
  This is the body of the callout.
  {% endrd %}
  ```
  {% endraw %}

---

{% include comps/heading.html tag="h2" text="Path & Asset Resolution Tags (rd_url & rd_asset)" icon="link" size=20 %}

To simplify pathing across varying subdirectories and base URLs, RavenUI provides two custom inline tags for automatic URL resolution:

* 🔹 `{% raw %}{% rd_url [path] %}{% endraw %}`: Resolves page paths relative to the site's configured `baseurl`.
* 🔹 `{% raw %}{% rd_asset [path] %}{% endraw %}`: Resolves asset paths relative to `baseurl`, automatically prepending `/assets/` if missing.

Both tags support quoted string literals (e.g. `"css/main.css"`) and dynamic Liquid variables (e.g. `page.url`).

### **Syntax & Examples**

* 🔹 **Resolving Page URL (literal string):**
  {% raw %}
  ```liquid
  <a href="{% rd_url "installation" %}">Installation</a>
  <!-- Outputs: /installation (or /baseurl/installation) -->
  ```
  {% endraw %}

* 🔹 **Resolving Asset Path (literal string):**
  {% raw %}
  ```liquid
  <link rel="stylesheet" href="{% rd_asset "css/main.css" %}">
  <!-- Outputs: /assets/css/main.css (or /baseurl/assets/css/main.css) -->
  ```
  {% endraw %}

* 🔹 **Resolving Context Variables:**
  {% raw %}
  ```liquid
  {% assign my_page_url = "/components/icon" %}
  <a href="{% rd_url my_page_url %}">Icon Component</a>
  <!-- Outputs: /components/icon -->

  {% assign logo_path = "logo.svg" %}
  <img src="{% rd_asset logo_path %}">
  <!-- Outputs: /assets/logo.svg -->
  ```
  {% endraw %}

---

{% include comps/heading.html tag="h2" text="Context Resolution" icon="database" size=20 %}

Custom tags resolve argument values dynamically. If a value is wrapped in quotes, it is parsed as a literal string. If it is unquoted, it will resolve to the value of that variable in the current Liquid context:

```yaml
# Front-matter
my_title: "System Update"
my_type: "success"
```

{% raw %}
```liquid
# In template
{% rdi badge text=page.my_title type=page.my_type %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="Benefits over standard Includes" icon="zap" size=20 %}

* 🔹 **Shorter Code:** Avoid prefixing paths (e.g. `comps/card.html`). The engine auto-discovers components in `comps/`, `core/`, and root `_includes/` directories.
* 🔹 **No Verbose Captures:** Passes block-level content natively as `include.content` instead of requiring explicit capture blocks.
* 🔹 **Aesthetic Syntax:** High-density coding layout that matches modern template engines.
