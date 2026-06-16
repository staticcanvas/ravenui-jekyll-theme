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
- [ ] 🔴🌟 **CLI/HotReloadConfig** - Enhance the CLI livereload wrapper to render a temporary loading placeholder page during config restarts, preventing connection-refused errors in the browser.

### **Bug Fixes (priority-4)**
### **Documentation (priority-5)**
### **Refactoring (priority-6)**
- [ ] 🟡🩹 **Refactoring/Sass** - Investigate and implement ways to further unlock RavenUI customizability using SASS variables and mapping.
- [ ] 🟡🩹 **Refactoring/Markdown** - Evaluate whether to use Kramdown CodeRay over Rouge, or support both syntax highlighters.
- [ ] 🟡🩹 **Refactoring/Config** - Refactor `_config.yml` to simplify configuration. Determine if root properties are easier to understand or if config items should be grouped into nested objects.
- [ ] 🟡🩹 **Refactoring/Plugins** - Determine whether to extract all custom plugins and release them as separate Ruby gems, or keep them internal to the theme.
- [ ] 🟡🩹 **Refactoring/JS** - Extract inline component JavaScript into modular `.mjs` ES modules to enforce separation of concerns and clean up template code.

### **Refine Features (priority-7)**
- [ ] 🟡🌟 **Refine/Pages** - Verify and ensure full utilization of Jekyll page features and layout customizability.
- [ ] 🟡🌟 **Refine/Releases** - Integrate release tag metadata to showcase stable versions dynamically across component badges.
- [ ] 🟡🌟 **Refine/Data** - Audit and update all data-driven components (timelines, charts, roadmaps) to accept data from both local `_data/` files and inline properties, and update documentation.
- [ ] 🟡🌟 **Refine/Components** - Audit codebase for component reuse, and enforce guidelines to write modular component includes and documentation for all new design patterns.
### **Refine Documentation (priority-8)**
- [ ] 🟡🌟 **Audit/QOL** - Perform a deep dive into QOL components, configuration options, and documentation to identify and implement missing user-experience improvements.
### **Backlog**
- [ ] 🟡💡 **Backlog/Flarum** - Investigate mirroring/integrating the RavenUI theme design dynamically with Flarum for community sites.
- [ ] 🟡💡 **Backlog/Hugo** - Explore building a compiler concept that converts Jekyll/Liquid code templates to Hugo or Eleventy.
- [ ] 🟡💡 **Backlog/BuildTimes** - Investigate ways to optimize build times for the main Jekyll application since the theme framework touches almost every part of Jekyll via plugins.
