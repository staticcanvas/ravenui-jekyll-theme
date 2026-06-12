# ZeroDark SP - Development Notes - And WorkFlow Instuctions

---

**TASKS!** - work through tasks items if task is not apart of its proper category make sure to add it to the correct category some defaults catagories are: Bug Fixes, Issues Remaining, Features, Enhancements, Documentation, and Refactoring.
    - If a task item has more to it of is incomplete of implimation is not the best or its the simple way or advance way add a `> **After Thought**` or `> **Note!**` comment with notes

**SKILL!** - Use Skill `fluent-ui` for all tasks, fluent is a modern ui Specialized Agent for web Development for Staticcanvas.

**MCP!** - Use `gitlab` for interations with gitlab.
    - main branch is `main`
    - develop branch is `develop`
    - feature branches are `feature/*`
    - fix branches are `fix/*`
    - hotfix branches are `hotfix/*`
    - release branches are `release/*`
    - create a new branch from `develop` and name it `feature/my-feature` 
    - create task with group avabile labels if need new create new label
    - create milstone to group tasks
    - close tasks when done
    - create a new task for each issue
    - add a comment to the issue with the task id
    - assign to use `sgkens`

****
---

## Issues Remaining
- [x] **Mobile TOC Visibility:** The TOC button is clickable on mobile, and the container now displays correctly with a glassmorphism effect and proper positioning. Fixed via `_layouts/default.html` and `_sass/zero-dark-sp/_toc.scss`.
- [x] **Example Code Rendering:** Implemented `example-block.html` to support captured Markdown content. This provides a much better DX for documenting multi-line code examples.
- [x] **Configurable Edit Button:** Implemented a unified `repository` configuration in `_config.yml` supporting GitHub, GitLab, Bitbucket, and Codeberg. Added support for "vscode" mode (GitHub.dev and GitLab Web IDE). Updated `_includes/core/footer.html` with dynamic logic.
- [x] **Seamless Sidebar Scroll:** Re-implemented scroll persistence with an early-execution inline script. This eliminates flickering by setting the scroll position before the first paint.
- [x] **Card Index Navigation:** Implemented `card-index.html` which utilizes `site.data.navigation` to generate visual navigation cards with titles, icons, and descriptions.
- [x] **Includes Organization:** Refactored `_includes/` into logical subfolders (`core/`, `comps/`, etc.) for better DX and modularity.
- [x] **Navigation.yml Cleanup:** Consolidated component links and verified all URLs. Structure is now lean and logical.
- [x] **Headings & TOC Flow:** Performed a global audit and promoted headings (H3 -> H2) across major docs to ensure a consistent H1 > H2 > H3 hierarchy for accurate TOC generation.
- [x] **Blog/Posts Index:** Finalized a high-density, linear blog list layout (`_layouts/blog-list.html`) with metadata (author, date, tags) and descriptions.
- [x] **Folder Rename:** Renamed `_includes/components` to `_includes/comps` and updated all 100+ references codebase-wide.
- [x] **Component Documentation (Atomic 1:1 Mapping):** Every component in `_includes/comps/*.html` has a corresponding `docs/components/*.md` file.
    - [x] Verified 1:1 mapping for all 22 includes (including sub-components like `roadmap-item`).
    - [x] Consolidated "Stylized Markdown Lists" into `docs/markdown.md`.
    - [x] Removed redundant `docs/components/visual-elements.md`.
- [x] **Navigation Architecture:** Grouped components into logical categories in `_data/navigation.yml` (Display, Elements, Interactive, Data).
- [x] **Component Index:** Expanded the gallery in `docs/components/index.md` to showcase all 4 component categories.
- [x] **Final Visual Audit:** Completed full pass on all 22 component pages; verified consistency in API tables and examples.
- [x] **Test Build:** Successfully verified project integrity with `bundle exec jekyll build`.
- [x] **Search Integration:** Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: Wasm-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia). make sure all are configured and working and have corrisponding docs.

