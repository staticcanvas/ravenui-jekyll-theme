---
layout: default
title: Page Converter Component
output-title: true
tags: [ui, interactive, utility, export]
description: A converter component that allows downloading pages as Markdown, HTML, or saving them as PDF.
enable_search: true
---

The `converter.html` component renders an interactive dropdown menu, allowing users to export page content into alternative formats.

🔹 **Key Features:**
* **Download Markdown:** Reconstructs the raw repository URL for the active page based on `page.path` and repository settings, linking directly to the raw `.md` source file.
* **Download HTML:** Dynamically extracts the target content section (e.g. `.rd-post-content`), wraps it in a clean stylesheet, and initiates a local `.html` file download.
* **Print / PDF:** Triggers the browser's native print interface. The theme's print stylesheet ensures clean page pagination without sidebar, header, or footer chrome.

---

{% include comps/heading.html tag="h2" text="Live Example" icon="download" size=20 %}

{% include comps/converter.html id="demo-conv" %}

---

{% include comps/heading.html tag="h2" text="Usage" icon="settings" size=20 %}

Include the component on any documentation page or inside layouts:

```liquid
{% include comps/converter.html %}
```

If you are using a custom container layout and want to limit the HTML export scope to a specific CSS class, pass the `target` selector:

```liquid
{% include comps/converter.html target=".my-custom-content-area" %}
```

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `target` | String | `.rd-post-content` | The CSS selector of the element whose inner HTML will be exported. |
| `id` | String | `default` | Unique ID suffix for the dropdown container. |
