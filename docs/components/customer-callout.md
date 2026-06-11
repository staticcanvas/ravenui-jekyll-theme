---
layout: default
title: Customer Callout (Testimonial)
output-title: true
tags: [ui, elements, interactive, callout]
description: Elegant testimonial and review cards with star ratings and avatar support.
---

The `customer-callout.html` component renders testimonial cards for customers, users, or reviewers. It features custom borders, optional star ratings, and author avatar support.

## **Live Example**

{% include comps/customer-callout.html 
   quote="ZeroDark has completely transformed our developer documentation. The speed and visual aesthetics are absolutely first class." 
   author="Alex Rivers" 
   role="CTO, CloudScale Systems" 
   avatar="/favicon.svg" 
   rating=5 
   color="#00ff9d" %}

{% capture cc_eg %}
{% raw %}
```liquid
{% include comps/customer-callout.html 
   quote="ZeroDark has completely transformed our developer documentation." 
   author="Alex Rivers" 
   role="CTO, CloudScale Systems" 
   avatar="/favicon.svg" 
   rating=5 
   color="#00ff9d" %}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=cc_eg %}

---

## **API Reference**

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `quote` | String | | The quote text or body of the testimonial. |
| `author` | String | | The name of the person giving the testimonial. |
| `role` | String | | The job title, company, or credentials of the author. |
| `avatar` | String | | URL or path to the author's avatar picture. |
| `rating` | Integer | `0` | Star rating out of 5 (values `1` to `5`). Displays stars above the quote. |
| `color` | String | `var(--zd-clr-highlight)` | Accent color used for the left border and filled stars. |
| `class` | String | | Optional CSS class to append to the container. |
