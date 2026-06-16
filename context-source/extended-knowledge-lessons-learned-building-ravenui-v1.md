# **RavenUI - Extended Lessons Learned & Engineering Context**

This document serves as the canonical repository of technical knowledge, structural patterns, and architectural caveats identified during the design and optimization of the RavenUI Jekyll documentation theme.

---

## **1. Core Architectural Decisions**

### **1.1. Sidebar Navigation vs. Collection Filtering**
- **Decision:** RavenUI uses a dual-mode navigation structure. Standard documentation is manually curated via `_data/navigation.yml` for precise layout control. Advanced collections support is implemented behind a feature flag (`collections: false` by default).
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
- **Resolution:** Copy project source files to native Linux partitions (e.g., `/tmp/ravenui-sp/`) excluding `.git`, `node_modules`, and `vendor`, then run the build operation natively.

### **2.4. Pagefind CDN Configuration**
- **Problem:** Loading Pagefind default UI assets from a CDN broke index chunk loading.
- **Cause:** Pagefind UI defaults to loading index chunks from the script's host path.
- **Resolution:** Specify `bundlePath: "/pagefind/"` (or the relative site root equivalent) during PagefindUI instantiation to enforce client-side lookups against the local domain.

### **2.5. Sidebar Scroll Flicker**
- **Problem:** Clicking sidebar navigation items caused the scroll position of the sidebar to jump back to top before restoring, creating a visual flicker.
- **Resolution:** Implemented an inline script executing immediately after the sidebar element definition to restore scroll position *before* the first layout paint.

### **2.6. Table of Contents (TOC) Custom Animations & Layouts**
- **Problem:** Implementing smooth animations on the dynamic Table of Contents (TOC) can cause layout shifting, visual lag, or accessibility conflicts (specifically for users with motion sensitivity).
- **Resolution:** Implemented TOC animations using pure CSS transitions and keyframes gated by a body configuration attribute `data-toc-animations`. Added a transition wrapper around `.rd-toc-link` and optimized performance using `transform: translateX` instead of animating layout properties like `margin-left` or `padding-left`. Used a CSS media query target for `prefers-reduced-motion: reduce` to disable transitions automatically when requested by the OS.

### **2.7. Flexible Carousel Component (Images and Custom HTML Content)**
- **Problem:** Dynamic carousels typically limit builders to standard image slide collections. If users want to slide arbitrary components (e.g., custom cards, feedback elements, or text blocks), they are forced to write bespoke markup or load a heavy JavaScript slider library.
- **Resolution:** Upgraded the standard Jekyll carousel include (`_includes/comps/carousel.html`) to support a dual-mode layout. If a slide item contains a `content` property, the carousel renders it as a custom content viewport using CSS flex centering; otherwise, it falls back to the high-performance lazy-loaded, blur-up image layout. This avoids adding new JS dependencies and maintains a consistent, lightweight layout.

### **2.8. Modular Layout Parameters for Presentation Elements (Git Tags & Roadmap)**
- **Problem:** Data-driven presentation components like `git-tags` or `roadmap-item` often require presentation variety (e.g., switching from card grids to compact item lists, or displaying optional progress indicators) depending on layout density. Hardcoding dedicated templates or duplicating loops leads to structural drift and maintenance fatigue.
- **Resolution:** Parameterized presentation structures inside single include files. For `git-tags.html`, the check `include.layout == "list"` switches between wrapping structures (`.rd-git-tags-grid` vs. `.rd-git-tags-list`) and internal flex children. For `roadmap-item.html`, progress bars are disabled by default unless `show_progress=true` is explicitly passed, preserving clean, minimalistic default cards.

### **2.9. Pluggable Analytics and Dynamic Event Dispatching (PostHog Default)**
- **Problem:** Dynamic interactive components (like page feedback widgets) typically hardcode event dispatching logic against a single client-side tracker API (e.g. Google Analytics). Swapping to a self-hosted alternative (Umami, Plausible) or product analytics tool (PostHog) requires rewriting event dispatch loops or components.
- **Resolution:** Abstracted analytics loading to a single unified configuration block in `head.html` and implemented dynamic client-side runtime API checks in `feedback.html`. When clicked, the submission handler checks for the existence of `posthog`, `gtag`, `ga`, `umami`, or `plausible` globally and logs the page helpfulness payload to all active tracker instances safely.

---

## **3. Quality of Life (QOL) & Aesthetic Guidelines**

### **3.1. Markdown Headers**
- **Rule:** All H2 and H3 markdown headers must be bolded (`## **Header**`).
- **Reasoning:** Enforces a clean, high-density typographical structure consistent with RavenUI's high-contrast theme.

### **3.2. Emojis and Symbols**
- **Rule:** Standard graphic emojis must not be used in documentation. Use approved high-density unicode status blocks (🟦, 🟩, 🟥, 🟧, 🔄, ➡️, 💠, 🔹, 🔸).

### **3.3. Tone and Terminology**
- **Rule:** Avoid sales or marketing terminology (specifically "premium"). Code comments, SASS layouts, and docs must use neutral, descriptive language (e.g., "elegant", "professional", "useful").

---

## **4. CLI & Tooling Lessons**

### **4.1. PowerShell RegexOptions Bitwise Flag Operator**
- **Problem:** The HTML block-preservation logic in `tools/minify.ps1` was not correctly capturing `<pre>`, `<code>`, `<script>`, and `<style>` blocks before whitespace collapse. This caused code blocks to be mangled in minified output.
- **Cause:** The `RegexOptions` combination used the PowerShell arithmetic `-or` operator instead of the bitwise `-bor` operator. Since `RegexOptions::Singleline` (16) and `RegexOptions::IgnoreCase` (1) are flag enums, `-or` performs logical OR (returning True/False), not bitwise OR (returning the combined flag integer). The regex engine received an invalid options value and fell back to default mode, breaking the Singleline dot-matching required to span `<pre>` blocks across multiple lines.
- **Resolution:** Always use `-bor` when combining `[System.Text.RegularExpressions.RegexOptions]` enum values: `$optSLIC = [System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase`.

### **4.2. JS Minifier String and Template Literal Protection**
- **Problem:** A naive regex-based JS minifier strips `// line comments` from source files. However, URL strings containing `://` (e.g., `"https://api.example.com"`) were being truncated at the `//`, breaking runtime fetch calls.
- **Cause:** The comment-stripping regex `//.*$` matched the double-slash inside URL strings.
- **Resolution:** Before stripping comments, extract all string literals (single-quoted, double-quoted, and backtick template literals) into a placeholder array. After comment-stripping and whitespace collapsing, restore the originals. The lookbehind `(?<![:/])` is a partial guard but is insufficient for all edge cases inside strings.

### **4.3. rvcli Cmdlet Architecture**
- **Pattern:** All rvcli public commands follow a file-per-cmdlet structure under `tools/rvcli/Public/`. Each file defines a single `Invoke-Rv<Name>` function. The root module `rvcli.psm1` auto-discovers and dot-sources all files in `Public/` and `Private/`. The `Start-RvCli.ps1` `switch` router dispatches to the correct cmdlet by command name.
- **Adding a command requires four changes:** (1) Create `Public/Invoke-Rv<Name>.ps1`, (2) add a `switch` case in `Start-RvCli.ps1`, (3) add a `Show-RvCommandHelp` case in `Private/Show-RvCommandHelp.ps1`, (4) add the command to the help display text in `Show-RvHelp` inside `Start-RvCli.ps1`.

