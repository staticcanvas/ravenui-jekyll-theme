# Jekyll Theme RavenUI - Development Notes and Workflow Instructions

## **Tasklist**

---

## **REPO INSTRUCTIONS**

**TASKS:** Work through task items in the **`dev-notes-pending.md`** file. If a task is not in its proper category, move it to the correct section. The default categories are: **Bug Fixes (`priority-4`)**, **Issues Remaining (`priority-1`)**, **Features (`priority-3`)**, **Enhancements (`priority-2`)**, **Documentation (`priority-5`)**, **Refactoring (`priority-6`)**, **Refine Features (`priority-7`)**, and **Refine Documentation (`priority-8`)**, and **refactor/port (`priority-0`)**. If a task item is incomplete, relies on a temporary workaround rather than best practice, or represents a simple implementation instead of the ideal advanced method, add an inline comment block starting with `> **After Thought**` or `> **Note!**` detailing alternatives, potential issues, or future design considerations.

**SKILL HARNESS:** Refer to `fluent-ui-v1` skill for all UI/UX tasks. Refer to the `context-source/` directorY for extended project knowledge and architectural lessons learned.

**VERSIONING:** Refer to the `fluent-ui-v1` versioning strategy for SemVer tags and releases. **git Workflow** !property Build can only be occupied my `major`, `minor`, or `patch` version increments will fail otherwwise.

**CHANGELOG** Keep and active CHANGELOG.md refer to `fluent-ui-v1` has access to `Get-ReleaseNotes.ps1` with the `-AheadOnly` !Note this only works if branch is ahead so before push run this this one and add the output to the semver version using `New-SemVerTag.ps1`. Read params to show how module interacts.

**SELF-IMPROVEMENTS:** Review workspace and project structures to identify area-specific optimization opportunities.

**CONTEXT DIRECTORY:** Use the `context-source/` folder to store AI-related PDRs, context files, and lessons learned. Maintain `extended-knowledge-lessons-learned-building-PLACEHOLDER_NAME.md` as the active log of project insights, which will be compiled into the v1 knowledge base for future runs. << for **SELF-IMPROVEMENTS**

## **GIT WORKFLOW:**

**BRANCHES:** Create a new branch (e.g., `feat/`, `fix/`, etc.) from `develop`. Use descriptive names like `feat/component/icon-improve-hash`.

**MERGE REQUESTS:** Create a Draft Merge Request (MR) in GitLab targeting `develop`. Include details on the planned change, implementation strategy, and expected outcomes.

**LABELS & ASSIGNMENT:** Assign MRs and tasks to user `@sgkens`. Add appropriate workflow labels and delete the source branch after merging.

**BRANCH-REMINDERS** - `Git pull origin develop` before creating a new branch, a new branch might be merge and we need to the changes before branching off.

**IF OUTSTANDING COMMITS** - if feature is complete commit and push.

**FALLBACK:** If context files are missing, scan GitLab issues, milestones, and Git history to rebuild the lessons-learned document.

**CONFLICT RESOLUTION:** If new architectural decisions conflict with older notes, update the documentation to reflect the current standard while noting the rationale.

**GITLAB MCP INTEGRATION:**

* **BRANCHES:** `main` is production; `develop` is the active development branch. Feature branches should use `feature/*`, fixes `fix/*`, hotfixes `hotfix/*`, and releases `release/*`.

* **INTERACTIONS:** Use the GitLab MCP server to manage issues, assign tasks to `@sgkens`, link branches, create milestones, and track status. Close tasks/issues when completed.

***DIFFICULTY:*** 🔴- `Very` 🟠- `moderate` 🟡- `easy` 🟢- `very-easy` 
***SCOPE:___***  💡- `Concepts-skip-from-task-list-unless-asked` 🌟-`feature-apaears-only-on-primary-tasks` 🦀- `bug-apears-only-on-primary-bug` 🪲- `bug-fixed-appears-only-on-primary-bugfix` 🩹-`fix-only-appears-on-primary-tasks`
***COMPLETE:*** ✔️- `parcially-complete` ❓- `working but with issues` ✅-`complete` 🌀- `Working-on`
***PRIORITY*** - 0️⃣1️⃣2️⃣3️⃣4️⃣5️⃣6️⃣7️⃣8️⃣9️⃣🔟- `priority-of-tasks`