## UI Adjustments
- [x] **Fluent UI Refinement:** Applied visual polish to splash components (cards, buttons, terminals) including subtle elevations, refined borders (`color-mix`), and scale-based interactive states.
- [x] Implement custom scrollbars for main content and sidebars.
- [x] Refine Checkbox accessibility (focus rings, disabled states).
- [x] Standardize focus-visible rings across all interactive elements.
- [x] Add smooth transition to sidebar backdrop-filter on toggle.
- [x] Reduce hero headings padding.
- [x] Comprehensive documentation update (all features, details dropdowns for code).
- [x] Implement `grid-palette` component for showcasing color palettes.
- [x] Reduce sidebar navigation item vertical padding.
- [x] Configurable sidebar navigation padding via `_config.yml` (compact, tight, comfy, spacy).
- [x] **Standardized Design System:** Added Fluent UI-specific variables to `_sass/zero-dark-sp/_root.scss` (Elevations, Radius, Transitions).
- [x] **Headings and Hero:** Added configurable `zd_nav_spacing` (compact, tight, comfy, spacy) support to headings (h2, h3) and hero sections via `head.html` and SCSS variables.
- [x] **Code Blocks:** Fixed copy button and language labels overlap by moving the language label to the left and copy button to the far right.
- [x] **Code Blocks:** Ensured code blocks are centered on mobile by setting `margin-inline: 0` and `width: 100%` in mobile media queries.
- [x] **Tags Pastel Color Palette:** Introduced a subtle pastel color palette for tags (`.zd-tag--blue`, `--purple`, etc.) with matching borders for improved readability.
- [x] **Card-Index:** Component styling is fixed; display layout is now clean and logical.
- [x] **Code Blocks:** Language label compact spans overlapping with copy button fixed; added slight margin/padding above the highlight div.
- [x] **Grid-Palette:** Outputs color from YAML captured in the include successfully.
- [x] **Grid-Palette:** Adjustable to allow grid palette of colors with a custom size (e.g. 12px or 24px), setting the size of the grid, and grid palettes for apps, devices, etc.
- [x] **Grid-Palette:** Showcases theme color palette on a new showcase page and navigation route.
- [x] **Deployment:** Moved menu object location in sidebar to its own top-level title header.
- [x] **Color-Block:** Designed as a single line of code to render inline inside tables and other elements without breaking layout flow.
- [x] Git tags and releases tags are separated logically.
- [x] Layout documentation updated in the docs.
- [x] Added sidebar section separators and section titles that flow with the theme.
- [x] **Extended Color Palette:** Integrated palette colors (Viridian, Note, Warning, Danger, Black, Void, Ink, Slate, Steel, Mist, Smoke, Ash, Silver, Ghost, White) and custom border colors in `_root.scss`.
- [x] **Typography Headings:** Set `h1` to Fraunces 400, `h2` to Fraunces 500, and `h3` to IBM Plex Sans 500.
- [x] Added `inline` parameter to component callout to support inline callout bubbles.
- [x] Added robust text color, gradients, borders, font size, and font weight utility classes to Liquid IRL guide.
- [x] Fixed empty space after footer content causing unwanted bottom scrolling.
- [x] Correctly mapped tags and release data lists from YAML data sources.
- [x] Added examples for all utility CSS classes inside Liquid IRL guide.
- [x] Restructured Deployment section to have its own sidebar menu category.
- [x] **Button Component:** Added button examples (GETTING STARTED, VIEW SOURCE, EDIT THIS PAGE) supporting colors, sizes, icons, borders, and border-radius.
- [x] Added "Powered by ZeroDark SP" footer link with optional visibility toggles.
- [x] Added icon to releases menu item.
- [x] Updated color-grid layout to support custom grid spacing and the extended color palette.
- [x] **Gradient Text:** Implemented `gradient-text.html` component and documented usage.
- [x] **Mermaid.js Integration:** Added native support for Mermaid.js diagrams and documented it.
- [x] **LaTeX Math Integration:** Added KaTeX math expressions support and documented it.
- [x] **Inline Callout:** Added `inline-callout.html` component and documented it.
- [x] **Version Tag Component:** Created `tag.html` component with dedicated semantic release tags (`beta`, `rc`, `release`, `major`, `version`).
- [x] **Splash Page Layout**: Design a professional, informative, useful, and elegant splash page. ZeroDark SP is a highly involved theme, extending beyond just standard documentation (approaching the versatility of daisyUI). Since the splash page is the first page a user sees, it should showcase the theme's features, layout options, and aesthetic range in an elegant way.
- [x] **animations** - add suttle animations to components like callout, badges, tags, heros, cards, that would make sence but not too distracting, page loads and transitions, and scrolls. set a object in global config that can be used to enable or disable animations.

