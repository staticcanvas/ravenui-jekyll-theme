---
layout: default
title: Progress / Steps Bar
output-title: true
tags: [ui, navigation, progress]
description: A step progress bar component for multi-part tutorials or onboarding checklists.
enable_search: true
---
The `steps.html` component provides a visual, responsive step progress indicator designed for onboarding flows, tutorial series, or multi-step configuration procedures. It automatically formats active, complete, and upcoming states.

{% include comps/heading.html tag="h2" text="Live Example" icon="activity" size=20 %}

{% include comps/steps.html data_source="onboarding" current=2 %}

{% capture steps_eg %}
{% raw %}
```liquid
<!-- Step Bar from data file, active on Step 2 -->
{% include comps/steps.html data_source="onboarding" current=2 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=steps_eg %}

---

{% include comps/heading.html tag="h2" text="Data Format" icon="file-text" size=20 %}

Structure your step items as a list of YAML objects, either in a page's front-matter or in a global site data file (e.g., `_data/onboarding.yml`):

```yaml
- title: "Repository Setup"
  description: "Clone the theme repository and run bundle install."
- title: "Configuration"
  description: "Expose key settings and details inside _config.yml."
- title: "Deployment"
  description: "Publish your static site to GitLab Pages or Cloudflare."
```

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **steps.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `data_source` | String | | The filename (without extension) under `_data/` containing the step list objects (e.g. `onboarding`). |
| `items` | Array | | Direct array of step items (alternative to `data_source`). |
| `current` | Number | `0` | The current active step index (1-indexed). Steps before this are marked complete; steps after this are upcoming. |
| `class` | String | | Optional custom CSS class. |

### **Step Item Properties**

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | | The title of the step. |
| `description` | String | | Optional description explaining the step action. |
| `status` | String | `upcoming` | The manual status overrides: `complete`, `active`, or `upcoming` (only used if `current` index is not passed). |
