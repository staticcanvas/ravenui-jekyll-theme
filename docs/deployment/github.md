---
layout: default
title: GitHub Deployment
output-title: true
tags: [deployment, git, github]
description: Guide for deploying Zero-Dark to GitHub Pages with Cloudflare integration.
---

Deploying Zero-Dark to GitHub Pages is straightforward and highly efficient.

{% include comps/heading.html tag="h2" text="Quick Start" icon="rocket" size=20 %}

1.  **Repository Setup:** Ensure your project is in a GitHub repository.
2.  **GitHub Actions:** Create a `.github/workflows/jekyll.yml` file.
3.  **Configure `_config.yml`:** Set your `url` and `baseurl`.

{% include comps/heading.html tag="h2" text="Cloudflare Integration" icon="cloud" size=20 %}

If you are using Cloudflare for your domain, you can set up CNAME records pointing to your `.github.io` address.

{% include comps/callout.html type="info" title="Pro Tip" content="Enable Cloudflare's Proxied mode for improved security and performance." %}