## Search Intergrations
- [ ] **pagefind** - Pagefind js and css local files, we use the same logic for fonts and allow local or cdn for maximum compatability 
- [ ] **Search Integration:** Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: Wasm-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia). make sure all are configured and working and have corrisponding docs.

## Extended Components and Features
- [x] **Progress Bar:** Implemented progress bar component and documented it.
- [x] Written-by component.
- [x] svgcharts component - support for line, bar, pie, doughnut, radar, polar area, bubble, also support sourcing from site.data.placeholderName and scatter charts, update docs to reflect feature.
- [x] chartjs component - support for line, bar, pie, doughnut, radar, polar area, bubble, also support sourcing from site.data.placeholderName and scatter charts, update docs to reflect feature.
- [x] other well known charting libraries, maybe we can make a generic chart component that can be used for any charting library, update docs to reflect feature.
- [x] codepen component - allows users to embed CodePens with ease, update docs to reflect feature.
- [x] code sandbox component - allows users to embed CodeSandboxes with ease, update docs to reflect feature.
- [x] youtube component - allows users to embed YouTube videos with ease, update docs to reflect feature.
- [x] sponsored-by component - allows users to add a sponsored by section with logo and link to sponsor, update docs to reflect feature.
- [x] customer callout component - users that have used the product and liked it.
- [x] new component: last edited. Should have the last edited date and author. This can be enabled in _config; defaults to showing edited date and time.
- [x] image component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] iframe component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] rendered-el-showcase.html - wraps the element in another element with an SVG containing tilted vertical lines, a title, and logo as an example of rendered code. We allow users to specify title name, size, and icon.
- [x] headings "link" anchor invisible by default, user can enable always visible in _config, update docs to reflect feature.
- [x] previously read: a localStorage-backed page tracker that can be used to show users which pages they have already read, update docs to reflect feature.
- [x] enable Google Analytics and update docs to reflect feature.
- [x] enable posting to Google Analytics when a user clicks on a link, update docs to reflect feature.
- [x] **Shields.io Badges:** Implemented shield component and documented it.
- [x] **Badges Component:** Supported via the new customizable tag and shield components.
- [x] Image carousel component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] **Typewriter Component:** Implemented typewriter component and documented it.
- [x] **FAQ Accordion:** Implemented FAQ component and FAQ item component, and documented usage.
- [x] Make sure all markdown elements are themed correctly to match the theme, update docs to reflect feature.
- [x] change api-ref to command-ref; create a new component called api-reference which can be used for traditional API documentation akin to web (not CLI).
- [x] Example pages for all the different layouts. These do not need to be in the menu; just a page and a button going back to the previous page.
- [x] **Custom HR:** Implemented `hr.html` component supporting gradient lines and centered text/icons.
- [x] **version tag** - add version badge to the top of the page perhaps after // DOCS SubText use our existing version tag component, enable via _config. update documents to reflect
    - [x] change badge location to inside logo so it appears inline after // DOCS SubText, add icon and color, update docs to reflect
- [x] **foot.html** - Extend the footer to include a _includes/core/foot.html partial, which can be used to add custom content to the bottom of the page. This can include links to social media, copyright information, or other relevant details. The footer is currently hardcoded to include the copyright and social media links, so this would need to be updated to accommodate any additional content.
- [x] Collapsible details/summary block component for optional content folding.
- [x] Keyboard shortcuts group component to render standard KBD keys side by side.
- [x] Full-width viewport alert/announcement banner component for site-wide alerts.
- [x] Standalone copy-to-clipboard button component for arbitrary inline text blocks.
- [x] Icon showcase grid component to present groups of icons with copy triggers.
- [x] Dynamic feedback widget component ("Was this page helpful?") with analytics hooks.
- [x] CSS-based file directory tree diagram component to showcase project layout structures.
- [x] Pure-CSS context tooltip component for definitions and abbreviations.
- [x] High-density system metrics container component to group metrics/stats cards.
- [x] **Releases/Tags:** Resolved access problems fetching YAML data.
- [ ] **Consistency Audit**: Walk through each documentation page and compile a detailed log of visual inconsistencies, bugs, potential fixes, and design improvements.
- [ ] **Quality of Life (QOL) Audit**: Perform a deep dive into QOL components, configuration options, and documentation to identify and implement missing user-experience improvements.
- [x] **DataTable** - Component that can be used to display data in a table format, with sorting, filtering, and pagination. source: `_data/table1.json`|`data/table2.yaml` | `_data/table3.csv`, Structured data injection. 
- [x] **Tag Cloud** - Renders all site tags sized by post count. Links to filtered index pages.
- [x] - **Modal / Dialog** Accessible dialog overlay. Focus trap, ESC close, aria-modal. Content via include slot.
- [x] **Site Stats**: Auto-calculated counts: posts, tags, categories, words, reading time. Displayed in about/meta pages.
- [x] **Figure / Caption** - Semantic figure+figcaption. Supports alignment (left/right float, full-width). Optional link.
- [ ] **OG Image Generator**: A Jekyll plugin or template that auto-generates social sharing images containing the post title, category, and date.
- [x] **Progress / Steps Bar** - Visual step indicator for multi-part tutorials or onboarding. Active, complete, upcoming states.
- [ ] **Component Liquid Comments**: Add descriptive Liquid comments to the top of all component files explaining the component's purpose, caveats, and usage examples, and update the documentation accordingly.
    ```liquid
    {%- comment -%}
    Component__: System Metrics Grid
    Purpose____: Displays a high-density grid panel of color-accented KPI and metric cards.
    Caveats____: Output must remain collapsed on a single line to prevent Kramdown paragraph wrapping.
    Usage______: {% include comps/metrics.html items=page.metrics_data grid_size="180px" %}
    {%- endcomment -%}
   ```
