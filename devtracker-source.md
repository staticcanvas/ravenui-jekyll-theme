# Jekyll Theme RavenUI - Development Notes and Workflow Instructions

## **Tasklist**

---

## **REPO INSTRUCTIONS**

**TASKS:** Work through task items in the **`dev-notes-tracker.md`** file. If a task is not in its proper category, move it to the correct section. The default categories are: **Bug Fixes (`priority-4`)**, **Issues Remaining (`priority-1`)**, **Features (`priority-3`)**, **Enhancements (`priority-2`)**, **Documentation (`priority-5`)**, **Refactoring (`priority-6`)**, **Refine Features (`priority-7`)**, and **Refine Documentation (`priority-8`)**. If a task item is incomplete, relies on a temporary workaround rather than best practice, or represents a simple implementation instead of the ideal advanced method, add an inline comment block starting with `> **After Thought**` or `> **Note!**` detailing alternatives, potential issues, or future design considerations.

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
### **Issues Remaining (priority-1)**
### **Enhancements (priority-2)**
### **Features (priority-3)**
- [ ] 🟡🌟 **Features/Liquid** - Explore custom Liquid tags to simplify custom asset or path resolution.
- [ ] 🟡🌟 **Features/Hooks** - Investigate if Jekyll hooks can help integrate the CLI and custom theme compilation features.
- [ ] 🟡🌟 **Features/Plugins** - Audit long-lived, active Jekyll plugins to create a "components(plugins)" section. Build highly-rated components leveraging these plugins under a feature flag. (Reference: awesome-jekyll-plugins).
- [ ] 🟡🌟❓ **DX/Foundation** - Ensure the core layout foundation is robust enough for other developers to build custom child themes on top of RavenUI, documenting all caveats, bugs, and QOL issues in detail. Maintain standards for none-opinionated, maintainable theme inheritance.
- [ ] 🟡🌟 **DX/UXReview** - Perform a developer experience (DX) and user experience (UX) review, analyzing the difficulties users might face when customizing or developing with the theme.
- [ ] 🟡🌟 **DX/FrameEvolution** - RavenUI has been evolving at a steady pace; it began as a simple theme that was easy to use and customize, but it has grown over time. It has now surpassed a basic layout to become a component-heavy theme framework. This theme is designed to be used as a base for other themes and as a component library to build various layouts and components.
    - Description for readme should be short and concise, and convey the depth of the theme.
    - Ruby GEM description should be short and concise, and convey the depth of the theme.
    - Docs Site can go into more detail about the theme fully explaining the depth and scope what it can accomplish etc.
- [ ] 🟡🌟 **DX/Deployment** - Deployment of theme to RubyGems.
- [ ] 🟡🌟 **DX/Deployment** - Deployment to third-party Jekyll theme directories.
- [ ] 🟡🌟 **CLI/MultiTheme** - Implement multitheme generation in the CLI (`rvcli`), allowing theme sets to be defined and packaged.
- [ ] 🟡🌟 **CLI/FeatureToggles** - Integrate environment feature switches in the CLI to configure plugin dependencies dynamically, and document component behaviors.
- [ ] 🟡🌟 **Features/StaticFiles** - Implement support and index listings for static files that do not contain front-matter.
- [ ] 🟡🌟 **CLI/PermalinkPreview** - Implement CLI permalink previewing, letting users see the output path of a file based on config rules, and display compiled front-matter.
- [x] 🔴🌟 **CLI/HotReloadConfig** - Added `Start-RvPlaceholderServer` / `Stop-RvPlaceholderServer` to `Invoke-RvDev.ps1` using .NET `HttpListener`. During `_config.yml` restart gaps, `tools/rvcli/assets/loading.html` is served on the same port (dark-mode spinner, auto-refresh, progress bar). No more connection-refused errors.

