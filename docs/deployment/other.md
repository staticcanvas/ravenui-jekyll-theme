---
layout: default
title: Other Platforms
output-title: true
tags: [deployment, web, azure, aws]
description: Guide for deploying RavenUI to AWS, Azure, Firebase, and more.
enable_search: true
---
RavenUI can be hosted on any platform that supports static files.

{% include comps/heading.html tag="h2" text="AWS S3 & CloudFront" icon="box" size=20 %}

Sync your `_site` folder to an S3 bucket and front it with CloudFront for global distribution.

{% include comps/heading.html tag="h2" text="Azure Static Web Apps" icon="microsoft" size=20 %}

Use the Azure Static Web Apps GitHub Action to automate your deployment.

{% include comps/heading.html tag="h2" text="Firebase Hosting" icon="flame" size=20 %}

Deploy via the Firebase CLI using `firebase deploy`.
