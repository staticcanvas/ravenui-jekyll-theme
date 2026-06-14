---
layout: default
title: Cloudflare Deployment
output-title: true
tags: [deployment, cloud, cloudflare]
description: Deploying RavenUI directly to Cloudflare Pages for extreme performance.
enable_search: true
---
Cloudflare Pages provides a lightning-fast CDN and automated build pipeline for RavenUI.

{% include comps/heading.html tag="h2" text="Direct Integration" icon="zap" size=20 %}

Connect your GitHub or GitLab account and select your repository to begin.

{% include comps/heading.html tag="h2" text="Build Settings" icon="settings" size=20 %}

- **Framework:** Jekyll
- **Build Command:** `bundle exec jekyll build`
- **Output Directory:** `_site`
