---
layout: default
title: Announcement Banner
output-title: true
tags: [ui, interactive, layout, alerts]
description: A responsive, dismissible full-width viewport alert/announcement banner component for site-wide or page-specific notifications.
---

The `announcement.html` component provides a prominent, customizable alert banner that sits at the top of the viewport. It supports built-in localStorage tracking to persist dismissal, custom actions, icon overlays, and multiple theme-specific visual variants.

{% include comps/heading.html tag="h2" text="Live Examples" icon="megaphone" size=20 %}

{% include comps/announcement.html id="example-info" text="This is a standard informational announcement banner!" type="info" dismissible=false %}
<br>
{% include comps/announcement.html id="example-warning" text="Warning: System maintenance scheduled for this weekend." type="warning" dismissible=false %}
<br>
{% include comps/announcement.html id="example-success" text="Success: Zero-Dark v1.3.4 has been released!" type="success" link="/components/" link_text="Explore Components" dismissible=false %}

{% capture banner_eg %}
{% raw %}
```liquid
<!-- Informational Banner -->
{% include comps/announcement.html id="info-banner" text="This is a standard informational announcement banner!" type="info" %}

<!-- Warning Alert -->
{% include comps/announcement.html id="maint-banner" text="System maintenance scheduled for this weekend." type="warning" %}

<!-- Success Announcement with Action Link -->
{% include comps/announcement.html id="release-banner" text="Zero-Dark v1.3.4 has been released!" type="success" link="/components/" link_text="Explore Components" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=banner_eg %}

---

{% include comps/heading.html tag="h2" text="Site-Wide Configuration" icon="settings" size=20 %}

To enable a permanent, site-wide banner that displays across all pages, configure the `zd_announcement` block in your `_config.yml`:

```yaml
zd_announcement:
  enabled: true
  id: "welcome-banner-v1"
  text: "Welcome to Zero-Dark! Check out the new Extended Components."
  icon: "megaphone"
  color: "var(--zd-clr-viridian)"
  link: "/components/kbd/"
  link_text: "View Docs"
  dismissible: true
  type: "success"
```

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

### **announcement.html Parameters**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `id` | String | `zd-announcement-banner` | Unique ID for tracking dismissal state in `localStorage`. |
| `text` | String | | The alert message or text content to display. |
| `icon` | String | `megaphone` | Lucide icon name to display beside the text. |
| `color` | String | | Optional custom CSS color (hex, rgb, var) for the left border/accent highlight. |
| `link` | String | | Optional action URL target. |
| `link_text` | String | | Optional text for the action link button. |
| `dismissible` | Boolean | `true` | Enables or disables the dismiss close button. |
| `type` | String | `info` | Predefined variant styling (`info`, `warning`, `danger`, `success`). |
