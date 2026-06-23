---
layout: default
title: Back to Top Button
output-title: true
tags: [navigation, layout, utility]
description: A floating scroll-to-top button that appears dynamically when scrolling down.
permalink: /components/back-to-top/
enable_search: true
---

The `back-to-top.html` component renders a floating action button at the bottom-right corner of the viewport. It appears dynamically when the user scrolls down and provides a smooth, animated scroll-to-top interaction.

---

## **Usage**

The component is integrated globally inside the core page layout skeleton, but can be manually included on any custom layout:

{% raw %}
```liquid
{% include comps/back-to-top.html %}
```
{% endraw %}

---

## **Customization**

You can customize the scroll trigger offset and scroll animation behavior by overriding variables inside your local `main.scss` or custom styles.
