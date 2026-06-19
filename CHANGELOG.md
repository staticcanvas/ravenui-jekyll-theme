# **CHANGELOG**

## [2.11.1] - 2026-06-19

### Feature Additions
- Created feature-flags.html component and feature-flags.md page

### Bug Fixes
- Fix liquid syntax warning in default.html layout

### Notes & Improvements
- Add live dashboard component for theme feature flags
- Add global switches in _config.yml for sidebar, toc, breadcrumbs, search, and footer
- Add page-level frontmatter overrides for all minimalist components
- Wrap search scripting, assets, and triggers to completely disable search features when turned off
- wrap liquid code block in notes-for-fluram-concept.md with raw tags
- wrap liquid code block in blog-plan.md with raw tags

## [2.9.4] - 2026-06-19

### Bug Fixes
- Prevented Liquid syntax bleeding through inside example code documentation blocks.

### Notes & Improvements
- Performed a comprehensive documentation audit across the docs/ directory.
- Wrapped 42 unescaped Liquid blocks (including include statements, for loops, and variable assigns) inside docs markdown files with {% raw %} and {% endraw %} tags to prevent Jekyll's Liquid engine from executing code blocks during documentation site compilation.
- Validated correct rendering by successfully running a bundle jekyll build test.

## [2.9.3] - 2026-06-19

### Feature Additions
- High-performance multithreaded RunspacePool branch querying.
- Auto-scaling TUI table layout engine.
- Beetle emoji width override for perfect visual alignment.
- Added workflow enhancement tasks to source tracker.

### Notes & Improvements
- Implemented a dynamic console table layout engine utilizing Format-TuiRow in Helpers.ps1 that dynamically measures branch name display widths and auto-sizes columns/borders to prevent box tearing.
- Integrated a high-performance RunspacePool inside Invoke-GitBranchesHelper to query git branch metadata concurrently (ahead/behind commits, last commit age, and subject line), decreasing command latency from 5s to <300ms.
- Optimized GitLabSync.ps1 and GitOps.ps1 by replacing pipeline cmdlets (Where-Object/Select-Object) with fast direct foreach loops.
- Fixed 🪲 Beetle emoji (U+1FABC) character display width handling in Get-StringDisplayWidth to treat it as width 1 on standard terminals, eliminating stats dashboard alignment glitches.
- Expanded the task tracker with five workflow-specific development concepts (capsule exporter, changelog generator, local database constraints, SQLite caching, and CI blockers).

## [2.9.2] - 2026-06-19

### Feature Additions
- Visual repository branch comparison dashboard.
- Styled gitdiff command comparisons across branches.
- Unicode/emoji display width calculation helper for visual alignment.

### Bug Fixes
- Fixed TUI layout alignment glitches in devt stats caused by emoji string length variations.

### Notes & Improvements
- Added Get-StringDisplayWidth and Get-PadRight helper functions in Helpers.ps1 to calculate visual string widths and pad terminal layouts safely, preventing TUI alignment glitches with surrogate pairs and BMP double-width emojis.
- Implemented devt branches command providing a high-fidelity visual dashboard of all local repository branches showing active age, diff status (ahead/behind counts vs base branch), and the latest commit message.
- Implemented devt gitdiff command permitting code diff comparisons and status stats of the current branch against a base branch (or custom branch specified with -Branch).
- Updated the devt help manual and README.md documentation to document the new branches and gitdiff modes and parameter configurations.

## [2.9.1] - 2026-06-19

### Feature Additions
- Support for dynamic git root resolution.
- Support for tag-anchored SemVer version calculation via Get-ConventionalCommitVersion.

### Bug Fixes
- Fixed hardcoded repository path offsets.

### Notes & Improvements
- Replaced deprecated Get-GitAutoVersion with Get-ConventionalCommitVersion for tag-anchored SemVer.
- Resolved Get-ConventionalCommitVersion.ps1 locally within the module's Private folder before falling back to profile/global paths.
- Implemented dynamic git repository root lookup in Helpers.ps1 by traversing parent directories to detect .git folder.
- Authored a comprehensive README.md detailing the purpose, architecture, modes, formatting specifications, and setup instructions.

## [2.8.13] - 2026-06-18

### Feature Additions
- GitLabSync.ps1: added two-way task status sync, child note commenting, and Draft MR creation helper
- GitOps.ps1: added conventional commit helper and branch diff summaries
- New-AsciiGradient.ps1: added native ANSI 256-color gradient builder
- Helpers.ps1: added Test-TaskFileFormat for emoji syntax checks and updated category codes
- Invoke-Devt.ps1: integrated stats alignment, gradient box, and create-mr mode
- spacer.html: vertical whitespace component with xs/sm/md/lg/xl/2xl size tokens,
- _spacer.scss: CSS custom property scale (--rd-spacer-*), all overridable globally
- depends-upon.html: structured dependency listing with type/version/link/description/package
- _depends-upon.scss: full dark/light theme support; compact pill layout
- docs/components/spacer.md: live demos, API table, size token reference
- docs/components/depends-upon.md: live demo using page own front-matter, full API + schema
- _layout.scss: replaced hardcoded 240px sidebar width with --rd-sidebar-width CSS custom property (default 280px)
- head.html: injects --rd-sidebar-width from theme_settings.sidebar.width (_config.yml)
- _config.yml: added theme_settings.sidebar.width setting (any CSS unit accepted, default 280px)
- index-warning.html: new component rendering amber warning banner with path hint, scaffold snippet, recommended components, and collapsible QOL tips panel
- _index-warning.scss: full SCSS module for index-warning, dark/light theme compatible
- default.html: auto-renders index-warning when page.index_warning:true or rd_debug+empty body
- ravenui-sp.scss: registered index-warning module

