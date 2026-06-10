# ZeroDark SP

A professional, high-contrast Jekyll theme optimized for technical documentation and long-form readability.

---

## **Key Features**

* **Readability Optimized**: High-contrast typography and dark-mode first design.
* **Responsive Layout**: A stable sidebar navigation system with fluid content scaling.
* **Mobile-Ready**: Sticky header and collapsible navigation for smaller viewports.
* **Documentation Focused**: Built-in support for callouts, badges, syntax highlighting, text gradients, Mermaid.js diagrams, and LaTeX math expressions.

---

## **Quick Start & Local Development**

To run and build the documentation site locally, follow these steps:

### **1. Sync Dependencies**
Ensure you have Ruby installed, then run the sync script to install Bundler and local gems:
```bash
./bundle.sh
```

### **2. Launch Local Dev Server**
Run the development server with live-reloading:
```bash
./dev-serve.sh
```
The site will be available at `http://localhost:4000/`.

### **3. Build for Production**
To generate the static HTML files:
```bash
bundle exec jekyll build
```

---

## **Documentation**

The bulk of the documentation, including the complete Component Library, API Reference, custom styling rules, and layout options, is located in the `docs` folder.

To view the documentation, you can run the docs site locally:
```bash
cd docs
bundle install
bundle exec jekyll serve
```
Once deployed, the master documentation is hosted via GitLab Pages.

---

## **Alternative Downloads (ZIP Asset)**

If you do not wish to use the Ruby Gem or clone the repository, pre-packaged releases are available as direct ZIP downloads. 

You can download `zero-dark-sp-v[VERSION].zip` directly from the **GitLab Release page** for your chosen version and extract it to use it as a standalone template.

---

## **License**

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