> Task should follow this convention:
> * [ ] {{DIFFICULTY}}{{SCOPE}}{{COMPLETE}}{{PRIORITY}} **TASK CATGARORY** - Description
>   * [ ] {{DIFFICULTY}}{{SCOPE}}{{COMPLETE}}{{PRIORITY}} ***SUB TASKS CATGARORY*** - Description
>   > ***NOTE!*** - Note content

---
### **Critical Path (priority-1)**
- [x] 🟠🌟 **CLI/TaskTracker** - Enhance the Markdown-based task management system (devt) with Git integration and GitLab syncing. [#48](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/48)
    - [x] 🟢🌟 **CLI/TaskTracker/Decision** - Concluded architectural review: keeping Markdown as SOT to avoid hosting overhead, SQLite binary diff issues, or Plane database dependencies.
    - [x] 🟡🌟 **CLI/TaskTracker/GitLabSync** - Build a sync mechanism to map Markdown categories and tasks to GitLab work items/issues and milestones under user `@sgkens`.
    - [x] 🟡🌟 **CLI/TaskTracker/GitCommit** - Implement automated Conventional Commits (`devt -Mode commit`) adhering strictly to the `GEMINI.md` schema (type(scope), build, Notes, Feature Additions, Bug Fixes).
    - [x] 🟡🌟 **CLI/TaskTracker/GitDiff** - Implement a lightweight branch and staging area diff helper (`devt -Mode diff`) within the PowerShell TUI module.
    - [x] 🟡🌟 **CLI/TaskTracker/FormatValidator** - Add a task formatting validator/linter (`devt -Mode validate`) to enforce the strict checkbox prefix emoji pattern.
    > **Note!** - Keeping Markdown as SOT keeps local token footprint small. Syncing to GitLab will occur via GitLab MCP/REST API to bridge local Git state with remote tracking.

### **Active Enhancements (priority-2)**
- [x] 🟡🌟 **Enhancements/SidebarWidth** - Introduced `--rd-sidebar-width` CSS custom property (default `280px`, up from `240px`) consumed by `_layout.scss` grid templates. Value is injectable via `theme_settings.sidebar.width` in `_config.yml` (any CSS unit accepted). Both the full-sidebar and no-TOC grid variants updated. Documented inline in `_config.yml`. [#49](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/49)
- [x] 🟡🌟 **Enhancements/IndexWarning** - Created `_includes/comps/index-warning.html` + `_sass/ravenui-sp/_index-warning.scss`. Renders a prominent amber warning banner with: directory path hint, minimal front-matter scaffold, recommended component list (`card-index`, `sitemap`, `feature-grid`, `tag-filter`), and a collapsible QOL tips panel. Auto-triggers in `default.html` when `page.index_warning: true` or when `rd_debug` is on and page body is empty. Registered in `ravenui-sp.scss`. [#50](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/50)
- [x] 🟡🌟 **Refine/Pages** - Verified and expanded layout customizability by implementing page-level toggles for both the left-hand navigation sidebar (`sidebar: false`) and the Table of Contents (`toc: false`), with corresponding responsive CSS grid template overrides. Documented in `docs/variables.md`. [#77](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/77)
- [x] 🟡🌟 **Refine/Releases** - Integrate release tag metadata to showcase stable versions dynamically across component badges. `tag.html` now supports `text="latest"` and `text="latest-version"` resolving to `site.data.releases.first.tag_name`; documented in `docs/components/tag.md`. [#78](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/78)
- [x] 🟡🌟 **Refine/Data** - Audit and update all data-driven components (timelines, charts, roadmaps) to accept data from both local `_data/` files and inline properties, and update documentation. `roadmap.html` now supports `data_source`, `items`, and legacy `content` capture. `timeline.html` already had full dual-mode support. Docs updated. [#79](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/79)
- [x] 🟡🌟 **Refine/Components** - Audit codebase for component reuse, and enforce guidelines to write modular component includes and documentation for all new design patterns. Layout extracted into `comps/header.html`, `comps/sidebar.html`, `comps/footer.html`, `comps/toc.html`; `default.html` updated to use modular includes. Docs created for all four. [#80](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/80)

### **Feature Development (priority-3)**
- [ ] 🟡🌟 **Features/Liquid** - Explore custom Liquid tags to simplify custom asset or path resolution. [#51](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/51)
- [ ] 🟡🌟 **Features/Hooks** - Investigate if Jekyll hooks can help integrate the CLI and custom theme compilation features. [#52](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/52)
- [ ] 🟡🌟 **Features/Plugins** - Audit long-lived, active Jekyll plugins to create a "components(plugins)" section. Build highly-rated components leveraging these plugins under a feature flag. (Reference: awesome-jekyll-plugins). [#53](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/53)
- [ ] 🟡🌟❓ **DX/Foundation** - Ensure the core layout foundation is robust enough for other developers to build custom child themes on top of RavenUI, documenting all caveats, bugs, and QOL issues in detail. Maintain standards for none-opinionated, maintainable theme inheritance. [#54](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/54)
- [ ] 🟡🌟 **DX/UXReview** - Perform a developer experience (DX) and user experience (UX) review, analyzing the difficulties users might face when customizing or developing with the theme. [#55](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/55)
- [ ] 🟡🌟 **DX/FrameEvolution** - RavenUI has been evolving at a steady pace; it began as a simple theme that was easy to use and customize, but it has grown over time. It has now surpassed a basic layout to become a component-heavy theme framework. This theme is designed to be used as a base for other themes and as a component library to build various layouts and components. [#56](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/56)
    - Description for readme should be short and concise, and convey the depth of the theme.
    - Ruby GEM description should be short and concise, and convey the depth of the theme.
    - Docs Site can go into more detail about the theme fully explaining the depth and scope what it can accomplish etc.
- [ ] 🟡🌟 **DX/Deployment** - Deployment of theme to RubyGems. [#57](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/57)
- [ ] 🟡🌟 **DX/Deployment** - Deployment to third-party Jekyll theme directories. [#58](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/58)
- [ ] 🟠🌟 **CLI/MultiTheme** - Implement multitheme packaging and generation in the CLI (`rvcli`) using high-performance .NET file handling and `auspex` nested configuration traversal. [#59](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/59)
    - [ ] 🟡🌟 **CLI/MultiTheme/Directory** - Define a special `_ravenui-themes` directory containing theme definition directories matching the `ravenui-<themename>` naming convention.
    - [ ] 🟡🌟 **CLI/MultiTheme/Archive** - Automate high-performance theme packaging into `.zip` or `.tar` archive starter kits (e.g., `ravenui-themename-starterkit-v0.0.0.zip`) using .NET `[System.IO.Compression.ZipFile]` class.
    - [ ] 🟡🌟 **CLI/MultiTheme/Metadata** - Implement public cmdlets `Get-RvTheme` and `Show-RvThemeMetadata` adhering to file-per-cmdlet architecture.
    - [ ] 🟡🌟 **CLI/MultiTheme/Auspex** - Integrate the `auspex` PowerShell module to dynamically traverse nested theme configuration data and toggle layout features.
- [ ] 🟡🌟 **CLI/FeatureToggles** - Integrate environment feature switches in the CLI to configure plugin dependencies dynamically, and document component behaviors. [#60](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/60)
- [ ] 🟡🌟 **Features/StaticFiles** - Implement support and index listings for static files that do not contain front-matter. [#61](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/61)
- [ ] 🟡🌟 **CLI/PermalinkPreview** - Implement CLI permalink previewing, letting users see the output path of a file based on config rules, and display compiled front-matter. [#62](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/62)
- [x] 🔴🌟 **CLI/HotReloadConfig** - Added `Start-RvPlaceholderServer` / `Stop-RvPlaceholderServer` to `Invoke-RvDev.ps1` using .NET `HttpListener`. During `_config.yml` restart gaps, `tools/rvcli/assets/loading.html` is served on the same port (dark-mode spinner, auto-refresh, progress bar). No more connection-refused errors. [#63](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/63)
- [ ] 🟡🌟 **Features/IssueTemplate** - Research and design a "Report Issue" template component where users fill out a form that compiles to a merge request, exploring secure API integrations for static sites to prevent exposure of API keys. [#64](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/64)
- [ ] 🟡🌟 **Features/TiltedCarousel** - Design and build a "Tilted Lapping Carousel" component featuring overlapping, swiveled, and layered card layouts (where spacing scales dynamically with card density). Implement card-flipping hover animations. [#65](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/65)
- [x] 🟡🌟 **Features/SpacerComponent** - Created `_includes/comps/spacer.html` with named size tokens (`xs`→`2xl`), custom `height` prop (any CSS unit), optional visual divider (`subtle` or `gradient` styles), and scroll-anchor `id` support. SCSS registered in `ravenui-sp.scss`. All size defaults overridable via CSS custom properties (`--rd-spacer-*`). Documented in `docs/components/spacer.md`. [#66](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/66)
- [ ] 🟡🌟 **Features/MinimalMode** - Ensure full support for a minimalist theme experience by verifying that all features can be disabled via flags in `_config.yml` (feature toggles), leaving a clean, barebones base. [#67](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/67)
- [ ] 🟡🌟 **Features/FeatureFlagList** - Build a component/page showing a global feature flag status dashboard, dynamically pulling from `_config.yml` or `site.data` to display details of active/inactive features in an elegant card grid or list view. [#68](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/68)
- [x] 🟡🌟 **Features/DependencyList** - Created `_includes/comps/depends-upon.html` — structured dependency listing supporting front-matter `depends_upon` arrays, `_data/` file sources, and inline items. Each entry supports `name`, `type` (js-cdn, css-cdn, ruby-gem, npm, component, plugin), `version`, `link`, `description`, and `package` fields. Type-coloured badges use terminal palette. Full and compact (pill-only) display modes. SCSS in `_depends-upon.scss`, registered in `ravenui-sp.scss`. Documented in `docs/components/depends-upon.md`. [#69](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/69)
- [ ] 🟠🌟 **CLI/Helpers** - Build and test standalone utility helpers in `tools/` adhering to the root module loader structure, to be integrated into `rvcli`: [#70](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/70)
    - [ ] 🟡🌟 **CLI/Helpers/RequestRelease** - Implement `Request-RvRelease` using .NET `[System.Net.Http.HttpClient]` (non-API mode) to query and fetch releases from GitLab/GitHub.
    - [ ] 🟡🌟 **CLI/Helpers/UnpackRelease** - Implement `Unpack-RvRelease` supporting pipeline inputs (`ValueFromPipeline`) to unpack release archives natively.
    - [ ] 🟡🌟 **CLI/Helpers/RequestTag** - Implement `Request-RvTag` to query tags from GitHub.
    - [ ] 🟡🌟 **CLI/Helpers/ModuleWrappers** - Implement private helper functions wrapping `Find-Module`, `Install-Module`, and `Get-Module` to automate workspace dependency validation.

- [ ] 🟡🌟3️⃣ **Feature** - Implement context capsule exporter mode to generate structured AI-ready workspace context
- [ ] 🟠🌟3️⃣ **Feature** - Implement automated conventional changelog generator compiling completed tasks
- [ ] 🟡🌟3️⃣ **Feature** - Add CI verification checks to block merge requests if branch task list is out of sync
### **Bug Fixes (priority-4)**
- [x] 🟡🪲 **Fix/SidebarBorder** - Adjusted the sidebar menu border color in the dark theme to prevent the light theme border from bleeding through, using a new `--rd-sidebar-border-color` custom property. [#71](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/71)

### **Refactoring & QOL (priority-5)**
- [x] 🟡🩹 **Refactoring/Sass** - Created `_sass/ravenui-sp/_sass-vars.scss` with `!default` SASS variable layer covering all design tokens (colors, typography, spacing, radius, transitions, z-index). Added `$rd-overrides` map + `rd-token()` helper for bulk override pattern. Registered as first import. Documented in `docs/customization.md`. [#72](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/72)
- [x] 🟡🩹 **Refactoring/Markdown** - Conducted technical evaluation between Rouge and CodeRay. Formally standardized exclusively on Rouge due to CodeRay's deprecation, limited language support (40 vs 200+), and to prevent CSS stylesheet bloat. Documented in `docs/markdown.md`. [#73](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/73)
- [x] 🟡🩹 **Refactoring/Config** - Expanded `docs/variables.md` into a comprehensive canonical reference for every `_config.yml` setting, `theme_settings` namespace, page front-matter key, and data-sourcing mode — with full tables including type, default, and description. [#74](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/74)
- [x] 🟡🩹 **Refactoring/Plugins** - Conducted technical evaluation. Standardized on keeping plugins internal to the theme core to ensure zero-configuration experience and rapid hot-reloading. Documented in `docs/developer-guide.md`. [#75](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/75)
- [x] 🟡🩹 **Refactoring/JS** - Extracted ticker, heading-anchors, and code-utils from inline `<script>` in `default.html` into standalone ES modules (`assets/js/rd-ticker.mjs`, `rd-heading-anchors.mjs`, `rd-code-utils.mjs`). Liquid config replaced by `data-*` attributes on `<body>`. [#76](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/76)

### **Documentation & Docs (priority-6)**
- [x] 🟡🌟 **Audit/QOL** - Added a floating "Back to Top" navigation button (`_includes/comps/back-to-top.html` and `_sass/ravenui-sp/_back-to-top.scss`) that dynamically displays on scroll and enables smooth scrolling back to the top, improving the readability of long technical pages. Integrated globally in `_layouts/default.html` and documented. [#81](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/81)

### **Backlog & Concepts**
- [ ] 🟡💡 **Backlog/Flarum** - Investigate mirroring/integrating the RavenUI theme design dynamically with Flarum for community sites.
- [ ] 🟡💡 **Backlog/Hugo** - Explore building a compiler concept that converts Jekyll/Liquid code templates to Hugo or Eleventy.
- [ ] 🟡💡 **Backlog/BuildTimes** - Investigate ways to optimize build times for the main Jekyll application since the theme framework touches almost every part of Jekyll via plugins.
- [ ] 🟡💡 **Backlog/Bucman** - Integrate the `Bucman` S3 bucket administration tool (in PowerShell) as a workspace deployment step once it exits beta.
- [ ] 🟡💡 **Backlog/RubyCommander** - Integrate `RubyCommander` to coordinate and orchestrate complex Ruby commands in the build process.
- [ ] 🟡💡 **Backlog/Mystro** - Integrate `Mystro` media orchestrator to manage and compile media assets.
- [ ] 🟡💡 **Backlog/PHWriter** - Compare the help manual engine of `PHWriter` with the existing `rvcli` custom help system to determine structural and aesthetic superiority.
- [ ] 🟡💡 **Backlog/Fluidbar** - Integrate `Fluidbar` (handles spinners, progress bars, and loaders) once released.
- [ ] 🟠💡4️⃣ **Backlog & Concepts** - Add local task dependency validation supporting parent/child constraints
- [ ] 🟡💡5️⃣ **Backlog & Concepts** - Investigate lightweight SQLite caching to speed up large task dashboard stats queries