### Bug Fixes
- Stats dashboard: Fixed border width calculation and title spacing to resolve screen tearing

### Notes & Improvements
- Replaced Plane/SQLite DB plan with Markdown SOT to avoid hosting overhead
- Implemented GitLab synchronization for issues, milestones, closed tasks, and comment notes
- Added Conventional Commits and branch diff TUI tools
- Configured a gradient-bordered stats metrics box with column alignment
- SpacerComponent and DependencyList features from priority-3 backlog
- Both include full documentation pages under docs/components/
- Resolves sidebar column wrapping issue for long nav item titles
- Adds developer-facing index-warning component for empty directories

## [2.8.10] - 2026-06-18

### Notes & Improvements
- Imported rough notes from temp.md into canonical devtracker-source.md.
- Split long multi-theme task into discrete sub-tasks incorporating the auspex module.
- Added new feature tasks for component layout/spacers, tilted carousels, and minimal modes.
- Added CLI helper tasks incorporating phellams-aa PowerShell module standards.
- Backfilled awaiting dependencies (Bucman, RubyCommander, Mystro, Fluidbar) into Backlog.

## [2.8.9] - 2026-06-17

### Feature Additions
- Page-level sidebar and TOC toggle overrides
- Floating Back to Top scroll utility include and styles
- Documented decision to keep custom plugins internal

### Notes & Improvements
- Added page-level toggles for left-hand navigation sidebar (sidebar: false) and Table of Contents (toc: false) with corresponding CSS grid template overrides.
- Added a floating Back to Top button that appears when scrolling down and enables smooth scroll-to-top behavior.
- Standardized on keeping custom Ruby plugins internal to the theme core rather than releasing them as external gems.
- Updated developer-guide.md, variables.md, and lessons learned.

## [2.8.8] - 2026-06-17

### Notes & Improvements
- refactor: standardize on Rouge syntax highlighter (markdown)

## [2.8.7] - 2026-06-17

### Bug Fixes
- sidebar: Prevented light theme border default color from bleeding through to the dark theme sidebar.

## [2.8.6] - 2026-06-17

### Bug Fixes
- _sass-vars.scss: Resolved Sass::CompileError (expected ';') that broke the Jekyll build.

## [0.0.0] - 2026-06-17

### Feature Additions
- Complete rd_* shorthand variables table (25 entries)
- Full theme_settings namespace coverage: logo, header, TOC, code, borders,
- Page front-matter overrides: layout/identity, navigation/TOC, functional
- Component data sourcing modes (data_source vs items/table_items)
- Quick-lookup callout tip linking to component library
- add SASS variable layer for theme customization (sass)
- assets/js/rd-ticker.mjs         - Numeric count-up animation (IntersectionObserver)
- assets/js/rd-heading-anchors.mjs - Heading anchor '#' link injector
- assets/js/rd-code-utils.mjs     - Code copy button + language label badge
- default.html: Added data-code-copy, data-code-lang, data-headings-always-visible
- default.html: ES module imports replace ~130 lines of inline Liquid-JS
- roadmap.html: Added data_source (dot-path _data/ lookup) and items
- docs/_data/roadmap.yml: Example data file used by the live docs demo
- docs/components/roadmap.md: Full rewrite documenting all three modes
- tag.html: Resolves 'latest'/'latest-version' text to
- docs/components/tag.md: API table updated to document the special
- _includes/comps/header.html  - Top nav bar with align/density/sticky control
- _includes/comps/sidebar.html - Collapsible nav tree with force_brand param
- _includes/comps/footer.html  - Footer columns + edit-page link + timestamps
- _includes/comps/toc.html     - Client-side TOC with scroll-spy and style/density
- _layouts/default.html        - Updated to use modular comps includes
- SCSS modifiers for --inline, --sticky, --compact etc. variants

### Bug Fixes
- Gemfile: Resolved 'could not find gem jekyll-theme-ravenui' error

## [2.8.5] - 2026-06-17

