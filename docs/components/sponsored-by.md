---
layout: default
title: Sponsored By Grid
output-title: true
tags: [ui, elements, display, grid]
description: A clean grid container for partner, sponsor, or customer logos.
---

The `sponsored-by.html` component renders a structured grid of sponsor or partner logos/names. It features subtle hover scaling and automatic grayscale filtering for cohesive brand integrations.

## **Live Example**

{% assign test_sponsors = "
- name: Acme Corp
  url: https://example.com
- name: Globex Corporation
  url: https://example.com
- name: Initech
  url: https://example.com
" | from_yaml %}

{% include comps/sponsored-by.html title="Our Valued Sponsors" items=test_sponsors columns=3 %}

{% capture sb_eg %}
{% raw %}
```liquid
{% assign sponsors = "
- name: Acme Corp
  url: https://example.com
- name: Globex Corporation
  url: https://example.com
- name: Initech
  url: https://example.com
" | from_yaml %}

{% include comps/sponsored-by.html 
   title="Our Valued Sponsors" 
   items=sponsors 
   columns=3 %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=sb_eg %}

---

## **API Reference**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | String | `"Sponsored By"` | Section heading text displayed above the logo grid. Set to `""` or `nil` to hide. |
| `items` | Array | `site.data.sponsors` | List of sponsor objects. Each object should have `name`, `url` (optional), and `logo` (optional path to image). |
| `columns` | Integer | `sponsors.size` | Number of columns in the grid layout (constrained between 2 and 6). |
| `class` | String | | Optional CSS class to append to the container. |
