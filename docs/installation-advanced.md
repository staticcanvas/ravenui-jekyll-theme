---
layout: default
title: Advanced Installation
permalink: /installation/advanced/
description: In-depth guide for building RavenUI from source and customizing the workspace folder layout.
enable_search: true
---
RavenUI offers flexibility for advanced workflows, including custom directory structures, building directly from the source repository, or using the theme's default doc site structure as a standalone template.

{% include comps/heading.html tag="h2" text="Building from Source" icon="package" size=20 %}

Building the theme gem locally is useful when you want to customize core layouts, SASS assets, or include directories before publication.

🟦 **Steps to Build & Install Locally:**

1. **Clone the repository:**
   ```bash
   git clone https://gitlab.com/staticcanvas/ravenui-jekyll-theme.git
   cd ravenui-jekyll-theme
   ```

2. **Install development gems:**
   ```bash
   bundle install
   ```

3. **Build the Gem package:**
   Use the gemspec file to package the theme assets:
   ```bash
   gem build jekyll-theme-ravenui.gemspec
   ```

4. **Install the compiled gem:**
   ```bash
   gem install ./jekyll-theme-ravenui-*.gem
   ```

5. **Reference the local gem in your project's Gemfile:**
   ```ruby
   gem "jekyll-theme-ravenui", path: "/path/to/cloned/ravenui-jekyll-theme"
   ```

---

{% include comps/heading.html tag="h2" text="Using the Repo as a Template" icon="layout" size=20 %}

If you prefer not to manage RavenUI as an external Gem dependency, you can clone the repository and build your site directly inside it by replacing the contents of the `docs/` folder.

🟩 **Aesthetic & Structural Blueprint:**
* The root level contains theme assets, layouts (`_layouts/`), includes (`_includes/`), and styles (`_sass/`).
* The `docs/` subdirectory contains the documentation pages.
* You can remove pages under `docs/` and replace them with your own files while maintaining the root theme configuration.

---

{% include comps/heading.html tag="h2" text="Customizing Folder Structure" icon="folder-git" size=20 %}

Jekyll allows you to override the default locations of standard directories using configurations in your `_config.yml` file.

💠 **Custom Path Configuration:**

```yaml
# _config.yml
source:       .
destination:  ./_site
layouts_dir:  ./_layouts
includes_dir: ./_includes
sass:
  sass_dir:   ./_sass
```

By customizing these paths, you can organize your markdown documentation separately from your core layouts and style assets.

---

## **Platform Compatibility & Safe Mode**

RavenUI is compatible with GitHub Pages, GitLab Pages, and self-hosted static environments.

* **GitHub Pages Default Builder**:
  GitHub Pages builds sites in **Safe Mode** (`site.safe: true`), which disables custom Ruby plugins.
  Because RavenUI includes a custom `from_yaml` Ruby filter (used optionally by the `git-tags` and `releases` components to parse inline YAML strings), these inline configurations will fallback to a warning in Safe Mode.
  To deploy successfully on GitHub Pages default builder, ensure you load tag and release data using standard Jekyll data files (e.g., `_data/tags.yml` or `_data/releases.yml`) instead of inline captured YAML strings.
* **GitHub Actions / GitLab CI**:
  If you use GitHub Actions or GitLab CI/CD to build your Jekyll site before deploying, Safe Mode is disabled and custom plugins (including `from_yaml`) are fully supported.