### Feature Additions
- Rebranded and modularized devt task management utility.
- Excluded devtracker-pending.md in gitignore.
- References page (docs/references.md)
- Philosophy and Scope page (docs/scope.md)
- Comprehensive installation guide covering three distribution models in docs/installation.md.
- Developer Guide reference page (docs/developer-guide.md)
- Path Configurations reference page (docs/paths.md)
- Variables Reference page (docs/variables.md)
- tools/rvcli/Public/Invoke-RvGitTags.ps1: generates _data/git-tags.yml from sorted git tag history via .NET ProcessStartInfo; supports --limit, --output, --dry-run
- tools/rvcli/Public/Invoke-RvReleases.ps1: generates _data/releases.yml entries from git commit log grouped by Conventional Commit type; supports --append, --tag, --output, --dry-run
- tools/rvcli/Public/Invoke-RvVersion.ps1: get/set/bump/sync site version across VERSION file and _config.yml; bump supports major|minor|patch with v-prefix preservation
- tools/rvcli/Private/Helpers.ps1: added shared Invoke-RvGitCmd helper (removed duplicate from both public cmdlets)
- tools/rvcli/Public/Start-RvCli.ps1: added router cases for git-tags, releases, version/ver commands; added DATA & VERSIONING help section
- tools/rvcli/Private/Show-RvCommandHelp.ps1: added full help blocks for git-tags, releases, version/ver with all flags and examples
- docs/file-types.md: new page at /file-types/ covering .md vs .html extension decision, Kramdown pipeline, parsing caveats, collection documents
- docs/data-config.md: new page at /data-config/ covering YAML/JSON/CSV/TSV formats, data_source parameter, subfolder dot-notation, inline vs file-backed data
- docs/data-subfolders.md: new page at /data-subfolders/ covering _data/ subfolder organisation, naming conventions, nesting depth, use cases
- docs/data-json.md: new page at /data-json/ covering JSON file creation, Liquid access, component usage, nested objects, CI generation, JSON vs YAML comparison
- docs/_data/navigation.yml: added File Types, Data Files, Data Subfolders, JSON Data entries under Configuration section
- Rewrote tools/minify.ps1 with production-grade .NET/StringBuilder implementation
- Fixed critical RegexOptions -bor bug (was incorrectly using -or, breaking HTML block capture)
- Added JS template-literal and string-literal placeholder protection
- Added <style> and <textarea> block preservation in HTML minifier
- Added per-file size delta reporting with percentage reduction
- Added --dry-run mode, --quiet flag, --no-html/--no-css/--no-js selective switches
- Added --skip <glob> exclusion pattern support
- Preserved licence-banner comments (/*! */) in CSS and JS passes
- Added overall summary (original/minified/saved bytes + percentage)
- Created Invoke-RvMinify.ps1 as a first-class rvcli Public cmdlet
- Registered 'minify' in Start-RvCli.ps1 command router
- Added full 'rvcli minify --help' documentation in Show-RvCommandHelp.ps1
- Custom Liquid block tag `rd` capturing child markup and parsing parameters.
- Custom Liquid inline tag `rdi` parsing parameters inline.
- Auto-discovery in comps/, core/, and root _includes/ directories.
- Custom Component Tags documentation in docs/custom-tags.md.
- Support for excerpts in blog-card, blog-list, collection-blog, collection-grid, collection-list, and collection-posts layouts.
- Runtime metadata component (`comps/runtime-metadata.html`) and associated plugin (`_plugins/runtime_metadata.rb`).
- Expanded collections guide documenting sorting, tag filtering, and manual ordering.
- Detailed component system audit catalog in dev-notes-tracker.md.
- Rebranding updates to RavenUI fallback variables and settings.
- Add _includes/comps/sitemap.html and docs/components/sitemap.md.
- Add _sass/ravenui-sp/_sitemap.scss and register in stylesheet.
- Support theme_settings.environment for manual environment overrides.
- Render Draft label tags in default, post, and sidebar templates.
- Add _includes/comps/platform-support.html and browser-support.html.
- Add _sass/ravenui-sp/_compatibility-badges.scss and import it in loader.
- Add docs/components/platform-support.md and browser-support.md.
- Add data-ticker-value attributes to site stats and metrics includes.
- Add _includes/comps/grid.html and docs/components/grid.md.
- Add collection layout files: grid, list, documents, posts, blog, api, data, commands, cli.
- Add tools/minify.ps1 HTML/CSS/JS minifier script.
- Custom stylesheets and scripts (head & foot) loading via theme_settings.
- Custom font stylesheets loading via typography settings.
- Nesting support for data sources using dot-separated notation.
- Elegant visual placeholder card for images and text fallbacks for cards.
- Added flat-file folder structure and URL normalization details to navigation docs.
- Documented all new configuration parameters in the settings table.
- Default Z logo assets packaged in gem files.
- Platform compatibility documentation detailing safe mode behavior and workarounds.
- Packaged CLI executable with gem distribution.
- Enhanced workspace root detection to support running from arbitrary folders or subfolders.
- Rebranded copies of copy-button, icon-grid, and modal JS triggers.
- Audited all 78 includes and logged status mappings.
- Rebranding to RavenUI
- Integration of the rd- prefix for variables/classes
- Updated rvcli CLI helper functions
- extra-spinner.html: CSS keyframe ring spinner with size (small/medium/large)
- extra-media-card.html: Poster-first media card with rating badge, genre chips,
- extra-media-details.html: Full expanded media profile with backdrop-banner header,
- extra-wiki-grid.html: High-density CSS grid stat block for unit/character attributes
- extra-api-fetcher.html: Client-side JSON API fetcher with localStorage caching,
- extra-related-carousel.html: Wraps media card instances in reusable carousel
- _extra-components.scss: Dedicated SASS module imported in zero-dark-sp.scss.
- docs/_data/extra_media.yml: Sample Warhammer unit, anime, and game data for testing.
- docs/components/extra-components.md: Full documentation with live previews and API tables.
- docs/_data/navigation.yml: New Extra Components sidebar category added.
- Unified collection layout with 5 display variants.
- Dynamic collection document listing and sorting.
- Sidebar menu dynamic collection listing integration.
- Introduce new features. (layout expansion)
- interation-1 (zdcli-concept)
- Unified blog index layout with list/grid toggle.
- Premium technical article layout with metadata and author cards.
- Minimalist blank page layout for landing pages or full-screen canvases.
- Interactive feedback widget with multi-provider analytics.
- Charts engine rendering for tags and categories post counts.
- Intersection observer-driven numeric tickers.
- Sidebar & Header Navigation: Support is_new_feature attributes to render new, updated, beta, and hot badges.
- Navigation Docs: Documented configuration, style variants, and provided examples.
- Git Tags: Upgraded component to switch between card grid and compact list layout style via layout="list".
- Roadmap Item: Added show_progress parameter to toggle progress bar display (defaulting to hidden).
- CodePen: Elegant fallback check for missing config parameters and client-side 404 check via oEmbed API.
- Custom HTML/Markdown slide layouts inside the carousel.
- Non-Image Carousel documentation page.
- Customizable Table of Contents page-load and hover transitions.
- TOC animations configurations under theme_settings.toc.
- TOC animations documentation.
- Add theme_settings.code.lang_style config property in _config.yml.
- Support full-width header bar layout for code blocks in _sass/zero-dark-sp/_components.scss.
- Document code block layout styling settings in docs/configuration.md.
- Add data-first-word fallback text attribute to typewriter.html component.
- Add top header bar layout option under theme_settings.header.
- Add docs/_data/navheader.yml for custom header navigation links.
- Add TOC custom layout designs and sizing density configuration options.
- Add full navigation documentation for header layouts and custom TOC styles.