- [x] **Tooltip** - Hover/focus tooltip via CSS or JS. Placement auto-flip. ARIA-described.
- [x] **Feature Grid**: A grid component (2-4 columns) showcasing icons, titles, and descriptions, sourcing its items from page front-matter or a YAML/JSON data file.
- [x] **Timeline** - Vertical chronological list. Each entry: date, heading, body. Reads from YAML.
- [x] **Component Dependency Mapping**: Since many components depend on others, document these dependencies in Liquid comments and documentation. Optionally, define dependencies in the front-matter YAML header of components and render them beautifully using a dedicated dependency component.
- [x] **Heading & TOC Refinement**: Ensure the Table of Contents (TOC) only picks up headings from the main article content rather than auxiliary headings inside widgets or layout components.
- [x] **CI-Bundler-Issue** - bundler before script dont like to be ran as root, ive remove the before script for global scope and attched it to build stage. unsure how to fix this. this is causing build to fail - source bundler docs and find fix.
- [x] **Document Count Metrics**: Create a new automatic JSON data endpoint (`docstats.json`) showing the document count metrics of the site.
- [x] **Search Integrations**: Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: Wasm-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia).
- [ ] **Static Page Feedback**: Support static page likes, comments, and reviews.
- [ ] **Visual Statistics**: Render site stats using visual charts.
- [ ] **Pneumatic / Numeric UI Elements**: Integrate subtle pneumatic micro-animations and numeric tickers for stats.
- [ ] **Component Reusability Pass**: Refactor complex layout snippets into modular components and expose utility grids for layout composition.
- [x] **Sidebar Branding Layouts**: Expose three configurable layouts for the sidebar logo, title, and subtext.
    - [x] **Resolved**: Partitioned branding elements into top and bottom rows with styling offsets to ensure `inline`, `stacked`, and `split` layouts align dynamically and display elegantly.

