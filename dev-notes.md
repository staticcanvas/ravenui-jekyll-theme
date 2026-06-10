# ZeroDark SP - Development Notes

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

## Extended Components
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
- [x] **foot.html** - Extend the footer to include a _includes/core/foot.html partial, which can be used to add custom content to the bottom of the page. This can include links to social media, copyright information, or other relevant details. The footer is currently hardcoded to include the copyright and social media links, so this would need to be updated to accommodate any additional content.
- [ ] **10 Proposed Components (Selection Phase)**:
    - [ ] Collapsible details/summary block component for optional content folding.
    - [ ] Keyboard shortcuts group component to render standard KBD keys side by side.
    - [ ] Code switcher tabbed component (e.g. npm, bun, yarn, pnpm tabs).
    - [ ] Full-width viewport alert/announcement banner component for site-wide alerts.
    - [ ] Standalone copy-to-clipboard button component for arbitrary inline text blocks.
    - [ ] Icon showcase grid component to present groups of icons with copy triggers.
    - [ ] Dynamic feedback widget component ("Was this page helpful?") with analytics hooks.
    - [ ] CSS-based file directory tree diagram component to showcase project layout structures.
    - [ ] Pure-CSS context tooltip component for definitions and abbreviations.
    - [ ] High-density system metrics container component to group metrics/stats cards.

## Bug Fixes
- [x] **Ruby 3.4 Compatibility:** Fixed Gemfile to include `csv`, `base64`, and `bigdecimal` gems which were removed from the Ruby 3.4 standard library.
- [x] **Liquid Syntax Fix:** Resolved invalid `include` tag nesting in `docs/components/api-ref.md`.
- [x] **Navigation Sync:** Added `docs/releases.md` to `_data/navigation.yml` under "Components".
- [x] **Permalink Conflict:** Resolved duplication by removing `docs/blog/index.md` in favor of `docs/blog.md`.
- [x] **Unwanted Spacing:** Removed blank scrolling whitespace below the footer.
- [x] **Releases/Tags:** Resolved access problems fetching YAML data.

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
- [ ] Deployment of theme to RubyGems.
- [ ] Deployment to third-party Jekyll theme directories.