### Bug Fixes
- Added missing TaskItem class declaration to the top of Helpers.ps1 to resolve parser errors.
- Escape literal liquid blocks in file-types.md to prevent Jekyll compile failures.
- Handle Jekyll::Page safely in og_image_generator.rb by checking response to basename_without_ext or using File.basename fallback.
- None.
- Ignored non-docs root markdown files for heading bolding audits inside rvcli linter.
- Fix linter false positives by cleaning IAL tags in Invoke-RvLinter.ps1.
- Fix broken include sample path in static/index.html.
- Added compatibility guards to prevent site compile crashes when from_yaml filter is missing or ignored.
- Fixed ZDSearchLocal and zd- startsWith references in layouts
- Fixed Liquid syntax error in head.html borders customization block.
- None introduced; carousel JS guard clause prevents double-load.
- Fixed spelling, formatting, and categorization in dev-notes-tracker.md.
- Font Awesome: Forwarded icon style attribute in sidebar/header links to resolve brand rendering issues.
- Steps Bar: Applied CSS text-wrap properties and min-width constraints to prevent TOC overflow.
- Carousel Docs: Fixed YAML parsing errors from unquoted colon-space patterns in slide captions.
- Apply dynamic data-code-lang-style attribute to layouts/default.html body tag.
- Resolve Kramdown escaping and paragraph wrapping bug in modal.html includes.
- Prevent raw typewriter text and animated cursors from bleeding into generated Table of Contents items.
- Add standard cross-browser scrollbar support for code blocks on Firefox in _sass/rogue/_ethereal.scss.
- Bind all search trigger instances on page (header and sidebar) to open search modal.
- Hide redundant logo/brand section from the left sidebar when the top header bar is active.

