---
layout: default
title: Dynamic Feedback Widget
output-title: true
tags: [ui, interactive, analytics, utilities]
description: A feedback widget to collect page helpfulness scores, integrated with Google Analytics and localStorage.
enable_search: true
---
The `feedback.html` component provides a subtle, conversion-optimized widget for collecting user feedback on whether a documentation page was helpful. By default, it is included globally above the footer, but it can also be manually integrated into any layout or page.

{% include comps/heading.html tag="h2" text="Live Example" icon="message-square" size=20 %}

{% include comps/feedback.html question="Was this page documentation clear?" yes_label="Yes, clear!" no_label="No, confusing" thank_you="Thanks! We appreciate your feedback." %}

{% capture feedback_eg %}
{% raw %}
```liquid
{% include comps/feedback.html 
   question="Was this page documentation clear?" 
   yes_label="Yes, clear!" 
   no_label="No, confusing" 
   thank_you="Thanks! We appreciate your feedback." %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=feedback_eg %}

---

{% include comps/heading.html tag="h2" text="Analytics Integration" icon="activity" size=20 %}

When a user submits feedback, the widget automatically:
1. Saves the response status to `localStorage` under the key `rd_feedback_<page_path>` to ensure they only submit feedback once per page (and hides the widget on subsequent page loads).
2. Dispatches a capture event to the active tracking provider configured in `_config.yml`:
   * **PostHog:** Captures a `page_feedback` event with the properties `{ url: <page_path>, helpful: true/false }`.
   * **Google Analytics:** Pushes a custom `feedback` event with Category `Documentation`, Label `<page_path>`, and Value `1` (Yes) or `0` (No).
   * **Umami:** Tracks a `page_feedback` event with details `{ url: <page_path>, helpful: "yes"/"no" }`.
   * **Plausible:** Tracks a `Page Feedback` event with props `{ url: <page_path>, helpful: "yes"/"no" }`.

---

{% include comps/heading.html tag="h2" text="Analytics Configuration" icon="sliders" size=20 %}

Configure your preferred analytics platform in `_config.yml` under the `theme_settings.analytics` block:

```yaml
theme_settings:
  analytics:
    provider: posthog            # Options: posthog, google_analytics, umami, plausible, none
    enable_in_dev: false         # Set to true to track during local jekyll development
    posthog:
      api_key: "phc_your_posthog_key"
      host: "https://us.i.posthog.com" # Or your self-hosted instance URL
    google_analytics:
      id: "G-XXXXXXXXXX"
    umami:
      website_id: "your-website-id"
      src: "https://cloud.umami.is/script.js"
    plausible:
      domain: "yourdomain.com"
      src: "https://plausible.io/js/script.js"
```

---

{% include comps/heading.html tag="h2" text="Site-Wide Configuration" icon="settings" size=20 %}

To enable the feedback widget globally at the bottom of every page layout, configure it in your `_config.yml`:

```yaml
rd_feedback:
  enabled: true
  question: "Was this page helpful?"
  yes_label: "Yes"
  no_label: "No"
  thank_you: "Thank you for your feedback!"
```

To disable the widget on specific pages, add `feedback: false` to that page's YAML front-matter.

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **feedback.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `question` | String | `Was this page helpful?` | The prompt question displayed to users. |
| `yes_label` | String | `Yes` | Text inside the thumbs-up button. |
| `no_label` | String | `No` | Text inside the thumbs-down button. |
| `thank_you` | String | `Thank you for your feedback!` | Message shown after user registers their click. |
| `class` | String | | Optional custom CSS class. |
