---
layout: default
title: Advanced Installation
permalink: /installation/advanced/
description: In-depth guide for building Zero-Dark from source and customizing the workspace folder layout.
---

Zero-Dark offers flexibility for advanced workflows, including custom directory structures, building directly from the source repository, or using the theme's default doc site structure as a standalone template.

{% include comps/heading.html tag="h2" text="Building from Source" icon="package" size=20 %}

Building the theme gem locally is useful when you want to customize core layouts, SASS assets, or include directories before publication.

🟦 **Steps to Build & Install Locally:**

1. **Clone the repository:**
   ```bash
   git clone https://gitlab.com/staticcanvas/zero-dark.git
   cd zero-dark
   ```

2. **Install development gems:**
   ```bash
   bundle install
   ```

3. **Build the Gem package:**
   Use the gemspec file to package the theme assets:
   ```bash
   gem build zero-dark.gemspec
   ```

4. **Install the compiled gem:**
   ```bash
   gem install ./zero-dark-*.gem
   ```

5. **Reference the local gem in your project's Gemfile:**
   ```ruby
   gem "zero-dark", path: "/path/to/cloned/zero-dark"
   ```

---

{% include comps/heading.html tag="h2" text="Using the Repo as a Template" icon="layout" size=20 %}

If you prefer not to manage Zero-Dark as an external Gem dependency, you can clone the repository and build your site directly inside it by replacing the contents of the `docs/` folder.

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