### Notes & Improvements
- Refactored the task manager script into a session-loadable PowerShell module called devt under tools/devt.
- Rebranded tracking files to devtracker-source.md, devtracker-pending.md, and devtracker-archive.md.
- Replaced the direct pwsh execution model with a module import that maps functions and aliases to the current window.
- Updated root execution wrappers devt, devt.ps1, and devt.bat to delegate cleanly using pwsh -File.
- Implemented TagFilter component with URL param sync and auto-extraction.
- Built ComponentPlayground for live property previews and Liquid code generation.
- Created LayoutVisualizer showing schematic grid layout for alternative page layouts.
- Developed PageConverter supporting Markdown download, HTML extraction, and Print/PDF export.
- Updated blog and collection layouts to integrate tag-filtering.
- Created documentation pages for all new components and registered them in navigation.
- Create references.md listing external resource APIs and cheat sheets.
- Create scope.md documenting design philosophy, performance limits, and framework boundaries.
- Register routes in navigation.yml.
- Update installation.md to cover Gem-Based Theme, Remote Theme, and Forking/Copying models.
- Escape code snippet Liquid blocks using raw/endraw tags.
- Document lesson about escaping literal Liquid templates (e.g. capture tags) in markdown code blocks to prevent compile exceptions.
- Escape literal liquid blocks inside code segments in file-types.md to resolve Jekyll compiler exceptions.
- Add developer guide documenting layout architecture, SASS tokens, custom tags/plugins, and extension points.
- Add paths reference explaining URL routing, filters, trailing slash normalization, and directory tree layouts.
- Add variables reference mapping Jekyll global scopes, theme settings configuration switches, and page-level overrides.
- Closes CLI/PowerShellHelpers task and all sub-tasks in dev-notes-tracker.md
- Closes Docs/FileTypes, Docs/DataConfig, Docs/DataSubfolders, Docs/JSONData tasks
- Closes Refactoring/Cleanup (visual-elements.md already removed)
- Updated context-source/extended-knowledge-lessons-learned-building-ravenui-v1.md
- Closes Enhancements/Minification task in dev-notes-tracker.md
- Implement custom block `rd` and inline `rdi` tags to bypass standard include path verbosity.
- Automatically resolve variables from the current Liquid context for unquoted attributes.
- Fix bug in og_image_generator.rb where basename_without_ext is called on Jekyll::Page.
- Fall back to post.excerpt or doc.excerpt when description is omitted across blog and collection layouts.
- Dynamic runtime metadata plugin and component to expose Ruby, Jekyll, Bundler, and plugins versions.
- Merge remote-tracking branch 'origin/develop' into develop
- Completed a full component system audit, listing all 85 components with their descriptions and potential caveats in dev-notes-tracker.md.
- Updated fallback branding titles and subtitles from ZERODARK to RAVENUI across layouts, includes, static templates, scripts, and bootstrap configurations.
- Integrated mapping exceptions for consolidated component documentation inside the rvcli linter tool.
- Verified workspace integrity with both local Jekyll build and rvcli linter diagnostics.
- Created sitemap.html include rendering pages, posts, and collection hierarchies.
- Styled sitemap elements using dedicated _sitemap.scss.
- Implemented site.theme_settings.environment gating for development diagnostics.
- Added visual 'draft' badges to default layouts and sidebar loops.
- Added platform-support.html component with Simple Icons mapping.
- Added browser-support.html component with custom version string indicators.
- Styled badges using color-mix for supported, partial, and unsupported states.
- Registered and documented components in docs reference pages.
- Count-up tickers with IntersectionObserver and cubic easeOut.
- Modular layout grids component and responsive column styling.
- 9 custom Jekyll collection layouts with sorting and tags.
- Integrated PowerShell workspace linter and asset minifier in CI.
- Resolved workspace linter false positives with header IAL tags.
- Enabled custom stylesheets, head scripts, foot scripts, and font stylesheets injection directly from site configuration without template modifications.
- Implemented a dot-separated nested data path resolution system for Jekyll data-driven components.
- Added support for page-level and site-level variable fallbacks in data-driven and layout components.
- Added visual and text fallback placeholders for cards, hero sections, and images to prevent layout breakage.
- Documented flat-file site structure support and new configuration options.
- Integrated SVG block-based Z-mark as the default logo in assets/images and assets/img.
- Added site.safe check to git-tags.html and releases.html includes to prevent from_yaml compilation crashes in GitHub Pages Safe Mode.
- Rebranded installation instructions to jekyll-theme-ravenui.
- Created bin/rvcli Ruby script to act as wrapper launcher for pwsh entry point.
- Updated jekyll-theme-ravenui.gemspec to package bin/, tools/, and rvcli.ps1 files and declare rvcli as executable.
- Modified Start-RvCli.ps1 to resolve workspace root by traversing upwards from the process current working directory.
- Completed rebranding of component templates and assets from ZeroDark to RavenUI.
- Renamed internal JS functions to prevent collisions and mapped includes to documentation.
- Changed all project references and gems to jekyll-theme-ravenui and ravenui-jekyll-theme.
- Renamed zdcli utility to rvcli.
- Renamed all CSS variables, utility classes, and custom data attributes to use the rd- prefix (short for raven-data).
- Verified build is successful.
- Fixed syntax error in head.html where invalid elif tags were used instead of elsif.
- Verified successful compilation of the Jekyll site.
- Restructured dev-notes-tracker.md tasklist to follow the new categorization, scope, and notes structure.
- Build verified clean via `bundle exec jekyll build` (19s, no errors).
- All components are GitHub Pages / Jekyll safe-mode compatible (zero Ruby plugins).
- localStorage caching uses configurable TTL to prevent API rate-limit hits.
- Implemented collection.html layout supporting list, grid, cards, tree, and pathways view styles.
- Created sample tutorials collection and index pages showcasing each layout style.
- Updated documentation and sidebar navigation menu.
- Created unified blog.html layout with card grid, list style, category/tag filtering, and limit options.
- Designed premium deep-dive article.html layout featuring reading time, banner gradients, author bio lookup, and pagination.
- Added blank.html layout providing a clean canvas (no headers, navigation sidebars, or TOCs).
- Created demonstration pages and updated the Layouts documentation.
- gitignore: Add / Update a .gitignore file.
- Integrated PostHog, Google Analytics, Umami, Plausible analytics tracking in the feedback widget.
- Added visual charts support (chartjs / svg) to the site stats component.
- Implemented pneumatic micro-animations and scroll-driven numeric tickers.
- Cleaned up, formatted, and corrected spelling/grammar in dev-notes-tracker.md.
- Added flexbox alignment and CSS-based glowing badge styles (.zd-nav-badge) to sidebar/header links.
- Integrated badge rendering in sidebar.html and header.html templates.
- Supported classifications for 'new', 'updated', 'beta', and 'hot' items in navigation configs.
- Updated docs/navigation.md to document the badge options and configuration.
- Added list layout parameter and style support to git-tags component.
- Made progress bars optional and hidden by default on roadmap-item component.
- Implemented client-side public CodePen oEmbed checks for graceful 404 embedding fallbacks.
- Corrected brand icon rendering issues in header and sidebar components.
- Standardized text-wrapping overflow styles on steps progress bar items.
- Updated extended engineering lessons learned documentation.
- Synchronized VERSION, _config.yml, and docs/_config.yml files with the newly released version tag 1.17.1.
- Upgraded `_includes/comps/carousel.html` to conditionally render custom HTML/Markdown slides when the `content` property is provided.
- Added SASS rules for `.zd-carousel-custom-content` inside `_sass/zero-dark-sp/_components.scss`.
- Updated `docs/components/carousel.md` to show live Image and Non-Image Carousel examples.
- Logged the design decisions in the context-source lessons learned documents.
- Synchronized `docs/Gemfile.lock` with theme version `1.17.0`.
- Synchronized VERSION, _config.yml, and docs/_config.yml files with the newly released version tag 1.17.0.
- Implemented `site.theme_settings.toc.animations` configuration toggle.
- Added data-toc-animations body attribute for CSS targeting of TOC animations.
- Implemented page-load fadeInUp transitions for the TOC container.
- Implemented hover slide-right micro-animations for TOC links.
- Supported prefers-reduced-motion CSS media query to prevent accessibility issues.
- Updated documentation in configuration reference and navigation guides.
- Added customizable language tag display styles for code blocks (badge vs header).
- Injected user settings via body data attribute for clean CSS-driven styling.
- Wrapped modal.html contents in a block-level wrapper div to prevent Kramdown from wrapping in <p> and HTML-escaping tags.
- Cloned heading nodes in the TOC generator script to clean up typewriter cursors and fallback words.
- Implemented optional top header bar layout with glassmorphism styling and custom link alignments.
- Implemented three new TOC design modes (simple, lines, nodes) and three density settings (compact, default, relaxed).

## [1.16.6] - 2026-06-13

