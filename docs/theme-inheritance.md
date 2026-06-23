---
layout: default
title: Theme Inheritance & Child Themes
output-title: true
tags: [inheritance, advanced, customization, child-themes]
description: Architectural guide on building custom child themes and overriding RavenUI files cleanly and maintainably.
permalink: /theme-inheritance/
enable_search: true
---

RavenUI is engineered as a component-heavy theme framework, making it highly suitable to serve as a base layout engine for custom child themes. By leveraging Jekyll's native theme inheritance model, you can override layouts, includes, styles, and assets without modifying the core theme files.

---

{% include comps/heading.html tag="h2" text="How Jekyll Theme Inheritance Works" icon="layers" size=20 %}

When a site uses RavenUI (via `theme: jekyll-theme-ravenui` or `remote_theme: staticcanvas/zero-dark-jekyll-theme`), Jekyll looks for files in a strict priority order:

1. 🔹 **Site Directory (Highest Priority):** Files in your local repository.
2. 🔹 **Theme Gem / Repository (Fallback):** Files provided by RavenUI.

To customize any part of the theme, place a file with the **exact same relative path** in your local site directory. For example:
* To override the footer layout, create `_includes/core/footer.html` in your site.
* To override the default page skeleton, create `_layouts/default.html` in your site.

---

{% include comps/heading.html tag="h2" text="SASS and Styling Overrides" icon="palette" size=20 %}

To customize styling maintainably, your child theme should declare SASS overrides **before** importing the theme router.

### **Recommended Stylesheet Layout**

In your local `assets/css/main.scss`:

```scss
---
---
// 1. Declare overrides for variables (defined with !default in the theme)
$rd-clr-highlight: #ff007f;           // Change highlight/accent color
$rd-font-sans:     "Inter", sans-serif; // Swap main font stack

// 2. Import the theme (which resolves variables and loads all components)
@import "ravenui-sp";

// 3. Add custom child-theme classes or overrides
.my-custom-element {
  border: 1px solid var(--rd-border-color);
}
```

---

{% include comps/heading.html tag="h2" text="Crucial Caveats & QOL Workarounds" icon="alert-triangle" size=20 %}

When inheriting from a theme in Jekyll, there are several strict architectural constraints to keep in mind:

### **1. Data Files do not Merge**
Jekyll's `_data/` directory **does not support deep merging**. If you create a local `_data/navigation.yml` in your child theme, it will completely overwrite the theme's navigation data, rather than merging with it. 
> [!TIP]
> **Workaround:** If you only need to add custom links, duplicate the structure of the theme's `navigation.yml` into your local directory and append your child-theme links manually.

### **2. Plugin Safety & GitHub Pages Safe Mode**
If you host your child theme on GitHub Pages using standard builds, GitHub forces **Safe Mode** (`site.safe: true`), which disables custom Ruby plugins (including our custom path tags and hooks).
> [!IMPORTANT]
> **Workaround:** Build your Jekyll site using **GitHub Actions**, **GitLab CI/CD**, or deploy to **Netlify** / **Cloudflare Pages**. This compiles the site with custom plugins enabled before pushing the static HTML to hosting buckets.

### **3. Subdirectory Hosting and Paths**
If your child theme is hosted under a subdirectory (e.g. `https://domain.com/child-theme/`), hardcoded paths in overridden layouts like `/assets/css/main.css` will fail.
* Always wrap paths in the `relative_url` filter: `{{ "/assets/css/main.css" | relative_url }}`
* Or use RavenUI's path tags: `{% rd_asset "css/main.css" %}` or `{% rd_url "installation" %}`.

---

{% include comps/heading.html tag="h2" text="Best Practices for Child Themes" icon="check-circle" size=20 %}

* 🔹 **Never edit the core gem files:** Keep all overrides in your local project folder. This makes updating the parent theme version as simple as bumping the Gem version in your `Gemfile`.
* 🔹 **Use custom variables:** Instead of overriding CSS properties directly in classes (which can break when layout classes change), override the CSS variables (`--rd-bg-base`, `--rd-clr-highlight`, etc.) at the `:root` level.
* 🔹 **Leverage the components:** If you need custom layouts, create them by compiling existing theme includes (e.g., `{% include comps/sidebar.html %}`) rather than duplicating the structural HTML.
