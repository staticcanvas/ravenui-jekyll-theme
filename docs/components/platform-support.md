---
layout: default
title: Platform Support
output-title: true
tags: [ui, components, compatibility]
description: Displays deployment compatibility matrix badges for popular hosting platforms.
enable_search: true
---
The `platform-support.html` component provides a unified display indicating where a feature, plugin, or layout is supported across popular hosting environments (GitHub Pages, GitLab Pages, Netlify, Cloudflare Pages, and Vercel).

{% include comps/heading.html tag="h2" text="Live Example" icon="globe" size=20 %}

{% include comps/platform-support.html 
    github="supported" 
    gitlab="supported" 
    netlify="partial" 
    cloudflare="unsupported" 
    vercel="supported" 
%}

{% capture platform_code %}
{% raw %}
```liquid
{% include comps/platform-support.html 
    github="supported" 
    gitlab="supported" 
    netlify="partial" 
    cloudflare="unsupported" 
    vercel="supported" 
%}
```
{% endraw %}
{% endcapture %}
{% include comps/example-code.html content=platform_code %}

---

{% include comps/heading.html tag="h2" text="Data-Driven Usage" icon="database" size=20 %}

You can also pass a structured configuration block directly (for example, from page front matter metadata):

```yaml
# Front-matter
platforms:
  github: supported
  gitlab: supported
  netlify: partial
  cloudflare: unsupported
  vercel: supported
```

{% raw %}
```liquid
{% include comps/platform-support.html platforms=page.platforms %}
```
{% endraw %}

---

{% include comps/heading.html tag="h2" text="API Reference" icon="code" size=20 %}

| Parameter | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `platforms` | Object | | Key-value object mapping platform names to status. |
| `github` | String | `supported` | Status for GitHub Pages: `supported`, `partial`, `unsupported`. |
| `gitlab` | String | `supported` | Status for GitLab Pages: `supported`, `partial`, `unsupported`. |
| `netlify` | String | `supported` | Status for Netlify: `supported`, `partial`, `unsupported`. |
| `cloudflare` | String | `supported` | Status for Cloudflare Pages: `supported`, `partial`, `unsupported`. |
| `vercel` | String | `supported` | Status for Vercel: `supported`, `partial`, `unsupported`. |
| `class` | String | | Additional CSS classes for custom styling. |