### Feature Additions
- Added page-level opt-in search defaults.
- None.
- Enabled Font Awesome config flags.
- context-source/extended-knowleadge-lessions-lerned-building-zero-dark.md
- context-source/extended-knowleadge-lessions-lerned-building-zero-dark-v1.md
- Search providers selection block under theme_settings.search in _config.yml.
- Dynamic Liquid search index generator (search-index.json).
- Custom, uniform search interface (modal input and results drawer) for Lyra and Algolia.
- Complete search configuration guide in docs/search.md.
- Fixed .gitignore rule that mistakenly ignored assets/js/vendor/ folder.
- Global animations toggle system in _config.yml.
- Page load fade-in animations.
- Hover transition and scale effects on buttons, tags, cards, and callouts.
- prefers-reduced-motion CSS media query handling.
- Morphing social icon animation in sidebar.
- footer-2col, footer-3col, footer-item components.
- Advanced installation doc.
- theme_settings typography configuration.
- Fixed Liquid include syntax error in footer columns.
- Re-aligned and offset subtext under the title in the inline branding layout when a logo image is present.
- Improved spacing and rendering of the stacked and split branding layouts.
- Configurable sidebar branding layouts (inline, stacked, split).
- High-fidelity interactive landing page layout at docs/splash.md.
- Ability to toggle line numbers on code blocks with full styling.
- Dynamic column support and YAML data loading in feature-grid.html.
- Dynamic JSON endpoint docstats.json compiling counts and tag metrics.
- Component dependencies.html include displaying linking package badges.
- Figure/Caption semantic image wrapper component with alignments and link support.
- Progress/Steps Bar indicator for onboarding or multi-part tutorials.
- Site Stats metrics component displaying posts, tags, categories, words, and reading time.
- Automatic developer libraries setup check in CI.
- DataTable include with sorting, filtering, and pagination support.
- Timeline vertical chronological event list include.
- Tag Cloud pill list include scaled dynamically by post count.
- Modal accessible overlay dialog with full keyboard focus traps.
- Add icon-grid.html and _icon-grid.scss.
- Document component in docs/components/icon-grid.md.
- Add copy-button.html and _copy-button.scss.
- Document component in docs/components/copy-button.md.
- Add metrics.html and _metrics.scss.
- Register System Metrics Grid component in navigation.
- Document component in docs/components/metrics.md.
- Add tooltip.html and _tooltip.scss.
- Register Context Tooltip component in navigation.
- Document component in docs/components/tooltip.md.
- Add tree.html and _tree.scss.
- Register Directory Tree component in navigation.
- Document component in docs/components/tree.md.
- Add feedback.html and _feedback.scss.
- Integrate feedback widget into default layout and site configuration.
- Document component in docs/components/feedback.md.
- Add announcement.html and _announcement.scss component.
- Integrate announcement banner into default layout and site configuration.
- Document component in docs/components/announcement.md.
- Add kbd-group.html and kbd.html components.
- Add _kbd.scss stylesheet.
- Document components in docs/components/kbd.md.
- details.html collapsible disclosure component.
- details.md documentation page and navigation entry.
- Inline version tag inside the sidebar logo link.
- Sidebar version badge.
- Customizable foot.html footer partial.
- Added list of 10 proposed components to dev-notes.md.
- Custom pure-SVG charting engine extensions.
- Comprehensive interactive and static charting documentation.
- Custom container execution environment for GitLab CI/CD.
- Checked off picsum, documentation verification, and tone refinement tasks.
- Live layout example pages in the docs site.
- google analytics: Integration supporting `google_analytics` measurement ID in site configuration.
- link tracking: Automatic detection and logging of outbound link clicks and document/source downloads.
- previously-read: client history tracker storing visited pages in localStorage (capped at last 20 entries) and rendering a check-marked recently read list.
- image: Blur-up progressive loading, lazy loading, and custom border-radius support.
- carousel: Responsive sliding carousel viewport with custom height, slide indicators, and manual controls.
- heading anchor links: Hoverable anchor links next to all content section headings, supporting always-visible styling via `zd_headings_always_visible`.
- rendered-el-showcase: Visual frame wrapper for live UI elements with customizable title, icon, size, and a technical grid/line background.
- codepen: Easy inclusion of pens with user, height, theme and tab controls.
- codesandbox: Inclusion of full sandboxes with editable theme, view, and sandbox security settings.
- sponsored-by: Grid layout with grayscale hover effect, custom columns and branding.
- customer-callout: Glassmorphic cards with quote text, author info, avatar, and star rating.
- youtube: Privacy-respecting YouTube embed using youtube-nocookie.com and aspect ratios.
- iframe: Secure iframe wrapper with glassmorphic fade-out loader spinner.
- written-by: author profile card displaying name, avatar, bio, and social connections.
- last-edited: page edit timestamp tracking with configurable format and author info.
- Typewriter text component
- Shields.io badge component
- FAQ Accordion component
- Progress Bar component
- Custom HR divider component
- Direct ZIP download release package artifact
- Custom tag component with version styling support
- Text gradient styling component
- Inline callout variant component
- Sizing options and compact swatch mode for grid-palette component
- Centralized deployment section in navigation
- Theme Colors showcase page
- Tag component
- Gradient Text component
- Inline Callout component
- Added LaTeX mathematical expressions support
- Added Mermaid.js diagrams support

### Bug Fixes
- None.
- Fixed 404/MIME type mismatch blocks on Pagefind and Google Fonts CDN resources.
- Fixed mismatched theme lockfile dependency naming in docs Gemfile.lock.
- Restored Google Analytics script tags closing syntax in head.html.
- Fixed alignment issue where the branding text layout did not correctly render all three options.
- Scrubbed non-compliant terminology ('premium') from all documentation and styles.
- Prevent development GA pageviews from polluting production metrics.
- ci publish release - removed from tag-snapshots
- Excluded auxiliary headings inside components (e.g. metrics, tooltips, cards) from the Table of Contents.
- Renamed case-mismatched Gemfile to prevent Linux environment pipeline failures.
- Fixed Liquid include syntax evaluation bug inside comment headers.
- Suppressed Bundler root execution failure confusion and fixed gem native extension compile errors.
- Added ARIA describedby and screen-reader elements to the CSS tooltip include.
- Kramdown paragraph wrapping bug for inline includes.
- ci invalid docker image pointer (fix)
- ci invalid rule when using exerpt tags (fix)
- Restructured navigation and updated color palette output