- [x] **Morphing Social Icons**: Animate social media icons so they morph smoothly from text labels to simple icon logos.
- [ ] **TOC Custom Designs**: Implement three TOC styles (lines, nodes, simple/default) configurable in `_config.yml`, along with customizable font sizes.
- [x] **Dev/Prod Switch — Environment Flags** - Prevents PostHog or Google Analytics from polluting production metrics.
- [ ] **Minification** - Minification only runs in CI. Add to the CI step alongside linting — but be mindful that linters may break Liquid syntax that requires single-line formatting. Icons and other elements nested inside other elements will break if their HTML spans multiple lines. There are workarounds, but I prefer to note this directly in the component documentation, as I have done with almost all components, so developers can read and understand why.
- [x] **Footer Layout — `footer-2col`, `footer-3col`, `footer-item`** - Allows construction of footer sections using discrete items: links, icons, logos, images, iframes, badges, and more. Using `footer-item` to specify the target column enables seamless footer construction that matches the style of professional sites — whether simple or detailed. These components should appear before the licence and "powered by" section.
- [x] **Introduction Page** - The introduction page needs to be informative and clearly written. Include a notice that Zero Dark was purposefully designed not to support collections siblings — this is intentional, not an oversight.
- [x] **Quick Start + Advanced Installation** - Provide a quick-start guide alongside an advanced installation path. Advanced options should cover: building from source, cloning the repo and replacing or editing docs, changing the folder structure, and using the Zero Dark docs implementation to build a site — for users who don't want the default docs website. Consider a summary page for advanced installation with a link to an in-depth page covering working directly with the repo.
- [ ] **Extend Zero Dark — `zerodark-sp` Developer Guide** - A dedicated developer guide covering the full Zero Dark folder layout and extension points.
- [ ] **Collections Support — Architecture Decision (Unresolved)** - wasn't going to support collections natively. The plan was to fork Zero Dark on release and build a collections-focused variant. The question is whether to include collections support in `zerodark-sp` to avoid near-duplicate codebases, or whether a separate theme is still the better move. Unresolved — needs a decision before release.
- [x] **Rouge Code Blocks — Line Numbers** - Give users the ability to enable line numbers on code blocks.
- [x] **Theme Configuration via `_config.yml` — `theme_settings` Object**  - Give less technically inclined users — or those who prefer not to edit CSS directly — an easier path to theming. Expose a `theme_settings` object in `_config.yml`. Include a full colour palette for users who want detailed control. Design the interface to be as simple and intuitive as possible for end-users and developers alike. Be mindful of what to expose: give enough control to meaningfully change the theme, but make it difficult for users to accidentally break it during customisation.
- [x] **Typography Configuration via `_config.yml`** - Provide a curated font collection — either bundled or loaded via CDN. Allow users to specify a font for each heading level (`h1`–`h6`), paragraph text, code blocks, and tables directly in `_config.yml`, including size and weight. Generate a Liquid URL for font names when a CDN font is enabled. For more advanced typography control, also allow separate font settings for: bold, italic, underlined text, ordered lists, unordered lists, table headers, and table body — and any other elements worth exposing.
- [ ] **Unexplored Jekyll Features** - Audit Jekyll's full feature set for anything not currently used that could improve the theme or enable a new feature worth adding.
- [ ] **Documentation Requirement — All of the Above** - For every item above: if it results in a new component, ensure `docs/components` has a corresponding component page. For all other updates, ensure the documentation reflects the change.
- [ ] **collection support**Add collection support to Zero Dark with a feature flag — collections: false by default. Users who don't need it see nothing different. Users who do get first-class support without a separate fork to maintain. The _data/navigation.yaml system stays as the manual/curated path. They coexist.
  - Full Collections Support
     - Collection indexes
       - [ ] Grid
       - [ ] List
       - [ ] documents
       - [ ] posts
       - [ ] blog
       - [ ] api
       - [ ] data
       - [ ] commands
       - [ ] apps/cli/module/tool
       - [ ] Add Others that would work and be usfull
- [x] **Rename Theme** - Because we no longer need the second theme Zero-Dark-MP, we can rename to "Zero-Dark" in readme and docs use Zero-Dark Jekyll theme.
- [x] **Remove words like 'premium'**: Replaced 'premium' with 'elegant', 'professional', or 'useful' across all SASS comments, layout files, and documentation pages.
- [ ] aswell as the three colour layout, we should give the user the ability to have a header bar and allow data.navheader user can add addition navitems view on gitlab badges chamge orientation from left to right or middle 

- [ ] Some additions layouts that can blog, ariticals, blank

Live componenents api endpoints fetch and display data, free server ice, make sure wr cache for maximum performance and less git rate.

- [ ] fetch abd receive data from thetvgb, themdb, free anime meta data, warhammer if any, other userfull meta data providers that are free to use.
- [ ] media details  - display indicate details, make it robust so it can support music and and other possible like anime warhammer
- [ ] media card, supports custom properties 
- [ ] related carousel perhaps we use existing, 
- [ ] components to make info sites like animecharts or warhapper infor/wikki things of that nature
- [ ] spinners for dynamic components - themed to match - cool fetch animation.
- [ ] we could put these under extra components.