### **Bug Fixes (priority-4)**
- [x] 🟡🪲 **Fix/SidebarBorder** - Adjusted the sidebar menu border color in the dark theme to prevent the light theme border from bleeding through, using a new `--rd-sidebar-border-color` custom property.
### **Documentation (priority-5)**
### **Refactoring (priority-6)**
- [x] 🟡🩹 **Refactoring/Sass** - Created `_sass/ravenui-sp/_sass-vars.scss` with `!default` SASS variable layer covering all design tokens (colors, typography, spacing, radius, transitions, z-index). Added `$rd-overrides` map + `rd-token()` helper for bulk override pattern. Registered as first import. Documented in `docs/customization.md`.
- [x] 🟡🩹 **Refactoring/Markdown** - Conducted technical evaluation between Rouge and CodeRay. Formally standardized exclusively on Rouge due to CodeRay's deprecation, limited language support (40 vs 200+), and to prevent CSS stylesheet bloat. Documented in `docs/markdown.md`.
- [x] 🟡🩹 **Refactoring/Config** - Expanded `docs/variables.md` into a comprehensive canonical reference for every `_config.yml` setting, `theme_settings` namespace, page front-matter key, and data-sourcing mode — with full tables including type, default, and description.
- [x] 🟡🩹 **Refactoring/Plugins** - Conducted technical evaluation. Standardized on keeping plugins internal to the theme core to ensure zero-configuration experience and rapid hot-reloading. Documented in `docs/developer-guide.md`.
- [x] 🟡🩹 **Refactoring/JS** - Extracted ticker, heading-anchors, and code-utils from inline `<script>` in `default.html` into standalone ES modules (`assets/js/rd-ticker.mjs`, `rd-heading-anchors.mjs`, `rd-code-utils.mjs`). Liquid config replaced by `data-*` attributes on `<body>`.

### **Refine Features (priority-7)**
- [x] 🟡🌟 **Refine/Pages** - Verified and expanded layout customizability by implementing page-level toggles for both the left-hand navigation sidebar (`sidebar: false`) and the Table of Contents (`toc: false`), with corresponding responsive CSS grid template overrides. Documented in `docs/variables.md`.
- [x] 🟡🌟 **Refine/Releases** - Integrate release tag metadata to showcase stable versions dynamically across component badges. `tag.html` now supports `text="latest"` and `text="latest-version"` resolving to `site.data.releases.first.tag_name`; documented in `docs/components/tag.md`.
- [x] 🟡🌟 **Refine/Data** - Audit and update all data-driven components (timelines, charts, roadmaps) to accept data from both local `_data/` files and inline properties, and update documentation. `roadmap.html` now supports `data_source`, `items`, and legacy `content` capture. `timeline.html` already had full dual-mode support. Docs updated.
- [x] 🟡🌟 **Refine/Components** - Audit codebase for component reuse, and enforce guidelines to write modular component includes and documentation for all new design patterns. Layout extracted into `comps/header.html`, `comps/sidebar.html`, `comps/footer.html`, `comps/toc.html`; `default.html` updated to use modular includes. Docs created for all four.
### **Refine Documentation (priority-8)**
- [x] 🟡🌟 **Audit/QOL** - Added a floating "Back to Top" navigation button (`_includes/comps/back-to-top.html` and `_sass/ravenui-sp/_back-to-top.scss`) that dynamically displays on scroll and enables smooth scrolling back to the top, improving the readability of long technical pages. Integrated globally in `_layouts/default.html` and documented.
### **Backlog**
- [ ] 🟡💡 **Backlog/Flarum** - Investigate mirroring/integrating the RavenUI theme design dynamically with Flarum for community sites.
- [ ] 🟡💡 **Backlog/Hugo** - Explore building a compiler concept that converts Jekyll/Liquid code templates to Hugo or Eleventy.
- [ ] 🟡💡 **Backlog/BuildTimes** - Investigate ways to optimize build times for the main Jekyll application since the theme framework touches almost every part of Jekyll via plugins.