### Notes & Improvements
- Set search indexing to opt-in by default to prevent index pollution.
- Filter search-index.json to only compile pages where enable_search: true.
- Conditionally apply data-pagefind-ignore to body tags in default and splash layouts for non-opt-in pages.
- Bulk inject enable_search: true to front matter of all existing documentation and component pages.
- Document page-level search opt-in metadata rules in search.md.
- Corrected Pagefind CDN URLs from non-existent /dist/ path to npm folder structures (css/ui.css and ui.js).
- Updated Pagefind script to load as an ES module, with fallback polling logic in default.html layout for async execution compatibility.
- Fixed Google Fonts v2 API family separator query parameter from old | pipe to standard &family=.
- Enable Font Awesome icons globally by default in root and docs configs.
- Rename internal theme reference in docs Gemfile.lock to match standard naming.
- docs: standardize headings and theme naming (components)
- chore: untrack dev-notes in favor of local tracker (workflow)
- Fixed spelling mistakes across workflow guidelines, search integrations, and extra components lists.
- Resolved and checked off the collections architecture decision task pointing to solution files.
- Removed non-compliant terminology ("premium") from view transitions and search comments.
- Corrected typos (such as "milti-line", "peform", "Intergrations", "caviats").
- Renamed gemspec to jekyll-theme-zero-dark.gemspec and updated spec properties (name, summary, description, homepage).
- Updated repository pointers to target zero-dark-jekyll-theme.
- Updated GitLab CI configuration packaging variables and script releases.
- Checked off completed naming tasks in dev-notes.md and added solution logs.
- Fixed incorrect repository links in footer.html and README.md.
- Creates context-source directory containing lessons learned reference files.
- Backfills extended lessons learned covering search integrations, Gitignore, case-sensitivity in CI, and WSL file locking issues.
- Adds support for three search providers: Pagefind (WASM), Lyra (Orama client-side), and Algolia (hosted).
- Supports CDN assets loading vs local self-hosted offline files caching.
- Creates a custom, zero-dependency lightweight local search client (zd-search-local.js) as a fallback.
- Corrects root .gitignore patterns to allow tracking of assets/js/vendor/.
- Implemented global animations config object under theme_settings with options to toggle page loads and hover effects individually.
- Added fade-in and slide-up page load animations for main content and sidebars.
- Created micro-animations on hover and active states for cards, callouts, badges, tags, and buttons.
- Integrated standard prefers-reduced-motion accessibility fallbacks.
- Provided global animation-reset stylesheets when animations are disabled in configuration.
- Updated documentation under configuration guide and checked off animations item in dev-notes.
- docs: check off completed tasks (dev-notes)
- Animates social media icons in the sidebar to morph from labels to logos.
- Implements responsive footer columns (footer-2col, footer-3col, footer-item) configurable via _config.yml.
- Adds collections sibling navigation architecture notice to the landing page.
- Introduces advanced installation guides covering source compilation and layouts.
- Adds user-friendly theme_settings typography controls to _config.yml.
- Renames Zero-Dark-SP branding references to Zero-Dark.
- Partition sidebar branding markup into top and bottom rows to enable precise alignment in inline, stacked, and split layouts.
- Remove all instances of the word 'premium' across SASS comments, layout structures, and documentation, replacing them with 'elegant', 'professional', or 'useful'.
- Mark resolved tasks in dev-notes.md.
- Expose theme_settings.logo.layout configuration.
- Implement inline, stacked, and split layouts for branding block.
- Design premium app variant landing page in docs/splash.md.
- Ensure Google Analytics is disabled in local development mode.
- Style and document Kramdown code block line numbers support.
- Synchronized VERSION file and docs/_config.yml with the output from Get-GitAutoVersion.
- Updated generateTOC in default.html to exclude headings that are child elements of component wrappers.
- Configured GIT_DEPTH: "0" in .gitlab-ci.yml to ensure full git history is fetched for correct SemVer evaluation.
- Marked Heading & TOC Refinement task as completed in dev-notes.md.
- Verified successful Jekyll build trace compiling.
- Renamed GemFile and GemFile.lock to lowercase Gemfile and Gemfile.lock.
- Documented the CI Gemfile location bug under the Bug Fixes section of dev-notes.md.
- Enhanced Feature Grid to support data-driven source files and custom column layout sizes.
- Added a dynamic site document stats JSON API endpoint.
- Created a component dependency mapping display badge with automatic links.
- Registered new components in the navigation structure and components gallery.
- Updated dev-notes.md task lists, marked completed tasks, and polished unchecked tasks wording.
- Verified successful Jekyll build with local trace.
- Silenced root execution warnings in Bundler.
- Restored jekyll build before_script with automatic Debian/Alpine compiler headers installation.
- Disabled before_script on build_gem to optimize build stage execution.
- Registered new components in navigation sidebar configuration.
- Added premium CSS animations, focus trapping, and ARIA attributes for modals and tooltips.
- Verified successful Jekyll local trace compiling.
- style: add descriptive liquid header comments and finalize checklist (comps)
- Created details.html collapsible block component using native HTML details/summary elements.
- Styled using the pre-existing zd-details and zd-details-content SASS classes.
- Created documentation in docs/components/details.md.
- Registered Details Dropdown in docs/_data/navigation.yml.
- Checked off details component in dev-notes.md.
- Moved the version tag inside the zd-logo anchor element.
- Configured the version tag to show a tag icon and highlight color.
- Checked off the sub-task in dev-notes.md.
- Added version tag display to the sidebar below the main logo (toggled via zd_show_version in config).
- Created a customizable foot.html placeholder in includes/core.
- Modified footer.html to include core/foot.html at the bottom of the page structure.
- Updated docs config and theme root config with version: 1.0.0 and zd_show_version: true.
- Checked off tasks in dev-notes.md and populated 10 proposed components.
- Collapsed button.html, tag.html, shield.html, simple-icon.html, and font-awesome.html onto single physical lines.
- Prevents Kramdown from inserting paragraph blocks inside paragraphs when includes are used inline.
- Extended svgcharts.html with zero-JS support for polarArea, radar, scatter, and bubble charts.
- Programmed circular sector calculation using dynamic rotation transformations.
- Implemented trigonometric lookup tables for radar charts supporting 3 to 7 variables.
- Programmed Cartesian coordinates (x:y and x:y:r) scaling for scatter and bubble charts.
- Updated documentation in docs/components/svgcharts.md and docs/components/chartjs.md.
- Set base executor image to phellams-automator for consistent pipelines.
- Standardized job templates for test, build, deploy, and release stages.
- Checked all includes/comps components for corresponding docs/components pages (100% covered).
- Refined description texts to use professional/technical tone instead of informal phrasing (removed 'simply', 'easy').
- Updated checklist in dev-notes.md.
- Created example pages for blog-list, metrics, portfolio, space, and splash layouts.
- Updated layouts.md to reference live layout previews.
- Modified blog-list layout to output content at the top for custom overlays/buttons.
- Marked layouts, markdown theme, and api-ref tasks as completed in dev-notes.md.
- Added styling rules for inline code blocks (background, padding, borders).
- Added styling rules for keyboard tags (`kbd`) simulating keys.
- Configured left accent border and italic text for blockquotes.
- Styled standard Markdown tables with custom padding, borders, headers, and striping.
- Documented keyboard shortcuts styling additions in docs/markdown.md.
- Renamed api-ref component and stylesheet to command-ref to better target CLI documentation.
- Created api-reference component and stylesheet for REST/web API documentation.
- Documented both components under docs/components.
- Updated docs/components/index.md and docs/_data/navigation.yml.
- Added svgcharts.html component for zero-JS server-side data visualizations.
- Programmed bar, line, pie, and doughnut charts rendered completely in SVG.
- Created dynamic legends and calculated percentage offsets for circular charts.
- Documented component usage in docs/components/svgcharts.md.
- Registered component in docs/_data/navigation.yml.
- Added chartjs.html component utilizing Chart.js CDN for interactive canvas charts.
- Configured default ZeroDark style themes (colors, borders, grid opacity, typography) on charts.
- Added support for line, bar, pie, doughnut, radar, and polarArea charts.
- Support sourcing datasets directly from site.data YAML files.
- Documented usage in docs/components/chartjs.md and registered in navigation.yml.
- Checked off all newly implemented extended components and features in dev-notes.md.
- Added Google Analytics 4 script tag in core/head.html.
- Added automatic outbound link and file download click tracking event listeners.
- Documented settings and auto-event tracking in docs/configuration.md.
- Added previously-read component for local history tracking.
- Added page visit logging in default layout client script.
- Documented component in docs/components/previously-read.md.
- Added image component with blur-up Progressive Loading.
- Added carousel component for sliding image decks.
- Documented both components in docs/components.
- Registered both components in docs/_data/navigation.yml.
- Added heading hover anchor links in default layout.
- Configured anchor links visibility toggle in site settings.
- Documented feature in docs/components/heading.md.
- Added rendered-el-showcase component for rendering live UI examples.
- Documented the component in docs/components.
- Registered the component in docs/_data/navigation.yml.
- Added codepen component for interactive CodePen iframe embeds.
- Added codesandbox component for embedding CodeSandbox dev boxes.
- Added sponsored-by component for rendering sponsor/partner logos.
- Added customer-callout component for rendering testimonials.
- Added youtube component for privacy-respecting YouTube embeds.
- Added iframe component with a skeleton loader.
- Added written-by component for author profile display.
- Added last-edited component for tracking file change timestamps.
- Added typewriter.html for text typing animations
- Added shield.html for Shields.io badges
- Added faq.html and faq-item.html accordion panels
- Added progress.html for percent-complete bars
- Added hr.html for solid/gradient horizontal rules
- Documented all new components under docs/components/
- Restructured navigation and updated dev-notes.md checklist and grammar
- Updated README.md with local build steps and Direct ZIP download links
- Modified .gitlab-ci.yml to package release as generic ZIP asset and attach to Git Release
- Final release for ZeroDark SP theme version 1.0.0
- Updated dev-notes.md and set the release version to 1.0.0
- Commit all base includes, layouts, sass, and assets
- Commit base documentation and deployment guides
- Documented tag, gradient-text, and inline-callout components
- Updated grid-palette documentation for swatch and icon modes
- Created theme-colors.md to showcase the branding palette
- Documented Mermaid.js and LaTeX integration in customization.md
- Restructured navigation.yml to make Deployment a top-level section
- tag.html component for custom version/badge labels
- gradient-text.html component for linear-gradient text styling
- inline-callout.html component for compact admonitions
- Expanded grid-palette.html to support swatch mode and icons
- Centralized styles for version tags and text gradients in _components.scss
- Compact swatch styling added to _color-blocks.scss
- Conditionally load KaTeX and Mermaid scripts in head.html
- Initialize Mermaid in default.html layout
- chore: adding tools - script files
- config: adding npm config files
- license: Add or update license.
- Initial commit
