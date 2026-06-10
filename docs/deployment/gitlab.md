---
layout: default
title: GitLab Deployment
output-title: true
tags: [deployment, git, gitlab]
description: Guide for deploying ZeroDark SP to GitLab Pages with custom domain support.
---

ZeroDark SP is optimized for GitLab CI/CD and Pages.

{% include comps/heading.html tag="h2" text="CI/CD Configuration" icon="refresh-cw" size=20 %}

Use the provided `.gitlab-ci.yml` template to automate your builds.

{% include comps/heading.html tag="h2" text="Cloudflare via GitLab" icon="cloud" size=20 %}

Configure your Cloudflare DNS to point to GitLab's Pages servers using a CNAME or A record.

{% include comps/callout.html type="warn" title="Important" content="Ensure your GitLab project's visibility matches your desired deployment state." %}
