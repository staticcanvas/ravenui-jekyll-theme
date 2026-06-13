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
1. Saves the response status to `localStorage` under the key `zd_feedback_<page_path>` to ensure they only submit feedback once per page (and hides the widget on subsequent page loads).
2. Attempts to push a custom event to **Google Analytics** (supports both newer `gtag` and legacy `ga` tracking libraries) to log engagement statistics:
   * **Event Name:** `feedback`
   * **Event Category:** `Documentation`
   * **Event Label:** `<page_path>`
   * **Value:** `1` (for Yes) or `0` (for No)

---

{% include comps/heading.html tag="h2" text="Site-Wide Configuration" icon="settings" size=20 %}

To enable the feedback widget globally at the bottom of every page layout, configure it in your `_config.yml`:

```yaml
zd_feedback:
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
