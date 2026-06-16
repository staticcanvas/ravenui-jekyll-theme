---
layout: default
title: Installation
parent: /
description: Instructions for installing and configuring the RavenUI theme.
enable_search: true
---

RavenUI supports three primary installation and distribution models depending on your hosting provider, level of customization, and deployment workflows:

1. **Gem-Based Theme (Recommended):** Best for local builds, GitLab Pages, Cloudflare Pages, Netlify, or custom CI pipelines.
2. **Remote Theme:** Best for GitHub Pages without custom build workflows (uses version-locked remote repositories).
3. **Forking / Direct Copying:** Best for developers who want to modify core layouts, scripts, and SASS components directly.

---

{% include comps/heading.html tag="h2" text="Model 1: Gem-Based Theme" icon="package" size=20 %}

This is the standard Jekyll installation path. The theme is packaged as a Ruby gem and inherited dynamically.

### **1. Add to Gemfile**
Add the following line to your site's `Gemfile` to declare the dependency:
{% raw %}
```ruby
gem "jekyll-theme-ravenui"
```
{% endraw %}

### **2. Configure _config.yml**
Specify the theme in your global configuration file:
{% raw %}
```yaml
theme: jekyll-theme-ravenui
```
{% endraw %}

### **3. Install Gems**
Run the following command in your terminal to fetch and compile the theme:
```bash
bundle install
```

---

{% include comps/heading.html tag="h2" text="Model 2: Remote Theme (GitHub Pages)" icon="globe" size=20 %}

GitHub Pages restricts third-party gems for security reasons. To use RavenUI on GitHub Pages without a custom CI build runner, you must use the `jekyll-remote-theme` plugin.

### **1. Add Remote Theme Plugin**
In your `Gemfile`, ensure the `jekyll-remote-theme` gem is included:
{% raw %}
```ruby
gem "jekyll-remote-theme"
```
{% endraw %}

### **2. Configure plugins and remote_theme**
In your `_config.yml`, add the plugin and configure the remote repository path with a version locking tag:
{% raw %}
```yaml
plugins:
  - jekyll-remote-theme

remote_theme: staticcanvas/zero-dark-jekyll-theme@v1.17.1
```
{% endraw %}

### **3. Fetch Dependencies**
Sync your local bundles:
```bash
bundle install
```

---

{% include comps/heading.html tag="h2" text="Model 3: Forking or Direct Copying" icon="git-branch" size=20 %}

If you need to make deep, custom changes to core layout structures (`_layouts/`), styling elements (`_sass/`), or includes (`_includes/`), you can fork or copy the source files directly.

### **1. Clone or Fork the Repository**
Clone the source repository into a local folder:
```bash
git clone https://gitlab.com/staticcanvas/ravenui-jekyll-theme.git
```

### **2. Copy Files to Your Site**
Copy the directory structure (`_layouts/`, `_includes/`, `_sass/`, `assets/`) directly into your site's root directory. This bypasses gem inheritance completely; Jekyll will prioritize your local files during compilation.

---

{% include comps/heading.html tag="h2" text="Local Verification" icon="play" size=20 %}

To run your site locally and verify the installation:
```bash
bundle exec jekyll serve
```
The site will compile and be viewable at `http://localhost:4000/`.
