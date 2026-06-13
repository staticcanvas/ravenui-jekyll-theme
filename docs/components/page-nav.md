---
layout: default
title: Page Navigation
output-title: true
tags: [ui, navigation]
description: Footer navigation links for 'Back to Top' and 'Next Page' functionality.
enable_search: true
---
The `page-nav.html` component provides standard footer controls for moving between pages and returning to the top of the current page.

{% include comps/heading.html tag="h2" text="Live Example" icon="navigation" size=20 %}

{% include comps/page-nav.html %}

{% capture pn_code %}
{% raw %}
```liquid
{% include comps/page-nav.html %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=pn_code %}

---

{% include comps/heading.html tag="h2" text="How it Works" icon="help-circle" size=20 %}

1. **Next Page:** The component iterates through `site.data.navigation` to find the current page's position and identifies the subsequent link.
2. **Back to Top:** Provides a quick scroll-to-top button. This can be disabled globally via `_config.yml`:
   ```yaml
   theme_settings:
     back_to_top: false
   ```

---

{% include comps/callout.html type="info" title="Automatic Integration" content="This component is automatically included in the `default.html` layout. You rarely need to include it manually." %}
