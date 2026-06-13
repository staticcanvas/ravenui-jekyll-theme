---
layout: default
title: Installation
parent: /
description: Instructions for installing and configuring the Zero-Dark theme.
---

Zero-Dark is designed for rapid deployment with minimal configuration. Follow these steps to integrate the theme into your Jekyll project.

{% include comps/heading.html tag="h2" text="1. Add to Gemfile" icon="package" size=20 %}

Include the following line in your site's `Gemfile` to reference the theme:

{% capture gemfile_code %}
```ruby
gem "zero-dark-sp"
```
{% endcapture %}
{% include comps/example-code.html content=gemfile_code %}

{% include comps/heading.html tag="h2" text="2. Configure _config.yml" icon="settings" size=20 %}

Specify the theme in your `_config.yml` file. This tells Jekyll to use Zero-Dark as the layout engine.

{% capture config_code %}
```yaml
theme: zero-dark-sp
```
{% endcapture %}
{% include comps/example-code.html content=config_code %}

{% include comps/heading.html tag="h2" text="3. Install Dependencies" icon="download" size=20 %}

Run the following command in your terminal to sync the gems:

```bash
bundle install
```

{% include comps/heading.html tag="h2" text="4. Local Development" icon="terminal" size=20 %}

To view your site locally and test your documentation, use the standard Jekyll serve command:

```bash
bundle exec jekyll serve
```

---

{% include comps/heading.html tag="h2" text="Post-Installation" icon="check-circle" size=20 %}

Once installed, we recommend visiting the [Configuration](/configuration/) guide to set up your site title, logo, and social links.

For advanced setups, custom layout configurations, or building from source, see our [Advanced Installation](/installation/advanced/) guide.