## Bug Fixes
- [x] **Ruby 3.4 Compatibility:** Fixed Gemfile to include `csv`, `base64`, and `bigdecimal` gems which were removed from the Ruby 3.4 standard library.
- [x] **Liquid Syntax Fix:** Resolved invalid `include` tag nesting in `docs/components/api-ref.md`.
- [x] **Navigation Sync:** Added `docs/releases.md` to `_data/navigation.yml` under "Components".
- [x] **Permalink Conflict:** Resolved duplication by removing `docs/blog/index.md` in favor of `docs/blog.md`.
- [x] **Unwanted Spacing:** Removed blank scrolling whitespace below the footer.
- [x] **CI Gemfile Location Bug:** Fixed GitLab CI `test_build` job failure where Bundler threw `Could not locate Gemfile`. This was caused by the files being named `GemFile` and `GemFile.lock` with a capital `F`. In case-sensitive Linux CI docker environments, Bundler was unable to find them. Resolved by renaming the files to lowercase `Gemfile` and `Gemfile.lock`.


       

--- 

> The **collections architecture decision** is the one I'd suggest resolving early — it has a knock-on effect on the `zerodark-sp` guide scope and whether the fork ever gets maintained in parallel. Worth a short decision note even if just to record "decided: separate theme, reason: X."

> The **`theme_settings` object** is a strong QOL feature — worth sketching out the key names before implementing so the public API is clean from the start rather than retrofitted.

*Solution to the Collections Architecture Decision: Consulted a another web enginneer claude 4.8* 

Here's the honest case.

---

**Your `_data/navigation.yaml` approach is clever, but it's fighting Jekyll rather than using it.**

What you've built is essentially a manual collection — you're storing structured content metadata in YAML, iterating over it with Liquid, and outputting index pages. That works, and for small, stable content it's fine. But here's where it starts costing you:

**You lose `site.posts`-style filtering for free.** Tags, categories, date sorting, pagination — all of that is built into collections. Your YAML approach means you're reimplementing that logic manually every time a user wants a filtered index. That's complexity you're pushing onto the site builder, not absorbing in the theme.

**Content and metadata are split.** With your current approach, a user creates a page *and* has to register it in `navigation.yaml`. Two files, two places to keep in sync. They will get out of sync. Non-technical users will absolutely get out of sync.

**You're already almost there.** You said it yourself — "not quite but almost." That gap is exactly where users hit friction. If they expect collection behaviour and get 80% of it, the 20% they're missing feels like a bug, not a design decision.

**The fork plan has a real cost.** Maintaining two themes that are structurally similar means every bug fix, every QOL improvement, every font config update gets done twice — or one fork quietly falls behind. That's a maintenance burden that compounds. Most dual-theme projects end up with one abandoned variant within a year.

---

**The honest counter-argument in your favour:**

Collections do add complexity to the theme internals. Pagination, `jekyll-paginate-v2` config, collection-scoped front-matter defaults — it's real work, and it makes `_config.yml` more involved for users who don't need it. Your YAML approach genuinely is simpler for purely static, manually curated sites.

---

**My frank recommendation:**

Add collection support to Zero Dark with a feature flag — `collections: false` by default. Users who don't need it see nothing different. Users who do get first-class support without a separate fork to maintain. The `_data/navigation.yaml` system stays as the manual/curated path. They coexist.

You avoid the fork, you avoid the maintenance split, and the theme becomes genuinely capable rather than "almost."


## View Transitions
- [x] **Page Transitions:** Basic view transition support implemented for seamless page navigation.
- [x] **Component-Level Transitions:** Enhanced the search modal with a premium, spring-based animation (`translateY` + `scale`). Standardized transition variables in `_root.scss`.

## Docs
- [x] **Component Discovery:** Consolidated all component documentation under the "Components" section in the sidebar. Added `Component Index` for better overview.
- [x] **Liquid IRL Guide:** Created `docs/liquid-irl.md` demonstrating how to use theme-specific CSS utility classes.
- [x] **Specialist Layouts:** Implemented "Portfolio", "Metrics/Stats", and "Hero Showcase" templates.
- [x] **Releases & Tags Documentation:** Created `docs/releases.md` with usage examples for `releases.html` and `tags.html`.
- [x] **picsum** for show casing images in the docs use https://picsum.photos/200/300 for random images

## Release Hardening
- [x] Check comps/* components that do not have corresponding docs/* documentation pages.
- [x] Refine documentation sections to make them clear, robust, and technical.
- [x] Remove any loose tone, focusing on professional and robust documentation.
- [x] Check CSS, JS, and Liquid for any unused code, for components, add a milti-line liquid comment to the top of the file explaining component purpose, caviats, and usage, update docs to reflect
- [x] peform additional polish.
- [ ] Deployment of theme to RubyGems.
- [ ] Deployment to third-party Jekyll theme directories.
