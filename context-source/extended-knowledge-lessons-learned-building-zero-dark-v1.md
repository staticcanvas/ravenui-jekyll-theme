# **Zero-Dark - Extended Lessons Learned & Engineering Context (v1)**

This document serves as the canonical repository of technical knowledge, structural patterns, and architectural caveats identified during the design and optimization of the Zero-Dark Jekyll documentation theme.

---

## **1. Core Architectural Decisions**

### **1.1. Sidebar Navigation vs. Collection Filtering**
- **Decision:** Zero-Dark uses a dual-mode navigation structure. Standard documentation is manually curated via `_data/navigation.yml` for precise layout control. Advanced collections support is implemented behind a feature flag (`collections: false` by default).
- **Reasoning:** Manual curation ensures exact ordering and grouping of structured resources. However, it introduces duplicate maintenance (pages must be created *and* registered). Integrating collection support under a feature flag allows developers to choose between low-overhead static sites and dynamic content generation.

### **1.2. Client-Side Search Provider Architecture**
- **Decision:** Implement a three-way pluggable search provider model (Pagefind WASM, Lyra/Orama Client-side JS, and Algolia Hosted Search) with a global CDN toggle (`theme_settings.search.use_cdn`).
- **Reasoning:** High-performance documentation sites must be usable in diverse network environments, including strict corporate networks or offline intranets. A dual asset delivery mechanism (CDN for public deployment, local offline scripts for private/local hosting) satisfies both deployment modes.

---

## **2. Technical Caveats & Resolved Bugs**

### **2.1. Gitignore Matching Behavior**
- **Problem:** Staged frontend vendor assets under `assets/js/vendor/` were being ignored by Git, preventing their inclusion in the repository.
- **Cause:** The root `.gitignore` defined the pattern `vendor/`. Git matches directories named `vendor` recursively at any depth.
- **Resolution:** Anchored the pattern to the workspace root: `/vendor/`. This ensures the root Ruby gem caching directory is ignored while `assets/js/vendor/` is tracked.

### **2.2. Gemfile Case-Sensitivity in Linux CI**
- **Problem:** GitLab CI workflows threw `Could not locate Gemfile` errors during the test build phase.
- **Cause:** The repository files were named `GemFile` and `GemFile.lock` with an uppercase `F`. Local development was run on case-insensitive filesystems (Windows/macOS) where Bundler resolved the name. The CI runspace was a case-sensitive Docker container where Bundler expects lowercase `Gemfile`.
- **Resolution:** Renamed `GemFile` and `GemFile.lock` to lowercase `Gemfile` and `Gemfile.lock`.

### **2.3. WSL Filesystem Compilation Locks**
- **Problem:** Running `bundle exec jekyll build` directly inside WSL mount paths (e.g., `/mnt/g/...`) threw intermittent file locking / flushing errors (`copy_file_range` failed).
- **Cause:** File operations on mounted directories suffer from translation overhead and write locks.
- **Resolution:** Copy project source files to native Linux partitions (e.g., `/tmp/zero-dark-sp/`) excluding `.git`, `node_modules`, and `vendor`, then run the build operation natively.

### **2.4. Pagefind CDN Configuration**
- **Problem:** Loading Pagefind default UI assets from a CDN broke index chunk loading.
- **Cause:** Pagefind UI defaults to loading index chunks from the script's host path.
- **Resolution:** Specify `bundlePath: "/pagefind/"` (or the relative site root equivalent) during PagefindUI instantiation to enforce client-side lookups against the local domain.

### **2.5. Sidebar Scroll Flicker**
- **Problem:** Clicking sidebar navigation items caused the scroll position of the sidebar to jump back to top before restoring, creating a visual flicker.
- **Resolution:** Implemented an inline script executing immediately after the sidebar element definition to restore scroll position *before* the first layout paint.

### **2.6. Table of Contents (TOC) Custom Animations & Layouts**
- **Problem:** Implementing smooth animations on the dynamic Table of Contents (TOC) can cause layout shifting, visual lag, or accessibility conflicts (specifically for users with motion sensitivity).
- **Resolution:** Implemented TOC animations using pure CSS transitions and keyframes gated by a body configuration attribute `data-toc-animations`. Added a transition wrapper around `.zd-toc-link` and optimized performance using `transform: translateX` instead of animating layout properties like `margin-left` or `padding-left`. Used a CSS media query target for `prefers-reduced-motion: reduce` to disable transitions automatically when requested by the OS.

---

## **3. Quality of Life (QOL) & Aesthetic Guidelines**

### **3.1. Markdown Headers**
- **Rule:** All H2 and H3 markdown headers must be bolded (`## **Header**`).
- **Reasoning:** Enforces a clean, high-density typographical structure consistent with Zero-Dark's high-contrast theme.

### **3.2. Emojis and Symbols**
- **Rule:** Standard graphic emojis must not be used in documentation. Use approved high-density unicode status blocks (🟦, 🟩, 🟥, 🟧, 🔄, ➡️, 💠, 🔹, 🔸).

### **3.3. Tone and Terminology**
- **Rule:** Avoid sales or marketing terminology (specifically "premium"). Code comments, SASS layouts, and docs must use neutral, descriptive language (e.g., "elegant", "professional", "useful").
