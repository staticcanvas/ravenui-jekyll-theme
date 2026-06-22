# Jekyll Theme RavenUI - Completed and Archived Tasks

This file contains development tasks that have been completed and archived.

## **Archived on 2026-06-17 05:15:06**

### **Issues Remaining (priority-1)**
- [x] 🟢✅ **Project Rename** - RavenUI
  - RepoTitle: `ravenui-jekyll-theme`
  - gemtitle: `jekyll-theme-ravenui`
  - `rvcli` > `rvcli`
  - css vars `rd-` (short for raven-data)
  > ***NOTE!*** - **Solution:** Rebranded the repository, gem name, configurations, files, directories, and CLI tools from `zdcli` to `rvcli`. Updated all CSS variable and class prefixes to `rd-` (short for raven-data) as selected by the user.
- [x] 🟡🌟✅ **UI/TOC** - Add optional animations, page-load transitions, hover effects, and configurations to the Table of Contents (TOC).
  > ***NOTE!*** - **Solution:** Implemented `site.theme_settings.toc.animations` config flag, loaded `data-toc-animations` attribute on body, added CSS page-load fadeInUp and link-hover horizontal translations, and documented the feature in configuration and navigation references.
- [x] 🟢🌟✅ **UI/Codeblock** - Refine code block language highlights to either span the whole block header or render as a compact badge, controlled via configuration.
  > ***NOTE!*** - **Solution:** Implemented `theme_settings.code.lang_style` config option (`badge`, `header`) exposed via a body data attribute, allowing code block headers to render as a full-width top bar holding language names and alignment properties.
- [x] 🟢🌟✅ **UI/Codeblock** - Add support for line numbers in code blocks and custom horizontal scrollbars.
  > ***NOTE!*** - **Solution:** Supported standard Firefox scrollbars using standard `scrollbar-width` and `scrollbar-color` properties in `_sass/rogue/_ethereal.scss` alongside Webkit scrollbars.
- [x] 🟡🌟✅ **UI/Carousel** - Update the image carousel to use Lorem Picsum photos and custom captions.
  > ***NOTE!*** - **Solution:** Refined `/docs/components/carousel.md` example to query Lorem Picsum ID images.
- [x] 🟡🌟✅ **UI/Progress** - Hide progress bars by default, exposing a parameter to enable and configure progress levels.
  > ***NOTE!*** - **Solution:** Configured `roadmap-item.html` to hide progress bars by default, rendering them only when `show_progress=true` is passed.
- [x] 🟡🌟✅ **UI/GitTags** - Allow switching git tags displays between card grid layouts and clean lists.
  > ***NOTE!*** - **Solution:** Upgraded `git-tags.html` to accept a `layout` parameter that switches between the standard grid card display and a clean, list layout using `.rd-git-tags-list` and `.rd-git-tag-item` styles.
- [x] 🟢🌟✅ **UI/Scrollbars** - Implement custom scrollbars for main content and sidebars.
- [x] 🟡🌟✅ **CLI/GemDistribution** - Resolve how users invoke the CLI (`rvcli`) when using the theme as a Ruby gem. Package the executable with the gem and ensure it detects theme state so builders avoid manually running bundler, npm, or Jekyll commands.
  > ***NOTE!*** - **Solution:** Packaged `bin/rvcli` as a Ruby script wrapper inside the gem configuration so it works natively on Unix and Windows (wrapped by RubyGems). Added `tools/` and `rvcli.ps1` to the packed gem files list. Refactored the CLI's root detector to traverse up from the active console working directory instead of the script's installation directory to correctly find the user's project configurations.

### **Enhancements (priority-2)**
- [x] 🟡🌟✅ **UI/Navigation** - Implemented `card-index.html` which utilizes `site.data.navigation` to generate visual navigation cards with titles, icons, and descriptions.
- [x] 🟡🌟✅ **UI/Navigation** - Grouped components into logical categories in `_data/navigation.yml` (Display, Elements, Interactive, Data).
- [x] 🟡🌟✅ **UI/Colors** - Design and implement the color palette for DarkZero (the light theme variant for RavenUI), integrating it into the theme manager.
  > ***NOTE!*** - **Solution:** Implemented the "DarkZero" light theme variant under `[data-theme="light"]` in `_root.scss` and refactored typography, base styles, and keyboard/blockquote elements to dynamically adapt.
- [x] 🟢🌟✅ **UI/Header** - Introduce and add configuration options for a sticky top bar / header navigation.
  > ***NOTE!*** - **Solution:** Supported sticky header layout option under `theme_settings.header.sticky` with auto-adjusting sidebar spacing and offsets.
- [x] 🟢🌟✅ **UI/Navigation** - Add options for navigation bar layout densities (e.g., default and compact) following the theme's current spacing implementations.
  > ***NOTE!*** - **Solution:** Implemented layout density support under `theme_settings.header.density` (`compact`, `default`, `relaxed`) with custom height transitions, navigation gap sizes, and font scales.
- [x] 🟡🌟✅ **UI/Borders** - Allow adjusting border colors, types, and styles. Support solid, dotted, and gradient borders (linear or radial) to customize the visual feel while keeping current borders as default.
  > ***NOTE!*** - **Solution:** Added advanced styling capabilities under `theme_settings.borders` to override border style, width, color, and enable gradient borders.
- [x] 🟡🌟✅ **UI/Backgrounds** - Introduce advanced background styling options. Support gradient backgrounds with customizable directions, steps, and colors. Support a backdrop layer in front of background elements with configurable opacity and patterns.
  > ***NOTE!*** - **Solution:** Implemented background gradients and backdrop pattern overlays (`grid`, `dots`, `diagonal` patterns with custom opacity) in `theme_settings.background` applied via a body pseudo-element.
- [x] 🟡🌟✅ **UI/Animations** - Enable subtle, non-distracting background animations that do not disrupt the user's focus or reading flow.
  > ***NOTE!*** - **Solution:** Implemented background gradient shifting and backdrop pattern panning (`grid`, `dots`, `diagonal`) using CSS `@keyframes` that loop seamlessly.
- [x] 🟡🌟✅ **UI/Animations** - Add configurable page-load and navigation entry/exit animations (configurable via `_config.yml`).
  > ***NOTE!*** - **Solution:** Supported custom page load animations (`fade-in`, `fade-in-up`, `slide-in-left`, `zoom-in`) mapped via CSS custom properties and enabled browser-native cross-document View Transitions.
- [x] 🟡🌟✅ **UI/Animations** - Support external animation libraries (choose four of the best JS/CSS options) via feature flags, providing Liquid includes for all elements.
  > ***NOTE!*** - **Solution:** Provided full support for Animate.css, AOS, GSAP, and Anime.js. Created `_includes/comps/animate.html` to generate element classes/attributes, and loaded/initialized scripts in layout templates.
- [x] 🟡🌟✅ **UI/Branding** - Evaluate the two brand kits (first and second iteration). Determine if the second iteration (using the RavenUI 'Z' logo) is a better choice for the default branding.
  > ***NOTE!*** - **Solution:** Evaluated the first (text-only) and second (SVG block-based Z-mark) branding iterations. Selected the second iteration (Z logo SVG) as the default branding because it provides a modern, developer-centric identity that aligns with the high-contrast coding aesthetic. Copied the logo asset to `assets/img/logo.svg` and `assets/images/logo.svg` to ensure it is packaged within the theme gem assets and correctly referenced by default.
- [x] 🟢🌟✅ **UI/FocusRings** - Standardize focus-visible rings across all interactive elements.
- [x] 🟢🌟✅ **UI/Footer** - Added "Powered by ZeroDark SP" footer link with optional visibility toggles.
- [x] 🟡🩹✅ **UI/Animations** - Add subtle animations to components like callouts, badges, tags, heroes, and cards that make sense but are not too distracting (e.g., page loads, transitions, and scrolls). Set an object in the global config that can be used to enable or disable animations.
- [x] 🟢🌟✅ **UI/Comments** - Add descriptive Liquid comments to the top of all component files explaining the component's purpose, caveats, and usage examples, and update the documentation accordingly.
- [x] 🟡🩹✅ **UI/Sidebar** - Expose three configurable layouts for the sidebar logo, title, and subtext.
- [x] 🟢🩹✅ **UI/Header** - As well as the three-column layout, we should give the user the ability to have a header bar and allow `site.data.navheader` where users can add additional navigation items. View on GitLab: badges can change orientation from left to right or middle.
  > ***NOTE!*** - **Solution:** Implemented Top Header Bar layout options under `theme_settings.header` supporting glassmorphism styling, custom data links via `_data/navheader.yml`, flexible link alignment, and auto-adjusting sidebar spacing and offsets.
- [x] 🟢🌟✅ **UI/Navigation** - Added `docs/releases.md` to `_data/navigation.yml` under "Components".
- [x] 🟡🌟✅ **UI/Fonts & Libraries** - Evaluate fonts and integrations for external JS libraries to make it easier for site builders to import them.
  > ***NOTE!*** - **Solution:** Extended `head.html` and `foot.html` to dynamically inject custom stylesheet and script arrays (`custom_stylesheets`, `custom_scripts_head`, `custom_scripts_foot`, and `typography.custom_font_stylesheets`) defined directly in `_config.yml` without modifying core theme files. Updated documentation in `docs/configuration.md` to reflect the new capabilities.
- [x] 🟡🩹✅ **Enhancements/Compatibility** - Gate plugin-dependent features behind configuration flags and document platform support limits (GitHub Pages restricted plugins vs GitLab Pages custom plugin support).
  > ***NOTE!*** - **Solution:** Introduced `theme_settings.compatibility.disable_custom_plugins` flag to simulate safe-mode behavior locally. Integrated it alongside `site.safe` inside components that rely on the custom `from_yaml` Ruby filter. Documented platform support boundaries in `docs/installation-advanced.md` and the compatibility flags in `docs/configuration.md`.
- [x] 🟡🩹✅ **Enhancements/CustomVariables** - Allow components to accept custom user-defined variables from page front-matter or site configuration.
  > ***NOTE!*** - **Solution:** Enabled all data-driven and visual components to look up page-level front-matter and global site/theme settings as fallback variables (e.g. `page.carousel_items`, `page.hero_title`, etc.) when direct include parameters are omitted.
- [x] 🟢🩹✅ **Enhancements/Placeholders** - Implement elegant placeholder fallbacks for images and text across all components when configurations or data fields are omitted.
  > ***NOTE!*** - **Solution:** Added robust visual card placeholders (dashed border, SVG icons, and labels) for the `image` component and default text fallbacks for `card` and `hero-card` components to prevent layout breaks when fields are omitted.
- [x] 🟡🩹✅ **Enhancements/DataFlexibility** - Provide components with flexible parsing options so users can retrieve and render data from custom paths and formats.
  > ***NOTE!*** - **Solution:** Built a dynamic Liquid dot-separated nested path resolution system. This allows components to load data from deeply nested structures (e.g., `data_source="nested.sub.key"`) within `_data/` files, or fall back to front-matter/site configurations.
- [x] 🟡🩹✅ **Enhancements/FlatFiles** - Ensure all layouts and navigation features support a flat-file site structure without requiring nested folders or collections.
  > ***NOTE!*** - **Solution:** Normalized link matching and breadcrumbs structures to automatically parse and match URLs with or without trailing slashes, `.html` extensions, or directory configurations. Added documentation in `docs/navigation.md`.

### **Features (priority-3)**
- [x] 🟡🌟✅ **UI/Carousel** - Added support for non-image custom content slides.
  > ***NOTE!*** - **Solution:** Upgraded `_includes/comps/carousel.html` and added CSS rules for `.rd-carousel-custom-content` to conditionally render text/HTML slides when `item.content` is specified.
- [x] 🟢🌟✅ **UI/Feedback** - Refactored tracking to make PostHog a first-class citizen over Google Analytics, and supported toggling/disabling analytics. Added configurations for Umami and Plausible self-hosted analytics.
  > ***NOTE!*** - **Solution:** Implemented the `theme_settings.analytics` config block with support for `posthog`, `google_analytics`, `umami`, and `plausible`. Rewrote `head.html` to inject appropriate tracker scripts and gated it against development environments via `enable_in_dev`. Updated the `feedback.html` click handler to map click events cleanly to the active provider API.
- [x] 🟢🌟✅ **UI/CodePen** - Handle missing configurations gracefully, and add a client-side public CodePen oEmbed API check to identify invalid embeds and replace them with a stylized 404 fallback card.
  > ***NOTE!*** - **Solution:** Handled missing configurations gracefully, and added a client-side public CodePen oEmbed API check to identify invalid embeds and replace them with a stylized 404 fallback card.
- [x] 🟢🌟✅ **UI/Navbar** - Ensure the CodePen icon renders correctly in the navbar.
  > ***NOTE!*** - **Solution:** Updated navigation links to forward style parameter (e.g. `style: fab` and `source: fa`) enabling proper brand icon rendering with Font Awesome.
- [x] 🟡🌟✅ **UI/TOC** - Ensure the mobile TOC displays with a proper glassmorphism layout and toggle states.
  > ***NOTE!*** - **Solution:** The TOC button is clickable on mobile, and the container now displays correctly with a glassmorphism effect and proper positioning. Fixed via `_layouts/default.html` and `_sass/ravenui-sp/_toc.scss`.
- [x] 🟡🌟✅ **UI/ExampleBlock** - Implemented `example-block.html` to support captured Markdown content. This provides a much better DX for documenting multi-line code examples.
- [x] 🟡🩹✅ **UI/EditButton** - Implemented a unified `repository` configuration in `_config.yml` supporting GitHub, GitLab, Bitbucket, and Codeberg. Added support for "vscode" mode (GitHub.dev and GitLab Web IDE). Updated `_includes/core/footer.html` with dynamic logic.
- [x] 🟡🌟✅ **UI/Sidebar** - Re-implemented scroll persistence with an early-execution inline script. This eliminates flickering by setting the scroll position before the first paint.
- [x] 🟡🌟✅ **DX/Includes** - Refactored `_includes/` into logical subfolders (`core/`, `comps/`, etc.) for better DX and modularity.
- [x] 🟡🌟✅ **UI/TOC** - Performed a global audit and promoted headings (H3 -> H2) across major docs to ensure a consistent H1
  > ***NOTE!*** - H2
- [x] 🟡🌟✅ **UI/Blog** - Finalized a high-density, linear blog list layout (`_layouts/blog-list.html`) with metadata (author, date, tags) and descriptions.
- [x] 🟡🌟✅ **DX/Verification** - Verified 1:1 mapping for all 22 includes (including sub-components like `roadmap-item`).
  > ***NOTE!*** - **Solution:** Audited and verified that all includes under `_includes/comps/` are accounted for and documented 1:1.
- [x] 🟡🌟✅ **DX/Lists** - Consolidated "Stylized Markdown Lists" into `docs/markdown.md`.
  > ***NOTE!*** - **Solution:** Verified list styling features are documented under a dedicated section in `docs/markdown.md`.
- [x] 🟡🌟✅ **UI/Components** - Expanded the gallery in `docs/components/index.md` to showcase all 4 component categories.
- [x] 🟡🌟✅ **DX/Build** - Successfully verified project integrity with `bundle exec jekyll build`.
- [x] 🟡🌟✅ **Features/Search** - Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: Wasm-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia). Make sure all are configured, working, and documented.
- [x] 🟢🌟✅ **Features/Search** - Corrected CDN URLs in `_includes/core/head.html` from non-existent `/dist/` paths to the correct npm directory locations (`css/ui.css` and `ui.js`). Configured JS to load as `type="module"` and updated search initialization in `_layouts/default.html` to poll for the `PagefindUI` object to handle asynchronous loading.
- [x] 🟡🌟✅ **UI/Fonts** - Replaced the invalid pipe character (`|`) family separator in Google Fonts configurations with the standard `&family=` parameter structure required by the Google Fonts `/css2` API to prevent HTML 400 MIME blocks.
- [x] 🟢🌟✅ **UI/Icons** - Confirmed CDN icons are online and working. `NS_BINDING_ABORTED` is a standard browser navigation behavior and does not reflect an invalid icon URL or layout bug.
- [x] 🟡🌟✅ **UI/Refinement** - Applied visual polish to splash components (cards, buttons, terminals) including subtle elevations, refined borders (`color-mix`), and scale-based interactive states.
- [x] 🟢🌟✅ **UI/Checkbox** - Refine Checkbox accessibility (focus rings, disabled states).
- [x] 🟢🌟✅ **UI/Sidebar** - Add smooth transition to sidebar backdrop-filter on toggle.
- [x] 🟢🌟✅ **UI/Hero** - Reduce hero headings padding.
- [x] 🟢🌟✅ **UI/GridPalette** - Implement `grid-palette` component for showcasing color palettes.
- [x] 🟢🩹✅ **UI/Sidebar** - Configurable sidebar navigation padding via `_config.yml` (compact, tight, comfy, spacy).
- [x] 🟡🌟✅ **UI/DesignSystem** - Added Fluent UI-specific variables to `_sass/ravenui-sp/_root.scss` (Elevations, Radius, Transitions).
- [x] 🟢🌟✅ **UI/Hero** - Added configurable `rd_nav_spacing` (compact, tight, comfy, spacy) support to headings (h2, h3) and hero sections via `head.html` and SCSS variables.
- [x] 🟡🌟✅ **UI/Codeblock** - Fixed copy button and language labels overlap by moving the language label to the left and copy button to the far right.
- [x] 🟡🌟✅ **UI/Codeblock** - Ensured code blocks are centered on mobile by setting `margin-inline: 0` and `width: 100%` in mobile media queries.
- [x] 🟢🌟✅ **UI/Tags** - Introduced a subtle pastel color palette for tags (`.rd-tag--blue`, `--purple`, etc.) with matching borders for improved readability.
- [x] 🟡🌟✅ **UI/CardIndex** - Component styling is fixed; display layout is now clean and logical.
- [x] 🟡🌟✅ **UI/Codeblock** - Language label compact spans overlapping with copy button fixed; added slight margin/padding above the highlight div.
- [x] 🟡🌟✅ **UI/GridPalette** - Outputs color from YAML captured in the include successfully.
- [x] 🟡🌟✅ **UI/GridPalette** - Adjustable to allow grid palette of colors with a custom size (e.g. 12px or 24px), setting the size of the grid, and grid palettes for apps, devices, etc.
- [x] 🟡🌟✅ **UI/GridPalette** - Showcases theme color palette on a new showcase page and navigation route.
- [x] 🟡🌟✅ **DX/Deployment** - Moved menu object location in sidebar to its own top-level title header.
- [x] 🟡🌟✅ **UI/ColorBlock** - Designed as a single line of code to render inline inside tables and other elements without breaking layout flow.
- [x] 🟡🌟✅ **UI/GitTags** - Git tags and releases tags are separated logically.
- [x] 🟡🌟✅ **UI/Sidebar** - Added sidebar section separators and section titles that flow with the theme.
- [x] 🟡🌟✅ **UI/Colors** - Integrated palette colors (Viridian, Note, Warning, Danger, Black, Void, Ink, Slate, Steel, Mist, Smoke, Ash, Silver, Ghost, White) and custom border colors in `_root.scss`.
- [x] 🟡🌟✅ **UI/Typography** - Set `h1` to Fraunces 400, `h2` to Fraunces 500, and `h3` to IBM Plex Sans 500.
- [x] 🟡🌟✅ **UI/Callout** - Added `inline` parameter to component callout to support inline callout bubbles.
- [x] 🟡🌟✅ **DX/Data** - Correctly mapped tags and release data lists from YAML data sources.
- [x] 🟡🌟✅ **UI/Sidebar** - Restructured Deployment section to have its own sidebar menu category.
- [x] 🟡🌟✅ **UI/Button** - Added button examples (GETTING STARTED, VIEW SOURCE, EDIT THIS PAGE) supporting colors, sizes, icons, borders, and border-radius.
- [x] 🟢🌟✅ **UI/Releases** - Added icon to releases menu item.
- [x] 🟢🌟✅ **UI/ColorGrid** - Updated color-grid layout to support custom grid spacing and the extended color palette.
- [x] 🟡🌟✅ **UI/GradientText** - Implemented `gradient-text.html` component and documented usage.
- [x] 🟡🌟✅ **Features/Mermaid** - Added native support for Mermaid.js diagrams and documented it.
- [x] 🟡🌟✅ **Features/LaTeX** - Added KaTeX math expressions support and documented it.
- [x] 🟡🌟✅ **UI/Callout** - Added `inline-callout.html` component and documented it.
- [x] 🟡🌟✅ **UI/VersionTag** - Created `tag.html` component with dedicated semantic release tags (`beta`, `rc`, `release`, `major`, `version`).
- [x] 🟡🌟✅ **UI/Splash** - Design a professional, informative, useful, and elegant splash page. ZeroDark SP is a highly involved theme, extending beyond just standard documentation (approaching the versatility of daisyUI). Since the splash page is the first page a user sees, it should showcase the theme's features, layout options, and aesthetic range in an elegant way.
- [x] 🟡🌟✅ **Features/Search** - Pagefind JS and CSS local files. We use the same logic as fonts and allow local or CDN for maximum compatibility.
  > ***NOTE!*** - **Solution:** Implemented conditional head asset injection for Pagefind local/CDN stylesheets and scripts.
- [x] 🟡🌟✅ **Features/Search** - Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: WASM-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia). Make sure all are configured, working, and have corresponding docs.
  > ***NOTE!*** - **Solution:** Integrated Pagefind, Algolia Search Lite, and a zero-dependency local search client (`rd-search-local.js`) fallback. Created dynamic Liquid `search-index.json` builder. Exposed settings via `theme_settings.search`.
- [x] 🟡🌟✅ **Features/Theme** - Add a theme manager to the site. Users can specify 1 to * themes; if only two, a theme toggle will appear, and if more than two, a dropdown will appear.
  > ***NOTE!*** - **Solution:** Created the `theme-toggle.html` component that dynamically displays a button toggle (for 2 themes) or a select dropdown (for 3+ themes) based on `site.theme_settings.themes`.
- [x] 🟡🌟✅ **Features/VersionSwitcher** - Add support for a multi-version documentation switcher (disabled by default).
  > ***NOTE!*** - **Solution:** Created the `version-switcher.html` component that dynamically displays a version select dropdown based on `site.theme_settings.versions`. Included it in `sidebar.html` branding section, added styles in `_navigation.scss`, and documented configuration options in `docs/configuration.md`.
- [x] 🟡🌟✅ **UI/Progress** - Implemented progress bar component and documented it.
- [x] 🟡🌟✅ **UI/WrittenBy** - Created written-by component to display authors profile information dynamically.
- [x] 🟢🌟✅ **Features/Charts** - Created svgcharts component - support for line, bar, pie, doughnut, radar, polar area, bubble, also support sourcing from site.data.placeholderName and scatter charts, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Charts** - Created chartjs component - support for line, bar, pie, doughnut, radar, polar area, bubble, also support sourcing from site.data.placeholderName and scatter charts, update docs to reflect feature.
- [x] 🟡🌟✅ **Features/Charts** - Support other well known charting libraries, maybe we can make a generic chart component that can be used for any charting library, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/CodePen** - Created codepen component - allows users to embed CodePens with ease, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/CodeSandbox** - Created code sandbox component - allows users to embed CodeSandboxes with ease, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/YouTube** - Created youtube component - allows users to embed YouTube videos with ease, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Sponsor** - Created sponsored-by component - allows users to add a sponsored by section with logo and link to sponsor, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Testimonial** - Created customer callout component - users that have used the product and liked it.
- [x] 🟢🌟✅ **Features/Timestamp** - Created new component: last edited. Should have the last edited date and author. This can be enabled in _config; defaults to showing edited date and time.
- [x] 🟢🌟✅ **Features/Image** - Created image component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Iframe** - Created iframe component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] 🟢🌟✅ **UI/Showcase** - Created rendered-el-showcase.html - wraps the element in another element with an SVG containing tilted vertical lines, a title, and logo as an example of rendered code. We allow users to specify title name, size, and icon.
- [x] 🟡🌟✅ **UI/HeadingAnchors** - Created headings "link" anchor invisible by default, user can enable always visible in _config, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/ReadingTracker** - previously read: a localStorage-backed page tracker that can be used to show users which pages they have already read, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Analytics** - enable Google Analytics and update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Analytics** - enable posting to Google Analytics when a user clicks on a link, update docs to reflect feature.
- [x] 🟡🌟✅ **UI/Carousel** - Image carousel component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] 🟡🌟✅ **UI/Typewriter** - Implemented typewriter component and documented it.
- [x] 🟢🌟✅ **UI/FAQ** - Implemented FAQ component and FAQ item component, and documented usage.
- [x] 🟡🌟✅ **UI/Markdown** - Make sure all markdown elements are themed correctly to match the theme, update docs to reflect feature.
- [x] 🟡🌟✅ **UI/API** - change api-ref to command-ref; create a new component called api-reference which can be used for traditional API documentation akin to web (not CLI).
- [x] 🟡🌟✅ **UI/Layouts** - Example pages for all the different layouts. These do not need to be in the menu; just a page and a button going back to the previous page.
- [x] 🟢🌟✅ **UI/Divider** - Implemented `hr.html` component supporting gradient lines and centered text/icons.
- [x] 🟡🌟✅ **UI/Logo** - add version badge to the top of the page perhaps after // DOCS SubText use our existing version tag component, enable via _config. update documents to reflect
- [x] 🟡🌟✅ **UI/Logo** - change badge location to inside logo so it appears inline after // DOCS SubText, add icon and color, update docs to reflect
- [x] 🟡🌟✅ **UI/Footer** - Extend the footer to include a _includes/core/foot.html partial, which can be used to add custom content to the bottom of the page. This can include links to social media, copyright information, or other relevant details. The footer is currently hardcoded to include the copyright and social media links, so this would need to be updated to accommodate any additional content.
- [x] 🟡🌟✅ **UI/Details** - Collapsible details/summary block component for optional content folding.
- [x] 🟡🌟✅ **UI/KBD** - Keyboard shortcuts group component to render standard KBD keys side by side.
- [x] 🟢🌟✅ **UI/Alert** - Full-width viewport alert/announcement banner component for site-wide alerts.
- [x] 🟢🌟✅ **UI/CopyButton** - Standalone copy-to-clipboard button component for arbitrary inline text blocks.
- [x] 🟢🌟✅ **UI/IconShowcase** - Icon showcase grid component to present groups of icons with copy triggers.
- [x] 🟢🌟✅ **UI/Feedback** - Dynamic feedback widget component ("Was this page helpful?") with analytics hooks.
- [x] 🟢🌟✅ **UI/DirectoryTree** - CSS-based file directory tree diagram component to showcase project layout structures.
- [x] 🟢🌟✅ **UI/Tooltip** - Pure-CSS context tooltip component for definitions and abbreviations.
- [x] 🟢🌟✅ **UI/KPIMetrics** - High-density system metrics container component to group metrics/stats cards.
- [x] 🟡🌟✅ **Features/DataTable** - Component that can be used to display data in a table format, with sorting, filtering, and pagination. Source: `_data/table1.json` | `_data/table2.yaml` | `_data/table3.csv` for structured data injection.
- [x] 🟢🌟✅ **UI/TagCloud** - Renders all site tags sized by post count. Links to filtered index pages.
- [x] 🟢🌟✅ **UI/Modal** - Accessible dialog overlay. Focus trap, ESC close, aria-modal. Content via include slot.
- [x] 🟢🌟✅ **Features/Metrics** - Auto-calculated counts: posts, tags, categories, words, reading time. Displayed in about/meta pages.
- [x] 🟡🌟✅ **UI/FigureCaption** - Semantic figure+figcaption. Supports alignment (left/right float, full-width). Optional link.
- [x] 🟡🌟✅ **Features/OGImage** - A Jekyll plugin or template that auto-generates social sharing images containing the post title, category, and date.
  > ***NOTE!*** - **Solution:** Created a custom Jekyll Generator plugin `_plugins/og_image_generator.rb` that dynamically generates stylized, branded SVG Open Graph sharing images holding the title, category, and date of pages and posts. It automatically sets the page metadata for `jekyll-seo-tag` integration, bypasses Safe Mode compiles cleanly, and includes an explicit head tag fallback in `head.html` using `site.theme_settings.og_image.default`.
- [x] 🟢🌟✅ **UI/StepIndicator** - Visual step indicator for multi-part tutorials or onboarding. Active, complete, upcoming states.
- [x] 🟢🌟✅ **UI/Tooltip** - Hover/focus tooltip via CSS or JS. Placement auto-flip. ARIA-described.
- [x] 🟢🌟✅ **UI/FeatureGrid** - A grid component (2-4 columns) showcasing icons, titles, and descriptions, sourcing its items from page front-matter or a YAML/JSON data file.
- [x] 🟡🌟✅ **Features/Timeline** - Vertical chronological list. Each entry: date, heading, body. Reads from YAML.
- [x] 🟡🌟✅ **DX/Annotations** - Since many components depend on others, document these dependencies in Liquid comments and documentation. Optionally, define dependencies in the front-matter YAML header of components and render them beautifully using a dedicated dependency component.
- [x] 🟡🌟✅ **UI/TOC** - Ensure the Table of Contents (TOC) only picks up headings from the main article content rather than auxiliary headings inside widgets or layout components.
- [x] 🟡🌟✅ **DX/CI** - Bundler before-script does not like to be run as root. I have removed the before-script for global scope and attached it to the build stage. I'm unsure how to fix this; this is causing the build to fail. Source Bundler documentation to find a fix.
- [x] 🟡🌟✅ **Features/Search** - Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: Wasm-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia).
- [x] 🟢🌟✅ **UI/Feedback** - Support static page likes, comments, and reviews.
  > ***NOTE!*** - **Solution:** Implemented the `likes.html` component that provides a client-side heart like button (saving state to localStorage and firing analytics events) and the `comments.html` component that embeds Disqus or Giscus discussion threads dynamically based on `site.theme_settings.feedback`. Integrated both components into `default.html` layout and documented options in `docs/configuration.md`.
- [x] 🟡🌟✅ **Features/Charts** - Render site stats using visual charts.
  > ***NOTE!*** - **Solution:** Upgraded `site-stats.html` with an optional `show_charts=true` parameter. When active, it aggregates tag and category post counts and passes them as datasets into either the `chartjs` or `svg` rendering engines. Documented it in `docs/components/site-stats.md`.
- [x] 🟡🌟✅ **UI/Tickers** - Integrate subtle pneumatic micro-animations and numeric tickers for stats.
  > ***NOTE!*** - **Solution:** Added data-ticker-value attributes to site stats and high-density metric elements. Implemented the setupNumericTickers counting engine inside default.html using IntersectionObserver, requestAnimationFrame, and cubic easeOut. Added CSS animation rules in _metrics.scss to trigger a scale/brightness pop on animation completion.
- [x] 🟡🌟✅ **UI/Grids** - Refactor complex layout snippets into modular components and expose utility grids for layout composition.
  > ***NOTE!*** - **Solution:** Refactored grid systems by creating a general-purpose, highly configurable layout include in comps/grid.html supporting customizable desktop/tablet/mobile column counts, gap styles, styles injection, and responsive content mapping. Created documentation in docs/components/grid.md.
- [x] 🟡🌟✅ **UI/Branding** - Partitioned branding elements into top and bottom rows with styling offsets to ensure `inline`, `stacked`, and `split` layouts align dynamically and display elegantly.
  > ***NOTE!*** - **Solution:** Partitioned branding elements into `rd-brand-top-row` and `rd-brand-bottom-row` containers in `sidebar.html`. Provided CSS definitions in `_navigation.scss` for `.rd-brand--inline`, `.rd-brand--stacked`, and `.rd-brand--split` layouts to ensure brand assets, text, and version tags scale, align, and offset elegantly across different branding styles.
- [x] 🟡🌟✅ **UI/TOC** - Implement three TOC styles (lines, nodes, simple/default) configurable in `_config.yml`, along with customizable font sizes.
  > ***NOTE!*** - **Solution:** Implemented `theme_settings.toc` layout styles (`simple`, `lines`, `nodes`) and sizing densities (`compact`, `default`, `relaxed`) in CSS and default layouts.
- [x] 🟢🌟✅ **DX/Environment** - Prevents PostHog or Google Analytics from polluting production metrics.
- [x] 🟡🌟✅ **DX/CI** - Minification only runs in CI. Add to the CI step alongside linting — but be mindful that linters may break Liquid syntax that requires single-line formatting. Icons and other elements nested inside other elements will break if their HTML spans multiple lines. There are workarounds, but I prefer to note this directly in the component documentation, as I have done with almost all components, so developers can read and understand why.
  > ***NOTE!*** - **Solution:** Integrated the pwsh workspace linter into the test_build job and created tools/minify.ps1 (a PowerShell-based HTML/CSS/JS minifier that preserves code/pre/script formatting via placeholders) which runs during cloudflare_pages production deployments. Also patched the workspace linter to strip IAL tags before checking heading bolding.
- [x] 🟢🌟✅ **UI/Footer** - Allows construction of footer sections using discrete items: links, icons, logos, images, iframes, badges, and more. Using `footer-item` to specify the target column enables seamless footer construction that matches the style of professional sites — whether simple or detailed. These components should appear before the license and "powered by" section.
- [x] 🟡🌟✅ **Docs/Limitations** - The introduction page needs to be informative and clearly written. Include a notice that Zero Dark was purposefully designed not to support collections siblings — this is intentional, not an oversight.
- [x] 🟡🌟✅ **Collections/Grid** - Collection grid layout.
- [x] 🟡🌟✅ **Collections/List** - Collection list layout.
- [x] 🟡🌟✅ **Collections/Documents** - Collection documents layout.
- [x] 🟡🌟✅ **Collections/Posts** - Collection posts layout.
- [x] 🟡🌟✅ **Collections/Blog** - Collection blog layout.
- [x] 🟡🌟✅ **Collections/API** - Collection API layout.
- [x] 🟡🌟✅ **Collections/Data** - Collection data layout.
- [x] 🟡🌟✅ **Collections/Commands** - Collection commands layout.
- [x] 🟡🌟✅ **Collections/CLI** - CLI, modules, and tools collections layout.
  > ***NOTE!*** - **Solution:** Developed 9 dedicated layouts in _layouts/ (collection-grid, collection-list, collection-documents, collection-posts, collection-blog, collection-api, collection-data, collection-commands, collection-cli) supporting custom tags filtering and weight/order/date/title sorting, standardizing layout parameters for technical specs sheets, API docs, CLI tool suites, and blog collections.
- [x] 🟡🌟✅ **UI/Layouts** - Some additional layouts like blog, articles, and blank page templates.
  > ***NOTE!*** - **Solution:** Implemented unified `blog.html` (supporting card grid, list, limits, and category/tag filters), premium technical `article.html` (with reading time, author bio lookup, banner gradients, and pagination), and a clean `blank.html` layout (completely stripping navigation/toc elements for full-screen dashboards/canvases). Documented in `docs/layouts.md`.
- [x] 🟡🌟✅ **Features/Fetcher** - Fetch and receive data from TheTVDB, TheMovieDB, free anime metadata APIs, or Warhammer metadata providers.
  > ***NOTE!*** - **Solution:** Implemented `extra-api-fetcher.html` — a client-side JS fetch component that queries any JSON API, auto-decodes Jikan (Anime) v4 payload shapes, caches responses in `localStorage` with configurable expiry, handles rate-limit fallback from stale cache, and renders either a media card or full details panel.
- [x] 🟡🌟✅ **Features/MediaDetails** - Media details: display entry details. Make it robust so it can support music, anime, and other categories like Warhammer.
  > ***NOTE!*** - **Solution:** Implemented `extra-media-details.html` featuring a backdrop-banner header with poster art, metadata row badges, rating display, overview, abilities/wargear blocks, genre tags, and a details sidebar table. Adapts column presence based on data keys.
- [x] 🟢🌟✅ **Features/MediaShowcase** - Media card: supports custom properties.
  > ***NOTE!*** - **Solution:** Implemented `extra-media-card.html` rendering image, title, type badge, year, genres, and truncated overview. Supports `glass` glassmorphism flag, hover elevation, and lazy-loaded poster image scaling.
- [x] 🟡🌟✅ **Features/MediaCarousel** - Related carousel: perhaps reuse the existing carousel component.
  > ***NOTE!*** - **Solution:** Implemented `extra-related-carousel.html` wrapping `extra-media-card.html` instances inside a reused carousel track/viewport structure. Carousel JS is shared with the standard carousel component.
- [x] 🟡🌟✅ **Features/WikiGrid** - Components to make info sites like anime charts or Warhammer info/wiki pages.
  > ***NOTE!*** - **Solution:** Implemented `extra-wiki-grid.html` — a high-density CSS grid for unit stat profiles (M/WS/BS/S/T/W/A/Ld/Sv etc.). Accepts key-value stat pairs from YAML front matter. Also absorbed into the media details sidebar.
- [x] 🟡🌟✅ **Features/Spinner** - Spinners for dynamic components: themed to match the website, using a cool fetch animation.
  > ***NOTE!*** - **Solution:** Implemented `extra-spinner.html` — a CSS keyframe ring spinner honouring `--rd-clr-*` design tokens. Supports `small`, `medium`, `large` sizes and `accent`, `warning`, `danger`, `info`, `purple` color variants. Used automatically as the loading state inside `extra-api-fetcher.html`.
- [x] 🟡🌟✅ **Features/Search** - Extend the theme layout logic so YAML front matter metadata supports `enable_search: false` by default (opt-in search configuration), and `enable_nav: true` by default specifically for collection documents.
  > ***NOTE!*** - **Solution:** Implemented `enable_search: false` by default. Pages must explicitly opt in with `enable_search: true` in their front matter to be compiled into `search-index.json` or indexed by Pagefind (otherwise `data-pagefind-ignore` is appended to the body tag). For collections, document navigation defaults to `enable_nav: true` by default.
  * [ ] 🟢❓ ***RavenUI Starter Template (`ravenui-starter`)*** - Develop a boilerplate repository containing a clean folder structure, pre-configured `_config.yml` settings, standard `.gitignore`, and base layouts. Downstream users can clone this boilerplate to bootstrap a new site. *(Referenced by rvcli-bootstrap)*
  * [ ] 🟢❓ ***Multi-Variant Layout System*** - Implement support for distinct theme variants, such as a "Minimalist" layout optimized for basic developer blogs, and a "Standard/Complex" layout for multi-level technical documentation sites. *(Referenced by rvcli-variants)*
  * [ ] 🟢❓ ***CI/CD Variant Packaging Workflow*** - Create GitLab CI/CD pipelines to automatically assemble, zip, and release the theme's variant distribution files (e.g., `dist/theme-variant-starter.zip`) when a new version tag is pushed. *(Referenced by rvcli-variants)*
  * [ ] 🟢❓ ***Component Code Skeleton Templates*** - Author standard Liquid/HTML and Markdown document templates for all component classes. These templates will serve as the blueprints for the CLI scaffolding generator. *(Referenced by rvcli-modes artisan)*
- [x] 🟡🌟✅ **CLI/rvcli** - Implementation of a dynamic developer and user CLI/TUI companion.
  * [x] 🟢✅ ***rvcli-core*** - Cross-Platform Runtime & Packaging Decision.
  * [x] 🟢✅ ***rvcli-tui*** - Dynamic Terminal UI & Theme Styling.
  * [x] 🟢✅ ***rvcli-modes*** - Execution Modes & Commands.
  * [x] 🟢✅ ***rvcli-hotreload*** - Intelligent Livereload Wrapper.
  * [x] 🟢✅ ***rvcli-linter*** - Diagnostic & Linting Utilities.
  * [x] 🟢✅ ***rvcli-bootstrap*** - Project Bootstrap & Initialization.
  * [x] 🟢✅ ***rvcli-metadata*** - Component Dependency Tree Generator.
  * [x] 🟢✅ ***rvcli-variants*** - Multi-Variant Theme Packager.
  * [x] 🟢✅ ***rvcli-doctor*** - Environment & System Diagnostic Command (QOL).
  * [x] 🟢✅ ***rvcli-port*** - Intelligent Port Collision Resolver (QOL).
  * [x] 🟢✅ ***rvcli-upgrade*** - Upstream Theme Version Upgrader (QOL).
  * [x] 🟢✅ ***rvcli-searchindex*** - Search Index Builder Integration (QOL).
  * [x] 🟢✅ ***rvcli-mapping*** - CLI Wrapper for Jekyll & Bundler.
  * [x] 🟢✅ ***rvcli-webrick*** - WEBrick Server Integration.
  * [x] 🟢✅ ***rvcli-incremental*** - Incremental Build Support.
  * [x] 🟢✅ ***rvcli-commands*** - Jekyll Command Auditing.
  * [x] 🟢✅ ***rvcli-help*** - Help Flag Integration.
- [x] 🟡🌟✅ **Features/Plugins** - Implement custom Liquid Ruby plugins as an alternative to standard `{% include %}` tags (e.g., `{% rd component_name %}`/`{% rdi component_name %}`).
  > ***NOTE!*** - **Solution:** Implemented custom block `rd` and inline `rdi` tags to bypass standard include path verbosity. Block tag captures nested markup and passes it as `include.content`. Auto-resolves variables in context.
- [x] 🟡🌟✅ **Features/Data** - Fully support all Jekyll data file types (YAML, JSON, CSV, TSV) for components.
  > ***NOTE!*** - **Solution:** All data-driven components (e.g. `timeline.html`, `steps.html`, `datatable.html`) use the dynamic dot-notation data source resolver. Since Jekyll natively parses `.yml`, `.yaml`, `.json`, `.csv`, and `.tsv` files under `_data/` into hashes/arrays, they are fully supported out-of-the-box. Covered in detail in data configuration documentation.
- [x] 🟡🌟✅ **Features/Converter** - Implement a converter layout or feature that allows saving pages as Markdown (`.md`), HTML, or other supported formats.
  > ***NOTE!*** - **Solution:** Created the page converter component (`_includes/comps/converter.html`) and associated stylesheet (`_sass/ravenui-sp/_converter.scss`). The component provides dropdown options to Download Markdown (reconstructing raw repository urls from `page.path` and repository credentials), Download HTML (extracting target elements' innerHTML wrapped in clean page styling), and Print / Export PDF. Documented usage in `docs/components/converter.md`.
- [x] 🟡🌟✅ **Features/PlatformSupport** - Create a platform support indicator component (e.g., `platform-support.html`) that reads metadata from the front matter and outputs elegant icons (GitHub, GitLab, Netlify, Cloudflare Pages, etc.) showing where the component is supported.
  > ***NOTE!*** - **Solution:** Implemented platform-support.html include mapping hosting platforms (GitHub, GitLab, Netlify, Cloudflare, Vercel) to check/x/warn indicators utilizing Simple Icons, with documentation in docs/components/platform-support.md.
- [x] 🟡🌟✅ **Features/BrowserSupport** - Create a browser support indicator component (e.g., `browser-support.html`) that shows compatibility for features across different engines (Chrome, Edge, Firefox, Safari) using inline icons and checks, referencing MDN guidelines.
  > ***NOTE!*** - **Solution:** Implemented browser-support.html include displaying modern browser engine compatibility (Chrome, Edge, Firefox, Safari) with support for minimum versions and status badges, with documentation in docs/components/browser-support.md.
- [x] 🟡🌟✅ **Features/LayoutVisualizer** - Implement a layout visualizer component to help developers visualize different site layouts, useful for demonstrating alternative RavenUI layout structures.
  > ***NOTE!*** - **Solution:** Created the client-side layout visualizer component (`_includes/comps/layout-visualizer.html`) and associated stylesheet (`_sass/ravenui-sp/_layout-visualizer.scss`). The component provides interactive layout switching (Default Sidebar, Top Header, Blank Canvas) inside a mockup browser grid, with dynamic url-address and descriptive panel updates. Documented usage in `docs/components/layout-visualizer.md`.
- [x] 🟡🌟✅ **Features/Sitemap** - Create a sitemap component to dynamically visualize the site page hierarchy and structure.
  > ***NOTE!*** - **Solution:** Created the sitemap.html include component that dynamically renders a structured layout of pages, documentation components, blog posts, and collections. Added matching SASS rules in _sitemap.scss and full reference page in docs/components/sitemap.md.
- [x] 🟡🌟✅ **Features/TagFiltering** - Introduce tags that trigger searches or filter content by tag on click, allowing users to select additional tags from a list to refine results.
  > ***NOTE!*** - **Solution:** Created the client-side tag-filter component (`_includes/comps/tag-filter.html`) and associated stylesheet (`_sass/ravenui-sp/_tag-filter.scss`). The component supports auto-extracting tags from target elements' `data-tags` attribute and synchronizes selections with URL search parameters (`?tags=...`). Toggling tags refines the results using AND logic. Updated blog and collection list/grid layouts to support tag filtering out-of-the-box, and documented usage in `docs/components/tag-filter.md`.
- [x] 🟡🌟✅ **Features/ComponentPlayground** - Implement a component playground that provides interactive live previews with configurable properties for maximum component documentation.
  > ***NOTE!*** - **Solution:** Created the client-side component playground (`_includes/comps/playground.html`) and associated stylesheet (`_sass/ravenui-sp/_playground.scss`). The component supports dynamic playground instances for Button, Callout, Alert, and Tag, dynamically updating element attributes and re-rendering Lucide icons, while outputting real-time generated Liquid code blocks with copy-to-clipboard functionality. Documented usage in `docs/components/playground.md`.
- [x] 🟡🩹✅ **Enhancements/Environment** - Properly ship environment flags (e.g., dev mode and production mode) read directly from `_config.yml` or `theme_settings` configuration.
  > ***NOTE!*** - **Solution:** Implemented site.theme_settings.environment flag mapping alongside jekyll.environment inside head.html to gate tracker scripts and show draft warnings on local pages.
- [x] 🟡🩹✅ **Enhancements/Generators** - Explore if custom Jekyll Generators can be utilized to extend or automate theme features.
  > ***NOTE!*** - **Solution:** Implemented the `RuntimeMetadataGenerator` in `_plugins/runtime_metadata.rb` which automatically injects platform, compiler, and gem version details into `site.config` during build.
- [x] 🟡🩹✅ **Enhancements/Minification** - Allow minification of JS, CSS, and HTML for maximum performance, checking for compatibility issues with Liquid.
  > ***NOTE!*** - **Solution:** Rewrote `tools/minify.ps1` into a production-grade PowerShell minifier using `.NET` classes and `[System.Text.StringBuilder]` throughout. Key improvements: fixed the critical `-bor` `RegexOptions` bug (was `-or`), added JS template-literal and string-literal protection to prevent regex from mangling JS code, added `<style>` and `<textarea>` block preservation for HTML, added per-file size reporting with percentage reduction, `--dry-run` mode, `--quiet` flag, selective `--no-html/--no-css/--no-js` type switches, `--skip <glob>` exclusion pattern, and a comprehensive summary block. Preserved `/*!` licence-banner comments in CSS/JS. Wired the minifier as a first-class `rvcli minify` command via a new `Invoke-RvMinify.ps1` cmdlet in `tools/rvcli/Public/`, registered in the `Start-RvCli.ps1` router and `Show-RvCommandHelp.ps1`. The CI `cloudflare_pages` job already invokes `tools/minify.ps1` directly and remains unchanged.
- [x] 🟡🌟✅ **DX/Distribution** - Document and support the three primary installation and distribution models: Gem-Based Theme, Remote Theme (public GitHub repository with version locking), and Forking/Copying.
  > ***NOTE!*** - **Solution:** Refactored `docs/installation.md` to introduce and explain the three models: Gem-Based, Remote Theme (utilizing `jekyll-remote-theme` with version tagging), and Forking/Copying (using local overriding layout rules).
- [x] 🟡🌟✅ **DX/Ruby3.4** - Fixed Gemfile to include `csv`, `base64`, and `bigdecimal` gems which were removed from the Ruby 3.4 standard library.
- [x] 🟡🌟✅ **Docs/Discovery** - Consolidated all component documentation under the "Components" section in the sidebar. Added `Component Index` for better overview.
- [x] 🟡🌟✅ **UI/Layouts** - Implemented "Portfolio", "Metrics/Stats", and "Hero Showcase" templates.
- [x] 🟡🌟✅ **Docs/Refinement** - Refine documentation sections to make them clear, robust, and technical.
- [x] 🟡🌟✅ **Docs/Tone** - Remove any loose tone, focusing on professional and robust documentation.
- [x] 🟡🌟✅ **DX/Polish** - Perform additional polish.
- [x] 🟡🌟✅ **Collections/Core** - Coexistence & Environment Engine.
  > ***NOTE!*** - **Note!** Implement the core environment feature flags. Ensure the theme boots and operates seamlessly when `collections` is disabled (falling back entirely to the manual `_data/navigation.yml` structure) or enabled. Maintain high portability without requiring code splits.
- [x] 🟡🌟✅ **Collections/Index** - Dynamic Layout Templates.
  > ***NOTE!*** - **Note!** Develop layout templates for rendering collection indices. Support multiple display variants:
    * `list`: High-density linear lists.
    * `grid`: Columnar grids of cards.
    * `cards`: Detailed summary card layouts.
    * `index` / `tree`: Nested hierarchy folder structure layout.
    * `pathways`: Chronological sequential roadmaps or tutorials.
- [x] 🟡🌟✅ **Collections/Sidebar** - Automatic Sidebar Navigation Generator.
  > ***NOTE!*** - **Note!** Auto-generate sidebar navigation structures dynamically from collection documents. Support:
    * Multi-level navigation depth hierarchy.
    * Custom collection titles and sub-item titles (replicating the UX of `navigation.yml`).
    * Large section titles and dividers to partition different collections.
    * Customizable end-of-collection horizontal lines (`hr`) configured in the index frontmatter.
- [x] 🟡🌟✅ **Collections/Docs** - Dedicated Documentation & Resource Section.
  > ***NOTE!*** - **Note!** Create a dedicated "Collections" documentation page in the docs site. Reference official Jekyll collection patterns and provide examples.
  > ***NOTE!*** - **Note!** Avoid complex explanations; instead, use callouts (normal or inline) to showcase the simplest/standard way to implement each pattern, with quick tips like "You can combine this collection with tag filtering or custom pagination."
  > ***NOTE!*** - The **collections architecture decision** is the one I'd suggest resolving early — it has a knock-on effect on the `ravenui` guide scope and whether the fork ever gets maintained in parallel. Worth a short decision note even if just to record "decided: separate theme, reason: X."
  > ***NOTE!*** - The **`theme_settings` object** is a strong QOL feature — worth sketching out the key names before implementing so the public API is clean from the start rather than retrofitted.

    *Solution to the Collections Architecture Decision: Consulted another web engineer (Claude 4.8)*

    Here's the honest case.

    ---

    **Your `_data/navigation.yaml` approach is clever, but it's fighting Jekyll rather than using it.**
    What you've built is essentially a manual collection — you're storing structured content metadata in YAML, iterating over it with Liquid, and outputting index pages. That works, and for small, stable content it's fine. But here's where it starts costing you:
    **You lose `site.posts`-style filtering for free.** Tags, categories, date sorting, pagination — all of that is built into collections. Your YAML approach means you're reimplementing that logic manually every time a user wants a filtered index. That's complexity you're pushing onto the site builder, not absorbing in the theme.
    **Content and metadata are split.** With your current approach, a user creates a page *and* has to register it in `navigation.yaml`. Two files, two places to keep in sync. They will get out of sync. Non-technical users will absolutely get out of sync.
    **You're already almost there.** You said it yourself — "not quite but almost." That gap is exactly where users hit friction. If they expect collection behavior and get 80% of it, the 20% they're missing feels like a bug, not a design decision.
    **The fork plan has a real cost.** Maintaining two themes that are structurally similar means every bug fix, every QOL improvement, every font config update gets done twice — or one fork quietly falls behind. That's a maintenance burden that compounds. Most dual-theme projects end up with one abandoned variant within a year.

    ---

    **The honest counter-argument in your favour:**
    Collections do add complexity to the theme internals. Pagination, `jekyll-paginate-v2` config, collection-scoped front-matter defaults — it's real work, and it makes `_config.yml` more involved for users who don't need it. Your YAML approach genuinely is simpler for purely static, manually curated sites.

    ---

    **My frank recommendation:**
    Add collection support to RavenUI with a feature flag — `collections: false` by default. Users who don't need it see nothing different. Users who do get first-class support without a separate fork to maintain. The `_data/navigation.yaml` system stays as the manual/curated path. They coexist.
    You avoid the fork, you avoid the maintenance split, and the theme becomes genuinely capable rather than "almost."

- [x] 🟡🌟✅ **Features/Excerpts** - Support and implement excerpts in the theme where applicable, enabled by default.
  > ***NOTE!*** - **Solution:** Updated blog and collection card/list/detailed/pathways layouts to support stripping HTML and falling back to `excerpt` when `description` is omitted.
- [x] 🟢🌟✅ **Features/RuntimeMetadata** - Expose runtime metadata (Jekyll, Ruby, Bundler, and active plugin versions) as site/page variables for debugging.
  > ***NOTE!*** - **Solution:** Developed a custom Jekyll generator plugin, built the `runtime-metadata.html` include component, registered it in sidebar, and documented usage in `docs/components/runtime-metadata.md`.
- [x] 🟡🌟✅ **Features/Drafts** - Support visual draft/unpublished indicator badges on pages and lists when running the site in development mode.
  > ***NOTE!*** - **Solution:** Added draft badge indicators in sidebar.html collection loops, default.html page headers, and post.html article headers when page.draft is true and site environment is set to development.
- [x] 🟡🌟✅ **CLI/PowerShellHelpers** - Port helper functions from `resources/helpers_functions.ps1` to extend the CLI's management capabilities.
  > ***NOTE!*** - **Solution:** Implemented three new first-class rvcli cmdlets covering the core automation helpers below. Shared `Invoke-RvGitCmd` helper moved to `Private/Helpers.ps1` to avoid duplication. All commands registered in `Start-RvCli.ps1` router and `Show-RvCommandHelp.ps1`.
  * [x] 🟡🌟✅ ***CLI/GitTagsGenerator*** - Automate the generation of `_data/git-tags.yml` or release data files using git history.
    > ***NOTE!*** - **Solution:** Implemented `Invoke-RvGitTags.ps1`. Runs `git tag --sort=-version:refname`, resolves commit hash, ISO date, and subject per tag, builds YAML via `StringBuilder`, writes to `docs/_data/git-tags.yml`. Supports `--limit N`, `--output <path>`, `--dry-run`.
  * [x] 🟡🌟✅ ***CLI/ReleasesGenerator*** - Automate changelog and release note data generation from git commit logs.
    > ***NOTE!*** - **Solution:** Implemented `Invoke-RvReleases.ps1`. Parses `git log <prevTag>..HEAD --no-merges` and groups commits by Conventional Commit type (feat, fix, refactor, perf, docs, style, test, chore, build, ci, revert). Generates YAML matching the existing `releases.yml` schema. Supports `--append`, `--tag <name>`, `--output <path>`, `--dry-run`.
  * [x] 🟡🌟✅ ***CLI/VersionAutomation*** - Automate site version management in configuration files, and build a component to render the current version.
    > ***NOTE!*** - **Solution:** Implemented `Invoke-RvVersion.ps1` with four sub-commands: `get` (reads both VERSION and _config.yml, warns if out of sync), `set <ver>` (writes to both), `bump major|minor|patch` (parses semver, increments the specified part, resets lower parts, preserves `v` prefix), `sync` (pushes VERSION → _config.yml). Uses `[regex]::Replace` with `(?m)^version:\s*.*$` for in-place config patching.

### **Bug Fixes (priority-4)**
- [x] 🟡🪲✅ **BugFix/Typewriter** - Prevent Typewriter Component heading tags from bleeding into the TOC.
  > ***NOTE!*** - **Solution:** Cloned heading nodes in the TOC generator script, replaced the typewriter container content with its `data-first-word` fallback attribute, and stripped cursors/indicators before extracting clean text.
- [x] 🟡🪲✅ **BugFix/Modal** - Resolve modal component layout bleed-through issues in Liquid.
  > ***NOTE!*** - **Solution:** Wrapped the entire component content in a block-level `<div class="rd-modal-component">` wrapper, forcing Jekyll's Kramdown parser to treat the inclusion output as raw HTML rather than inline markdown text which was wrapping the modal in `<p>` and HTML-escaping the overlay div.
- [x] 🟡🪲✅ **BugFix/Progress** - Prevent step indicator content from overflowing on mobile or smaller screens.
  > ***NOTE!*** - **Solution:** Added `min-width: 0` constraints to the flex item container (`.rd-step`) and word wrapping logic to `.rd-step-content` to prevent long text from stretching the bar.
- [x] 🟢🪲✅ **BugFix/Sidebar** - Reduce sidebar navigation item vertical padding.
- [x] 🟢🪲✅ **BugFix/Footer** - Fixed empty space after footer content causing unwanted bottom scrolling.
- [x] 🟡🪲✅ **BugFix/Releases** - Resolved access problems fetching YAML data.
- [x] 🟡🪲✅ **BugFix/Liquid** - Resolved invalid `include` tag nesting in `docs/components/api-ref.md`.
- [x] 🟡🪲✅ **BugFix/Permalink** - Resolved duplication by removing `docs/blog/index.md` in favor of `docs/blog.md`.
- [x] 🟢🪲✅ **BugFix/Footer** - Removed blank scrolling whitespace below the footer.
- [x] 🟢🪲✅ **BugFix/CI** - Fixed GitLab CI `test_build` job failure where Bundler threw `Could not locate Gemfile`. This was caused by the files being named `GemFile` and `GemFile.lock` with a capital `F`. In case-sensitive Linux CI docker environments, Bundler was unable to find them. Resolved by renaming the files to lowercase `Gemfile` and `Gemfile.lock`.


### **Documentation (priority-5)**
- [x] 🟡🌟✅ **Docs/AtomicMapping** - Every component in `_includes/comps/*.html` has a corresponding `docs/components/*.md` file.
- [x] 🟡🌟✅ **Docs/General** - Comprehensive documentation update (all features, details dropdowns for code).
- [x] 🟡🌟✅ **Docs/Layouts** - Layout documentation updated in the docs.
- [x] 🟡🌟✅ **Docs/Liquid** - Added robust text color, gradients, borders, font size, and font weight utility classes to Liquid IRL guide.
- [x] 🟡🌟✅ **Docs/Liquid** - Added examples for all utility CSS classes inside Liquid IRL guide.
- [x] 🟢🌟✅ **Features/Docstats** - Create a new automatic JSON data endpoint (`docstats.json`) showing the document count metrics of the site.
- [x] 🟡🌟✅ **Docs/Installation** - Provide a quick-start guide alongside an advanced installation path. Advanced options should cover: building from source, cloning the repo and replacing or editing docs, changing the folder structure, and using the Zero Dark docs implementation to build a site — for users who don't want the default docs website. Consider a summary page for advanced installation with a link to an in-depth page covering working directly with the repo.
- [x] 🟡🌟✅ **Docs/DeveloperGuide** - A dedicated developer guide covering the full RavenUI folder layout and extension points.
  > ***NOTE!*** - **Solution:** Created `docs/developer-guide.md` at permalink `/developer-guide/`. It documents directory structure, core layout frames/components, custom block Liquid tags (rd, rdi), custom Ruby plugins, SASS variables and theme customization, and extension points for component creation and custom `rvcli` command wiring.
- [x] 🟢🌟✅ **Docs/Rename** - Because we no longer need the second theme RavenUI-MP, we can rename to "RavenUI" in readme and docs using RavenUI Jekyll theme.
- [x] 🟡🌟✅ **Docs/ExtraComponents** - Expose these components under a new "Extra Components" category.
  > ***NOTE!*** - **Solution:** Added `Extra Components` sidebar section in `docs/_data/navigation.yml` and created `docs/components/extra-components.md` with live previews, API parameter tables, and code examples for all five new components.
- [x] 🟡🌟✅ **Docs/Liquid** - Created `docs/liquid-irl.md` demonstrating how to use theme-specific CSS utility classes.
- [x] 🟡🌟✅ **Docs/Releases** - Created `docs/releases.md` with usage examples for `releases.html` and `tags.html`.
- [x] 🟢🌟✅ **Docs/Picsum** - for showcasing images in the docs: use `https://picsum.photos/200/300` for random images.
- [x] 🟡🌟✅ **Docs/References** - Provide cross-references to self-documentation and remote documentation (e.g., Liquid template engine, Jekyll docs) using HTML anchor links to jump to specific sections.
  > ***NOTE!*** - **Solution:** Created `docs/references.md` at permalink `/references/`. It compiles external references and configuration APIs for Jekyll, Liquid, Lucide, Simple Icons, Font Awesome, Pagefind, Algolia, KaTeX, GSAP, and Anime.js.
- [x] 🟡🌟✅ **Docs/Scope** - Maintain a meticulous, detailed documentation scope, taking inspiration from the Laravel documentation style, keeping it informative, clear, and concise without being overwhelming.
  > ***NOTE!*** - **Solution:** Created `docs/scope.md` at permalink `/scope/`. It outlines the theme's design philosophy, client-side gzipped performance budgets, and intentional boundaries (such as manual navigation by default and lack of collection sibling mapping).
- [x] 🟡🌟✅ **Docs/Paths** - Provide complete documentation explaining which path types RavenUI supports, how to alter them in the config, and show example outputs. Ensure layouts and components are aware of these paths so they can dynamically adapt.
  > ***NOTE!*** - **Solution:** Created `docs/paths.md` at permalink `/paths/`. It documents absolute/relative URL resolution filters, trailing slashes, flat vs nested folder layout compatibility, and assets directory mapping.
- [x] 🟢🌟✅ **Docs/FileTypes** - Document when to use .md vs .html extensions for pages and components, explaining any parsing differences.
  > ***NOTE!*** - **Solution:** Created `docs/file-types.md` at permalink `/file-types/`. Covers the Jekyll processing pipeline, `.md` vs `.html` characteristics, RavenUI component file behavior, a decision table, the Kramdown paragraph-wrapping artifact and workaround, and collection document extension rules. Added to sidebar navigation under Configuration.
- [x] 🟡🌟✅ **Docs/Variables** - Document useful Jekyll/Liquid variables and how they interact with components, referencing parent Jekyll documentation.
  > ***NOTE!*** - **Solution:** Created `docs/variables.md` at permalink `/variables/`. It details core Jekyll global scopes (`site`, `page`, `layout`, `content`), custom `site.theme_settings` namespaces (toc, header, borders, analytics, versions), page front-matter metadata configuration overrides, and inline component data-sourcing properties.
- [x] 🟢🌟✅ **Docs/DataConfig** - Author documentation on configuring data files (YAML, JSON) for components, providing clear anchor links for customization options.
  > ***NOTE!*** - **Solution:** Created `docs/data-config.md` at permalink `/data-config/`. Covers all four supported formats (YAML, JSON, CSV, TSV), `data_source` parameter path resolution, format examples with Liquid usage, subfolder cross-reference, and inline `items` vs. `data_source` guidance. Added to sidebar navigation under Configuration.
- [x] 🟢🌟✅ **Docs/DataSubfolders** - Document how to organize and reference data files stored in subfolders under the `_data/` directory.
  > ***NOTE!*** - **Solution:** Created `docs/data-subfolders.md` at permalink `/data-subfolders/`. Covers dot-notation access, directory structure examples, two-level nesting, `data_source` dot-path in components, naming conventions (kebab → underscore), use cases, and compilation caveats. Added to sidebar navigation under Configuration.
- [x] 🟢🌟✅ **Docs/JSONData** - Document and provide examples of utilizing JSON data files (`_data/*.json`) with theme components.
  > ***NOTE!*** - **Solution:** Created `docs/data-json.md` at permalink `/data-json/`. Covers JSON array and object file formats, Liquid iteration, `data_source` component usage, nested JSON dot-notation, CI generation patterns, JSON vs. YAML comparison table, and validation guidance. Added to sidebar navigation under Configuration.


### **Refactoring (priority-6)**
- [x] 🟢🌟✅ **Refactoring/Navigation** - Consolidated component links and verified all URLs. Structure is now lean and logical.
- [x] 🟢🌟✅ **Refactoring/Folders** - Renamed `_includes/components` to `_includes/comps` and updated all 100+ references codebase-wide.
- [x] 🟢🌟✅ **Refactoring/Cleanup** - Removed redundant `docs/components/visual-elements.md`.
  > ***NOTE!*** - **Solution:** File did not exist in the repository at audit time. Task marked complete as the cleanup was already done in a prior session.
- [x] 🟢🌟✅ **Refactoring/WordPremium** - Replaced 'premium' with 'elegant', 'professional', or 'useful' across all SASS comments, layout files, and documentation pages.
- [x] 🟢🩹✅ **Refactoring/Branding** - Change theme name to RavenUI (default dark theme: RavenUI, default light theme: DarkZero) - update Repo title to `ravenui-jekyll-theme` and gem name to `jekyll-theme-ravenui`.
  > ***NOTE!*** - **Solution:** Renamed all project identities and gems to `jekyll-theme-ravenui`.
- [x] 🟡🩹✅ **Refactoring/Vars** - Evaluate changing CSS variables prefix from `zd-` to `ru-` (e.g., `ru-accent` vs `rd-accent`).
  > ***NOTE!*** - **Solution:** Renamed all variables and CSS classes to use the `rd-` prefix.
- [x] 🟢🌟✅ **Refactoring/Repo** - `ravenui-jekyll-theme`
- [x] 🟢🌟✅ **Refactoring/Repo** - `jekyll-theme-ravenui`
  > ***NOTE!*** - **Solution:** Renamed gemspec to `jekyll-theme-ravenui.gemspec` and updated dependencies in `docs/Gemfile` and `.gitlab-ci.yml`.
- [x] 🟢🌟✅ **Refactoring/Repo** - `staticcanvas`
  > ***NOTE!*** - **Solution:** Checked and verified owner settings under `_config.yml` and gemspec author definitions.
- [x] 🟢🌟✅ **Refactoring/Repo** - `https://gitlab.com/staticcanvas/ravenui-jekyll-theme`
  > ***NOTE!*** - **Solution:** Updated repository link pointers inside `_config.yml`, `docs/_config.yml`, and `_includes/core/footer.html`.
- [x] 🟡🌟✅ **Refactoring/Repo** - `A professional, high-contrast Jekyll theme for technical documentation.`
  > ***NOTE!*** - **Solution:** Updated gemspec summary/description and README.md header to introduce RavenUI as both a production-ready theme framework and component library.
- [x] 🟢🌟✅ **Refactoring/Repo** - `MIT`
- [x] 🟡🌟 **Refactoring/Components** - Migrate static layout structures (header, toc, sidebar, footer) to modular components so they can be dynamically rendered within a blank layout. Ensure that child elements automatically scale/adjust based on parent containers to ensure a none-opinionated, highly responsive component system (a "theme that builds itself").
  > ***NOTE!*** - **Solution:** Migrated the static layout frames by creating modular component includes `comps/header.html`, `comps/sidebar.html`, `comps/footer.html`, and `comps/toc.html` with inline JS scroll-spy generation. Added `.rd-header--inline`, `.rd-sidebar--inline`, `.rd-page-toc-container--inline`, and `.rd-footer--inline` SASS styles for seamless canvas grid embedding. Updated `_layouts/default.html` to reference the modular components and documented them in `docs/components/` and the navigation menu.

### **Refine Features (priority-7)**
- [x] 🟢✅ **Refine/Badges** - To help with discoverability, allow the navigation items to have `is_new_feature` in navigation data files to display a glowing badge or status label.
  > ***NOTE!*** - **Solution:** Implemented CSS-based glowing badges (`.rd-nav-badge`) supporting `new`, `updated`, `beta`, and `hot` classifications. Integrated Liquid rendering logic in `sidebar.html` and `header.html`, and added documentation to `docs/navigation.md`.
- [x] 🟢🌟✅ **Refine/Badges** - Implemented shield component and documented it.
- [x] 🟡🌟✅ **Refine/Badges** - Supported via the new customizable tag and shield components.
- [x] 🟡🌟✅ **Refine/Transitions** - Animate social media icons so they morph smoothly from text labels to simple icon logos.
- [x] 🟡🌟✅ **Refine/Collections** - Decided to support collections via a feature flag (`collections: false` by default) to avoid maintaining a separate fork while keeping core theme navigation simple.
  > ***NOTE!*** - **Solution:** Decision recorded in lessons-learned context files.
- [x] 🟡🌟✅ **Refine/Collections** - Add collection support to RavenUI with a feature flag — `collections: false` by default. Users who don't need it see nothing different. Users who do get first-class support without a separate fork to maintain. The `_data/navigation.yml` system stays as the manual/curated path. They coexist.
  > ***NOTE!*** - **Solution:** Implemented core environment flag checks.
    - Full Collections Support:
    - Collection indexes
- [x] 🟡🌟✅ **Refine/Collections** - Expand collections integration with sorting, ordering, and tagging capabilities.
  > ***NOTE!*** - **Solution:** Verified Liquid layouts implementation of custom sorting (`sort_by` supporting date, title, weight/order), tag filtering (`filter_tag`), and manual ordering (`order` and `weight`), and documented these features in `docs/collections.md`.
  * [x] 🟡🌟✅ ***Collections/Tags*** - Support and utilize tags in collection document front-matter for categorizing collection files.
  * [x] 🟡🌟✅ ***Collections/Sorting*** - Support custom sorting parameters (date, weight, or title) for collection documents.
  * [x] 🟡🌟✅ ***Collections/ManualOrdering*** - Support manual ordering of documents in collections using an `order` or `weight` front-matter property.
- [x] 🟡🌟✅ **Refine/Collections** - Build a robust, high-performance, and fully configurable Jekyll collections integration system that coexists seamlessly with the existing static/manual `navigation.yml` configuration (toggled via a feature flag: `collections: false` by default).
  > ***NOTE!*** - **Solution:** Implemented core environment flag checks, auto-sidebar navigation generation, generic collections index layouts, and detailed documentation.
  > ***NOTE!*** - **Note!** This task implements 100% standard Jekyll collection support. It allows users to define custom content groups and automatically render filtered views, index layouts, and structured sidebar hierarchies without duplicating metadata.
  > ***NOTE!*** - **Note!** Split the Collections Integration task into multiple sub-tasks below for a modular, phased implementation and better engineering understanding.
- [x] 🟡🌟✅ **Refine/Transitions** - Basic view transition support implemented for seamless page navigation.
- [x] 🟡🌟✅ **Refine/Transitions** - Enhanced the search modal with an elegant, spring-based animation (`translateY` + `scale`). Standardized transition variables in `_root.scss`.
- [x] 🟡🌟✅ **Audit/Components** - Perform a complete component audit, listing all components and tracking their status (completed, issues, needs refinement).
  > ***NOTE!*** - **Solution:** Completed a full mapping and status audit of all 78 includes in `_includes/comps/` to their corresponding 69 documentation files in `docs/components/`. Verified that all component templates have been fully rebranded, documented, and checked. The full report has been compiled in [component_audit_report.md](file:///home/gsnow/.gemini/antigravity-cli/brain/e2715d69-5954-4674-9c95-f8d40909297f/component_audit_report.md).
- [x] 🟡🌟✅ **Audit/ComponentSystem** - Detailed component system audit. Review all 85 files in `_includes/comps/`, detailing their functionality and potential issues.
  > ***NOTE!*** - **Solution:** Performed a complete code audit of all 85 dynamic components, detailing their use cases, parameters, fallbacks, and potential problems. All includes align 1:1 or are verified via mapping exceptions in the linter, compiling cleanly in Jekyll.
  * [x] 🟢🩹 **animate.html** - Utility component that adds CSS classes for GSAP, Anime.js, AOS, or Animate.css animations.
    > ***NOTE!*** - Depends on external CDN libraries being enabled in `_config.yml`. If they are disabled, the animation classes will have no effect.
  * [x] 🟢🩹 **announcement.html** - Renders a top-of-viewport alert/announcement banner.
    > ***NOTE!*** - Can shift the layout flow unless body padding offsets are dynamically handled.
  * [x] 🟢🩹 **api-reference.html** - Traditional API parameters and details documentation component.
    > ***NOTE!*** - May result in horizontal overflow on small mobile viewports if API parameter tables are excessively wide.
  * [x] 🟢🩹 **breadcrumbs.html** - Generates a hierarchical navigation path.
    > ***NOTE!*** - Depends on logical slash-separated path structures; won't generate deep levels for files located in the root.
  * [x] 🟢🩹 **browser-support.html** - Displays compatibility matrix for modern browser engines.
    > ***NOTE!*** - Completely static; requires manual updates if target browser compatibility details shift.
  * [x] 🟢🩹 **button.html** - Highly configurable button component supporting multiple styles, sizes, and icons.
  * [x] 🟢🩹 **callout.html** - Renders standard colored note/warning callout boxes.
    > ***NOTE!*** - Liquid template parses markdown content inside, which can sometimes result in unwanted double paragraph tags (`<p>`) if whitespace is not trimmed.
  * [x] 🟢🩹 **card-index.html** - Renders a grid of visual navigation cards from navigation data files.
  * [x] 🟢🩹 **card.html** - Content panel box supporting borders, hover scales, and glassmorphism.
  * [x] 🟢🩹 **carousel.html** - Image and text slide-show carousel wrapper.
    > ***NOTE!*** - Slides containing images of different aspect ratios will cause jarring container height changes unless constrained.
  * [x] 🟢🩹 **chartjs.html** - Canvas-based interactive charts rendering using Chart.js.
    > ***NOTE!*** - Requires loading the external Chart.js library from CDN or local; fails if offline or scripts are blocked.
  * [x] 🟢🩹 **codepen.html** - Embeds CodePen examples.
    > ***NOTE!*** - Includes a client-side CORS verification; if the CodePen oEmbed API rate-limits the user, the fallback 404 card will render.
  * [x] 🟢🩹 **codesandbox.html** - Embeds CodeSandbox instances.
  * [x] 🟢🩹 **color-block.html** - Renders a tiny inline color block indicator for styling reference.
  * [x] 🟢🩹 **command-ref.html** - Formats parameters reference for CLI tools.
  * [x] 🟢🩹 **comments.html** - Integrates Giscus or Disqus comment threads.
    > ***NOTE!*** - Requires exact API configuration credentials in `_config.yml`; will fail silently or display errors if missing.
  * [x] 🟢🩹 **copy-button.html** - Standalone click-to-copy clipboard button.
  * [x] 🟢🩹 **customer-callout.html** - Formats customer quotes and testimonials.
  * [x] 🟢🩹 **datatable.html** - Injects and parses YAML, JSON, or CSV data into sortable HTML tables.
    > ***NOTE!*** - Rendering huge tables can cause long Liquid compile times and browser paint lag.
  * [x] 🟢🩹 **dependencies.html** - Lists dependencies for component modules.
  * [x] 🟢🩹 **details.html** - Accessible `<details>` details/summary folding block.
  * [x] 🟢🩹 **example-block.html** - DX template for capturing markdown.
  * [x] 🟢🩹 **example-code.html** - Side-by-side split render for demo layouts.
  * [x] 🟢🩹 **extra-api-fetcher.html** - Fetches dynamic JSON API data with localStorage caching.
    > ***NOTE!*** - Relies on client-side JS; rate limits or CORS headers on target API endpoints will prevent data from loading.
  * [x] 🟢🩹 **extra-media-card.html** - Interactive media card display for fetched datasets.
  * [x] 🟢🩹 **extra-media-details.html** - Renders profiles for Warhammer units or media files.
  * [x] 🟢🩹 **extra-related-carousel.html** - Carousel tracks specifically styled for fetched media cards.
  * [x] 🟢🩹 **extra-spinner.html** - Keyframe-based CSS loading spinner.
  * [x] 🟢🩹 **extra-wiki-grid.html** - Flexible unit stat block grids.
  * [x] 🟢🩹 **faq-item.html** - Individual question/answer collapsible folding block.
  * [x] 🟢🩹 **faq.html** - Grid wrapper container for grouping FAQ items.
  * [x] 🟢🩹 **feature-card.html** - Displays feature info with visual overlays.
  * [x] 🟢🩹 **feature-grid.html** - Multi-column grid showcasing features.
  * [x] 🟢🩹 **feedback.html** - Page helpfulness widget triggering analytics.
    > ***NOTE!*** - Analytics calls are subject to ad-blocker filtering; if tracking scripts fail to load, events won't fire.
  * [x] 🟢🩹 **figure.html** - HTML5 semantic figure container with alignments.
  * [x] 🟢🩹 **font-awesome.html** - Font Awesome vector icons helper.
    > ***NOTE!*** - Relies on a public CDN stylesheet; if offline, custom brand icons won't display.
  * [x] 🟢🩹 **footer-2col.html** - Two-column footer layout.
  * [x] 🟢🩹 **footer-3col.html** - Three-column footer layout.
  * [x] 🟢🩹 **footer-item.html** - Modular footer item builder.
  * [x] 🟢🩹 **git-tags.html** - Renders repository tags from YAML data.
    > ***NOTE!*** - Relies on static data compiled in `_data/git-tags.yml`; does not update dynamically without CLI/CI runs.
  * [x] 🟢🩹 **gradient-text.html** - Renders text with customized linear/radial gradient styling.
  * [x] 🟢🩹 **grid-palette.html** - Showcase grid for theme color palette swatches.
  * [x] 🟢🩹 **grid.html** - Multi-column layout grid composition include.
  * [x] 🟢🩹 **heading.html** - Styled page header with Lucide icon support.
  * [x] 🟢🩹 **hero-card.html** - Renders a large highlighted banner card.
  * [x] 🟢🩹 **hr.html** - Styled horizontal line divider with optional text or icon.
  * [x] 🟢🩹 **icon-grid.html** - Renders a copyable grid of available Lucide icons.
  * [x] 🟢🩹 **icon.html** - Renders Lucide SVG icons.
    > ***NOTE!*** - High icon density on a single page can inflate DOM node counts and impact render speeds.
  * [x] 🟢🩹 **iframe.html** - Lazy-loaded iframe wrapper.
  * [x] 🟢🩹 **image.html** - Responsive image placeholder container with lazy loading and blur-up effects.
  * [x] 🟢🩹 **inline-callout.html** - Tiny inline text note bubbles.
  * [x] 🟢🩹 **kbd-group.html** - Groups shortcut key caps side by side.
  * [x] 🟢🩹 **kbd.html** - Keyboard key cap visual styling.
  * [x] 🟢🩹 **last-edited.html** - Renders last modified date and author details.
    > ***NOTE!*** - Requires manual front-matter or custom generator plugins to populate edit history.
  * [x] 🟢🩹 **likes.html** - Standard client-side heart like button.
    > ***NOTE!*** - Saves state locally in localStorage; does not sync count value to any central database.
  * [x] 🟢🩹 **metrics.html** - General-purpose stats and metrics details container.
  * [x] 🟢🩹 **modal.html** - Accessible dialog modal container.
  * [x] 🟢🩹 **package-tabs.html** - Installation package manager commands toggle (npm/yarn/pnpm/bun).
  * [x] 🟢🩹 **page-nav.html** - Back/Next page navigation arrows.
  * [x] 🟢🩹 **platform-support.html** - Displays deployment hosting targets compatibility indicators.
  * [x] 🟢🩹 **previously-read.html** - Client-side history widget showing visited pages.
    > ***NOTE!*** - Relies on localStorage; history won't persist across different browsers or in private browsing sessions.
  * [x] 🟢🩹 **progress.html** - Scroll reading progress indicator bar.
  * [x] 🟢🩹 **releases.html** - Changelog release timeline generator.
    > ***NOTE!*** - Requires static YAML release data in `_data/releases.yml` which must be updated manually.
  * [x] 🟢🩹 **rendered-el-showcase.html** - Wraps components in a window with tilt details.
  * [x] 🟢🩹 **roadmap-item.html** - Single milestone block with optional progress bar.
  * [x] 🟢🩹 **roadmap.html** - Outer container for mapping roadmap tracks.
  * [x] 🟢🩹 **shield.html** - Generates stylized shields/badges (e.g. key-value badges).
  * [x] 🟢🩹 **simple-icon.html** - Loads vector icons from Simple Icons.
    > ***NOTE!*** - Relies on static SVG paths; missing brands won't display.
  * [x] 🟢🩹 **site-stats.html** - Displays overall counts (posts, tags, categories, words, read time).
    > ***NOTE!*** - Heavy Liquid calculations can slow down site compilation times on repositories with thousands of posts.
  * [x] 🟢🩹 **sitemap.html** - Renders dynamic folder-structure sitemap.
    > ***NOTE!*** - Scanning all files recursively in Liquid is resource-intensive for large websites.
  * [x] 🟢🩹 **sponsored-by.html** - Logo showcase for sponsor grids.
  * [x] 🟢🩹 **steps.html** - Multi-step sequential tutorial progress tracker.
  * [x] 🟢🩹 **svgcharts.html** - Pure SVG charts (line, bar, pie, doughnut, radar) built entirely in Liquid.
    > ***NOTE!*** - Math calculations in Liquid are slow and limited; complex charts with thousands of points can exhaust memory limits.
  * [x] 🟢🩹 **tag-cloud.html** - Displays tag cloud weighted by count.
  * [x] 🟢🩹 **tag.html** - Renders single stylized category/tag label.
  * [x] 🟢🩹 **terminal.html** - Interactive mockup window mimicking CLI terminal shell.
  * [x] 🟢🩹 **theme-toggle.html** - Theme selection buttons/dropdown selector.
  * [x] 🟢🩹 **timeline.html** - Vertical chronological list tracker.
  * [x] 🟢🩹 **tooltip.html** - Pure-CSS hover/focus info bubbles.
    > ***NOTE!*** - Static positioning makes it prone to clipping at viewport edges.
  * [x] 🟢🩹 **tree.html** - Folder layout tree display helper.
  * [x] 🟢🩹 **typewriter.html** - Animated typewriter headings.
    > ***NOTE!*** - Raw typewriter tags can pollute TOC heading titles unless cleaned up by JS parser.
  * [x] 🟢🩹 **version-switcher.html** - Multi-version documentation select switcher.
    > ***NOTE!*** - Relies on static version array configurations; will not dynamically forward to the corresponding page relative path.
  * [x] 🟢🩹 **vhs.html** - Retro screen scanlines visual effects overlay.
  * [x] 🟢🩹 **written-by.html** - Author card displaying name, avatar, bio, and social handles.
    > ***NOTE!*** - Relies on author profiles registered in site data file; defaults to generic fallback if missing.
  * [x] 🟢🩹 **youtube.html** - YouTube video player wrapper.


### **Refine Documentation (priority-8)**
- [x] 🟡🌟✅ **Audit/Visual** - Completed full pass on all 22 component pages; verified consistency in API tables and examples.
- [x] 🟢🌟✅ **Audit/Accessibility** - Walk through each documentation page and compile a detailed log of visual inconsistencies, bugs, potential fixes, and design improvements.
  > ***NOTE!*** - **Solution:** Standardized all documentation headings to use `comps/heading.html` includes, and recursively refactored all instances of `ZeroDark SP` and `ZeroDark` to the correct brand name `RavenUI` across 70+ files.
- [x] 🟡🌟✅ **Audit/Component** - Check comps/* components that do not have corresponding docs/* documentation pages.
- [x] 🟡🌟✅ **Audit/Code** - Check CSS, JS, and Liquid for any unused code. For components, add a multi-line Liquid comment to the top of the file explaining the component's purpose, caveats, and usage, and update the docs to reflect this.



## **Archived on 2026-06-17 05:15:46**

### **Issues Remaining (priority-1)**
- [x] 🟢✅ **Project Rename** - RavenUI
  - RepoTitle: `ravenui-jekyll-theme`
  - gemtitle: `jekyll-theme-ravenui`
  - `rvcli` > `rvcli`
  - css vars `rd-` (short for raven-data)
  > ***NOTE!*** - **Solution:** Rebranded the repository, gem name, configurations, files, directories, and CLI tools from `zdcli` to `rvcli`. Updated all CSS variable and class prefixes to `rd-` (short for raven-data) as selected by the user.
- [x] 🟡🌟✅ **UI/TOC** - Add optional animations, page-load transitions, hover effects, and configurations to the Table of Contents (TOC).
  > ***NOTE!*** - **Solution:** Implemented `site.theme_settings.toc.animations` config flag, loaded `data-toc-animations` attribute on body, added CSS page-load fadeInUp and link-hover horizontal translations, and documented the feature in configuration and navigation references.
- [x] 🟢🌟✅ **UI/Codeblock** - Refine code block language highlights to either span the whole block header or render as a compact badge, controlled via configuration.
  > ***NOTE!*** - **Solution:** Implemented `theme_settings.code.lang_style` config option (`badge`, `header`) exposed via a body data attribute, allowing code block headers to render as a full-width top bar holding language names and alignment properties.
- [x] 🟢🌟✅ **UI/Codeblock** - Add support for line numbers in code blocks and custom horizontal scrollbars.
  > ***NOTE!*** - **Solution:** Supported standard Firefox scrollbars using standard `scrollbar-width` and `scrollbar-color` properties in `_sass/rogue/_ethereal.scss` alongside Webkit scrollbars.
- [x] 🟡🌟✅ **UI/Carousel** - Update the image carousel to use Lorem Picsum photos and custom captions.
  > ***NOTE!*** - **Solution:** Refined `/docs/components/carousel.md` example to query Lorem Picsum ID images.
- [x] 🟡🌟✅ **UI/Progress** - Hide progress bars by default, exposing a parameter to enable and configure progress levels.
  > ***NOTE!*** - **Solution:** Configured `roadmap-item.html` to hide progress bars by default, rendering them only when `show_progress=true` is passed.
- [x] 🟡🌟✅ **UI/GitTags** - Allow switching git tags displays between card grid layouts and clean lists.
  > ***NOTE!*** - **Solution:** Upgraded `git-tags.html` to accept a `layout` parameter that switches between the standard grid card display and a clean, list layout using `.rd-git-tags-list` and `.rd-git-tag-item` styles.
- [x] 🟢🌟✅ **UI/Scrollbars** - Implement custom scrollbars for main content and sidebars.
- [x] 🟡🌟✅ **CLI/GemDistribution** - Resolve how users invoke the CLI (`rvcli`) when using the theme as a Ruby gem. Package the executable with the gem and ensure it detects theme state so builders avoid manually running bundler, npm, or Jekyll commands.
  > ***NOTE!*** - **Solution:** Packaged `bin/rvcli` as a Ruby script wrapper inside the gem configuration so it works natively on Unix and Windows (wrapped by RubyGems). Added `tools/` and `rvcli.ps1` to the packed gem files list. Refactored the CLI's root detector to traverse up from the active console working directory instead of the script's installation directory to correctly find the user's project configurations.

### **Enhancements (priority-2)**
- [x] 🟡🌟✅ **UI/Navigation** - Implemented `card-index.html` which utilizes `site.data.navigation` to generate visual navigation cards with titles, icons, and descriptions.
- [x] 🟡🌟✅ **UI/Navigation** - Grouped components into logical categories in `_data/navigation.yml` (Display, Elements, Interactive, Data).
- [x] 🟡🌟✅ **UI/Colors** - Design and implement the color palette for DarkZero (the light theme variant for RavenUI), integrating it into the theme manager.
  > ***NOTE!*** - **Solution:** Implemented the "DarkZero" light theme variant under `[data-theme="light"]` in `_root.scss` and refactored typography, base styles, and keyboard/blockquote elements to dynamically adapt.
- [x] 🟢🌟✅ **UI/Header** - Introduce and add configuration options for a sticky top bar / header navigation.
  > ***NOTE!*** - **Solution:** Supported sticky header layout option under `theme_settings.header.sticky` with auto-adjusting sidebar spacing and offsets.
- [x] 🟢🌟✅ **UI/Navigation** - Add options for navigation bar layout densities (e.g., default and compact) following the theme's current spacing implementations.
  > ***NOTE!*** - **Solution:** Implemented layout density support under `theme_settings.header.density` (`compact`, `default`, `relaxed`) with custom height transitions, navigation gap sizes, and font scales.
- [x] 🟡🌟✅ **UI/Borders** - Allow adjusting border colors, types, and styles. Support solid, dotted, and gradient borders (linear or radial) to customize the visual feel while keeping current borders as default.
  > ***NOTE!*** - **Solution:** Added advanced styling capabilities under `theme_settings.borders` to override border style, width, color, and enable gradient borders.
- [x] 🟡🌟✅ **UI/Backgrounds** - Introduce advanced background styling options. Support gradient backgrounds with customizable directions, steps, and colors. Support a backdrop layer in front of background elements with configurable opacity and patterns.
  > ***NOTE!*** - **Solution:** Implemented background gradients and backdrop pattern overlays (`grid`, `dots`, `diagonal` patterns with custom opacity) in `theme_settings.background` applied via a body pseudo-element.
- [x] 🟡🌟✅ **UI/Animations** - Enable subtle, non-distracting background animations that do not disrupt the user's focus or reading flow.
  > ***NOTE!*** - **Solution:** Implemented background gradient shifting and backdrop pattern panning (`grid`, `dots`, `diagonal`) using CSS `@keyframes` that loop seamlessly.
- [x] 🟡🌟✅ **UI/Animations** - Add configurable page-load and navigation entry/exit animations (configurable via `_config.yml`).
  > ***NOTE!*** - **Solution:** Supported custom page load animations (`fade-in`, `fade-in-up`, `slide-in-left`, `zoom-in`) mapped via CSS custom properties and enabled browser-native cross-document View Transitions.
- [x] 🟡🌟✅ **UI/Animations** - Support external animation libraries (choose four of the best JS/CSS options) via feature flags, providing Liquid includes for all elements.
  > ***NOTE!*** - **Solution:** Provided full support for Animate.css, AOS, GSAP, and Anime.js. Created `_includes/comps/animate.html` to generate element classes/attributes, and loaded/initialized scripts in layout templates.
- [x] 🟡🌟✅ **UI/Branding** - Evaluate the two brand kits (first and second iteration). Determine if the second iteration (using the RavenUI 'Z' logo) is a better choice for the default branding.
  > ***NOTE!*** - **Solution:** Evaluated the first (text-only) and second (SVG block-based Z-mark) branding iterations. Selected the second iteration (Z logo SVG) as the default branding because it provides a modern, developer-centric identity that aligns with the high-contrast coding aesthetic. Copied the logo asset to `assets/img/logo.svg` and `assets/images/logo.svg` to ensure it is packaged within the theme gem assets and correctly referenced by default.
- [x] 🟢🌟✅ **UI/FocusRings** - Standardize focus-visible rings across all interactive elements.
- [x] 🟢🌟✅ **UI/Footer** - Added "Powered by ZeroDark SP" footer link with optional visibility toggles.
- [x] 🟡🩹✅ **UI/Animations** - Add subtle animations to components like callouts, badges, tags, heroes, and cards that make sense but are not too distracting (e.g., page loads, transitions, and scrolls). Set an object in the global config that can be used to enable or disable animations.
- [x] 🟢🌟✅ **UI/Comments** - Add descriptive Liquid comments to the top of all component files explaining the component's purpose, caveats, and usage examples, and update the documentation accordingly.
- [x] 🟡🩹✅ **UI/Sidebar** - Expose three configurable layouts for the sidebar logo, title, and subtext.
- [x] 🟢🩹✅ **UI/Header** - As well as the three-column layout, we should give the user the ability to have a header bar and allow `site.data.navheader` where users can add additional navigation items. View on GitLab: badges can change orientation from left to right or middle.
  > ***NOTE!*** - **Solution:** Implemented Top Header Bar layout options under `theme_settings.header` supporting glassmorphism styling, custom data links via `_data/navheader.yml`, flexible link alignment, and auto-adjusting sidebar spacing and offsets.
- [x] 🟢🌟✅ **UI/Navigation** - Added `docs/releases.md` to `_data/navigation.yml` under "Components".
- [x] 🟡🌟✅ **UI/Fonts & Libraries** - Evaluate fonts and integrations for external JS libraries to make it easier for site builders to import them.
  > ***NOTE!*** - **Solution:** Extended `head.html` and `foot.html` to dynamically inject custom stylesheet and script arrays (`custom_stylesheets`, `custom_scripts_head`, `custom_scripts_foot`, and `typography.custom_font_stylesheets`) defined directly in `_config.yml` without modifying core theme files. Updated documentation in `docs/configuration.md` to reflect the new capabilities.
- [x] 🟡🩹✅ **Enhancements/Compatibility** - Gate plugin-dependent features behind configuration flags and document platform support limits (GitHub Pages restricted plugins vs GitLab Pages custom plugin support).
  > ***NOTE!*** - **Solution:** Introduced `theme_settings.compatibility.disable_custom_plugins` flag to simulate safe-mode behavior locally. Integrated it alongside `site.safe` inside components that rely on the custom `from_yaml` Ruby filter. Documented platform support boundaries in `docs/installation-advanced.md` and the compatibility flags in `docs/configuration.md`.
- [x] 🟡🩹✅ **Enhancements/CustomVariables** - Allow components to accept custom user-defined variables from page front-matter or site configuration.
  > ***NOTE!*** - **Solution:** Enabled all data-driven and visual components to look up page-level front-matter and global site/theme settings as fallback variables (e.g. `page.carousel_items`, `page.hero_title`, etc.) when direct include parameters are omitted.
- [x] 🟢🩹✅ **Enhancements/Placeholders** - Implement elegant placeholder fallbacks for images and text across all components when configurations or data fields are omitted.
  > ***NOTE!*** - **Solution:** Added robust visual card placeholders (dashed border, SVG icons, and labels) for the `image` component and default text fallbacks for `card` and `hero-card` components to prevent layout breaks when fields are omitted.
- [x] 🟡🩹✅ **Enhancements/DataFlexibility** - Provide components with flexible parsing options so users can retrieve and render data from custom paths and formats.
  > ***NOTE!*** - **Solution:** Built a dynamic Liquid dot-separated nested path resolution system. This allows components to load data from deeply nested structures (e.g., `data_source="nested.sub.key"`) within `_data/` files, or fall back to front-matter/site configurations.
- [x] 🟡🩹✅ **Enhancements/FlatFiles** - Ensure all layouts and navigation features support a flat-file site structure without requiring nested folders or collections.
  > ***NOTE!*** - **Solution:** Normalized link matching and breadcrumbs structures to automatically parse and match URLs with or without trailing slashes, `.html` extensions, or directory configurations. Added documentation in `docs/navigation.md`.

### **Features (priority-3)**
- [x] 🟡🌟✅ **UI/Carousel** - Added support for non-image custom content slides.
  > ***NOTE!*** - **Solution:** Upgraded `_includes/comps/carousel.html` and added CSS rules for `.rd-carousel-custom-content` to conditionally render text/HTML slides when `item.content` is specified.
- [x] 🟢🌟✅ **UI/Feedback** - Refactored tracking to make PostHog a first-class citizen over Google Analytics, and supported toggling/disabling analytics. Added configurations for Umami and Plausible self-hosted analytics.
  > ***NOTE!*** - **Solution:** Implemented the `theme_settings.analytics` config block with support for `posthog`, `google_analytics`, `umami`, and `plausible`. Rewrote `head.html` to inject appropriate tracker scripts and gated it against development environments via `enable_in_dev`. Updated the `feedback.html` click handler to map click events cleanly to the active provider API.
- [x] 🟢🌟✅ **UI/CodePen** - Handle missing configurations gracefully, and add a client-side public CodePen oEmbed API check to identify invalid embeds and replace them with a stylized 404 fallback card.
  > ***NOTE!*** - **Solution:** Handled missing configurations gracefully, and added a client-side public CodePen oEmbed API check to identify invalid embeds and replace them with a stylized 404 fallback card.
- [x] 🟢🌟✅ **UI/Navbar** - Ensure the CodePen icon renders correctly in the navbar.
  > ***NOTE!*** - **Solution:** Updated navigation links to forward style parameter (e.g. `style: fab` and `source: fa`) enabling proper brand icon rendering with Font Awesome.
- [x] 🟡🌟✅ **UI/TOC** - Ensure the mobile TOC displays with a proper glassmorphism layout and toggle states.
  > ***NOTE!*** - **Solution:** The TOC button is clickable on mobile, and the container now displays correctly with a glassmorphism effect and proper positioning. Fixed via `_layouts/default.html` and `_sass/ravenui-sp/_toc.scss`.
- [x] 🟡🌟✅ **UI/ExampleBlock** - Implemented `example-block.html` to support captured Markdown content. This provides a much better DX for documenting multi-line code examples.
- [x] 🟡🩹✅ **UI/EditButton** - Implemented a unified `repository` configuration in `_config.yml` supporting GitHub, GitLab, Bitbucket, and Codeberg. Added support for "vscode" mode (GitHub.dev and GitLab Web IDE). Updated `_includes/core/footer.html` with dynamic logic.
- [x] 🟡🌟✅ **UI/Sidebar** - Re-implemented scroll persistence with an early-execution inline script. This eliminates flickering by setting the scroll position before the first paint.
- [x] 🟡🌟✅ **DX/Includes** - Refactored `_includes/` into logical subfolders (`core/`, `comps/`, etc.) for better DX and modularity.
- [x] 🟡🌟✅ **UI/TOC** - Performed a global audit and promoted headings (H3 -> H2) across major docs to ensure a consistent H1
  > ***NOTE!*** - H2
- [x] 🟡🌟✅ **UI/Blog** - Finalized a high-density, linear blog list layout (`_layouts/blog-list.html`) with metadata (author, date, tags) and descriptions.
- [x] 🟡🌟✅ **DX/Verification** - Verified 1:1 mapping for all 22 includes (including sub-components like `roadmap-item`).
  > ***NOTE!*** - **Solution:** Audited and verified that all includes under `_includes/comps/` are accounted for and documented 1:1.
- [x] 🟡🌟✅ **DX/Lists** - Consolidated "Stylized Markdown Lists" into `docs/markdown.md`.
  > ***NOTE!*** - **Solution:** Verified list styling features are documented under a dedicated section in `docs/markdown.md`.
- [x] 🟡🌟✅ **UI/Components** - Expanded the gallery in `docs/components/index.md` to showcase all 4 component categories.
- [x] 🟡🌟✅ **DX/Build** - Successfully verified project integrity with `bundle exec jekyll build`.
- [x] 🟡🌟✅ **Features/Search** - Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: Wasm-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia). Make sure all are configured, working, and documented.
- [x] 🟢🌟✅ **Features/Search** - Corrected CDN URLs in `_includes/core/head.html` from non-existent `/dist/` paths to the correct npm directory locations (`css/ui.css` and `ui.js`). Configured JS to load as `type="module"` and updated search initialization in `_layouts/default.html` to poll for the `PagefindUI` object to handle asynchronous loading.
- [x] 🟡🌟✅ **UI/Fonts** - Replaced the invalid pipe character (`|`) family separator in Google Fonts configurations with the standard `&family=` parameter structure required by the Google Fonts `/css2` API to prevent HTML 400 MIME blocks.
- [x] 🟢🌟✅ **UI/Icons** - Confirmed CDN icons are online and working. `NS_BINDING_ABORTED` is a standard browser navigation behavior and does not reflect an invalid icon URL or layout bug.
- [x] 🟡🌟✅ **UI/Refinement** - Applied visual polish to splash components (cards, buttons, terminals) including subtle elevations, refined borders (`color-mix`), and scale-based interactive states.
- [x] 🟢🌟✅ **UI/Checkbox** - Refine Checkbox accessibility (focus rings, disabled states).
- [x] 🟢🌟✅ **UI/Sidebar** - Add smooth transition to sidebar backdrop-filter on toggle.
- [x] 🟢🌟✅ **UI/Hero** - Reduce hero headings padding.
- [x] 🟢🌟✅ **UI/GridPalette** - Implement `grid-palette` component for showcasing color palettes.
- [x] 🟢🩹✅ **UI/Sidebar** - Configurable sidebar navigation padding via `_config.yml` (compact, tight, comfy, spacy).
- [x] 🟡🌟✅ **UI/DesignSystem** - Added Fluent UI-specific variables to `_sass/ravenui-sp/_root.scss` (Elevations, Radius, Transitions).
- [x] 🟢🌟✅ **UI/Hero** - Added configurable `rd_nav_spacing` (compact, tight, comfy, spacy) support to headings (h2, h3) and hero sections via `head.html` and SCSS variables.
- [x] 🟡🌟✅ **UI/Codeblock** - Fixed copy button and language labels overlap by moving the language label to the left and copy button to the far right.
- [x] 🟡🌟✅ **UI/Codeblock** - Ensured code blocks are centered on mobile by setting `margin-inline: 0` and `width: 100%` in mobile media queries.
- [x] 🟢🌟✅ **UI/Tags** - Introduced a subtle pastel color palette for tags (`.rd-tag--blue`, `--purple`, etc.) with matching borders for improved readability.
- [x] 🟡🌟✅ **UI/CardIndex** - Component styling is fixed; display layout is now clean and logical.
- [x] 🟡🌟✅ **UI/Codeblock** - Language label compact spans overlapping with copy button fixed; added slight margin/padding above the highlight div.
- [x] 🟡🌟✅ **UI/GridPalette** - Outputs color from YAML captured in the include successfully.
- [x] 🟡🌟✅ **UI/GridPalette** - Adjustable to allow grid palette of colors with a custom size (e.g. 12px or 24px), setting the size of the grid, and grid palettes for apps, devices, etc.
- [x] 🟡🌟✅ **UI/GridPalette** - Showcases theme color palette on a new showcase page and navigation route.
- [x] 🟡🌟✅ **DX/Deployment** - Moved menu object location in sidebar to its own top-level title header.
- [x] 🟡🌟✅ **UI/ColorBlock** - Designed as a single line of code to render inline inside tables and other elements without breaking layout flow.
- [x] 🟡🌟✅ **UI/GitTags** - Git tags and releases tags are separated logically.
- [x] 🟡🌟✅ **UI/Sidebar** - Added sidebar section separators and section titles that flow with the theme.
- [x] 🟡🌟✅ **UI/Colors** - Integrated palette colors (Viridian, Note, Warning, Danger, Black, Void, Ink, Slate, Steel, Mist, Smoke, Ash, Silver, Ghost, White) and custom border colors in `_root.scss`.
- [x] 🟡🌟✅ **UI/Typography** - Set `h1` to Fraunces 400, `h2` to Fraunces 500, and `h3` to IBM Plex Sans 500.
- [x] 🟡🌟✅ **UI/Callout** - Added `inline` parameter to component callout to support inline callout bubbles.
- [x] 🟡🌟✅ **DX/Data** - Correctly mapped tags and release data lists from YAML data sources.
- [x] 🟡🌟✅ **UI/Sidebar** - Restructured Deployment section to have its own sidebar menu category.
- [x] 🟡🌟✅ **UI/Button** - Added button examples (GETTING STARTED, VIEW SOURCE, EDIT THIS PAGE) supporting colors, sizes, icons, borders, and border-radius.
- [x] 🟢🌟✅ **UI/Releases** - Added icon to releases menu item.
- [x] 🟢🌟✅ **UI/ColorGrid** - Updated color-grid layout to support custom grid spacing and the extended color palette.
- [x] 🟡🌟✅ **UI/GradientText** - Implemented `gradient-text.html` component and documented usage.
- [x] 🟡🌟✅ **Features/Mermaid** - Added native support for Mermaid.js diagrams and documented it.
- [x] 🟡🌟✅ **Features/LaTeX** - Added KaTeX math expressions support and documented it.
- [x] 🟡🌟✅ **UI/Callout** - Added `inline-callout.html` component and documented it.
- [x] 🟡🌟✅ **UI/VersionTag** - Created `tag.html` component with dedicated semantic release tags (`beta`, `rc`, `release`, `major`, `version`).
- [x] 🟡🌟✅ **UI/Splash** - Design a professional, informative, useful, and elegant splash page. ZeroDark SP is a highly involved theme, extending beyond just standard documentation (approaching the versatility of daisyUI). Since the splash page is the first page a user sees, it should showcase the theme's features, layout options, and aesthetic range in an elegant way.
- [x] 🟡🌟✅ **Features/Search** - Pagefind JS and CSS local files. We use the same logic as fonts and allow local or CDN for maximum compatibility.
  > ***NOTE!*** - **Solution:** Implemented conditional head asset injection for Pagefind local/CDN stylesheets and scripts.
- [x] 🟡🌟✅ **Features/Search** - Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: WASM-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia). Make sure all are configured, working, and have corresponding docs.
  > ***NOTE!*** - **Solution:** Integrated Pagefind, Algolia Search Lite, and a zero-dependency local search client (`rd-search-local.js`) fallback. Created dynamic Liquid `search-index.json` builder. Exposed settings via `theme_settings.search`.
- [x] 🟡🌟✅ **Features/Theme** - Add a theme manager to the site. Users can specify 1 to * themes; if only two, a theme toggle will appear, and if more than two, a dropdown will appear.
  > ***NOTE!*** - **Solution:** Created the `theme-toggle.html` component that dynamically displays a button toggle (for 2 themes) or a select dropdown (for 3+ themes) based on `site.theme_settings.themes`.
- [x] 🟡🌟✅ **Features/VersionSwitcher** - Add support for a multi-version documentation switcher (disabled by default).
  > ***NOTE!*** - **Solution:** Created the `version-switcher.html` component that dynamically displays a version select dropdown based on `site.theme_settings.versions`. Included it in `sidebar.html` branding section, added styles in `_navigation.scss`, and documented configuration options in `docs/configuration.md`.
- [x] 🟡🌟✅ **UI/Progress** - Implemented progress bar component and documented it.
- [x] 🟡🌟✅ **UI/WrittenBy** - Created written-by component to display authors profile information dynamically.
- [x] 🟢🌟✅ **Features/Charts** - Created svgcharts component - support for line, bar, pie, doughnut, radar, polar area, bubble, also support sourcing from site.data.placeholderName and scatter charts, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Charts** - Created chartjs component - support for line, bar, pie, doughnut, radar, polar area, bubble, also support sourcing from site.data.placeholderName and scatter charts, update docs to reflect feature.
- [x] 🟡🌟✅ **Features/Charts** - Support other well known charting libraries, maybe we can make a generic chart component that can be used for any charting library, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/CodePen** - Created codepen component - allows users to embed CodePens with ease, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/CodeSandbox** - Created code sandbox component - allows users to embed CodeSandboxes with ease, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/YouTube** - Created youtube component - allows users to embed YouTube videos with ease, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Sponsor** - Created sponsored-by component - allows users to add a sponsored by section with logo and link to sponsor, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Testimonial** - Created customer callout component - users that have used the product and liked it.
- [x] 🟢🌟✅ **Features/Timestamp** - Created new component: last edited. Should have the last edited date and author. This can be enabled in _config; defaults to showing edited date and time.
- [x] 🟢🌟✅ **Features/Image** - Created image component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Iframe** - Created iframe component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] 🟢🌟✅ **UI/Showcase** - Created rendered-el-showcase.html - wraps the element in another element with an SVG containing tilted vertical lines, a title, and logo as an example of rendered code. We allow users to specify title name, size, and icon.
- [x] 🟡🌟✅ **UI/HeadingAnchors** - Created headings "link" anchor invisible by default, user can enable always visible in _config, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/ReadingTracker** - previously read: a localStorage-backed page tracker that can be used to show users which pages they have already read, update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Analytics** - enable Google Analytics and update docs to reflect feature.
- [x] 🟢🌟✅ **Features/Analytics** - enable posting to Google Analytics when a user clicks on a link, update docs to reflect feature.
- [x] 🟡🌟✅ **UI/Carousel** - Image carousel component - supports lazy loading, blur up, and different sizes for responsive design, update docs to reflect feature.
- [x] 🟡🌟✅ **UI/Typewriter** - Implemented typewriter component and documented it.
- [x] 🟢🌟✅ **UI/FAQ** - Implemented FAQ component and FAQ item component, and documented usage.
- [x] 🟡🌟✅ **UI/Markdown** - Make sure all markdown elements are themed correctly to match the theme, update docs to reflect feature.
- [x] 🟡🌟✅ **UI/API** - change api-ref to command-ref; create a new component called api-reference which can be used for traditional API documentation akin to web (not CLI).
- [x] 🟡🌟✅ **UI/Layouts** - Example pages for all the different layouts. These do not need to be in the menu; just a page and a button going back to the previous page.
- [x] 🟢🌟✅ **UI/Divider** - Implemented `hr.html` component supporting gradient lines and centered text/icons.
- [x] 🟡🌟✅ **UI/Logo** - add version badge to the top of the page perhaps after // DOCS SubText use our existing version tag component, enable via _config. update documents to reflect
- [x] 🟡🌟✅ **UI/Logo** - change badge location to inside logo so it appears inline after // DOCS SubText, add icon and color, update docs to reflect
- [x] 🟡🌟✅ **UI/Footer** - Extend the footer to include a _includes/core/foot.html partial, which can be used to add custom content to the bottom of the page. This can include links to social media, copyright information, or other relevant details. The footer is currently hardcoded to include the copyright and social media links, so this would need to be updated to accommodate any additional content.
- [x] 🟡🌟✅ **UI/Details** - Collapsible details/summary block component for optional content folding.
- [x] 🟡🌟✅ **UI/KBD** - Keyboard shortcuts group component to render standard KBD keys side by side.
- [x] 🟢🌟✅ **UI/Alert** - Full-width viewport alert/announcement banner component for site-wide alerts.
- [x] 🟢🌟✅ **UI/CopyButton** - Standalone copy-to-clipboard button component for arbitrary inline text blocks.
- [x] 🟢🌟✅ **UI/IconShowcase** - Icon showcase grid component to present groups of icons with copy triggers.
- [x] 🟢🌟✅ **UI/Feedback** - Dynamic feedback widget component ("Was this page helpful?") with analytics hooks.
- [x] 🟢🌟✅ **UI/DirectoryTree** - CSS-based file directory tree diagram component to showcase project layout structures.
- [x] 🟢🌟✅ **UI/Tooltip** - Pure-CSS context tooltip component for definitions and abbreviations.
- [x] 🟢🌟✅ **UI/KPIMetrics** - High-density system metrics container component to group metrics/stats cards.
- [x] 🟡🌟✅ **Features/DataTable** - Component that can be used to display data in a table format, with sorting, filtering, and pagination. Source: `_data/table1.json` | `_data/table2.yaml` | `_data/table3.csv` for structured data injection.
- [x] 🟢🌟✅ **UI/TagCloud** - Renders all site tags sized by post count. Links to filtered index pages.
- [x] 🟢🌟✅ **UI/Modal** - Accessible dialog overlay. Focus trap, ESC close, aria-modal. Content via include slot.
- [x] 🟢🌟✅ **Features/Metrics** - Auto-calculated counts: posts, tags, categories, words, reading time. Displayed in about/meta pages.
- [x] 🟡🌟✅ **UI/FigureCaption** - Semantic figure+figcaption. Supports alignment (left/right float, full-width). Optional link.
- [x] 🟡🌟✅ **Features/OGImage** - A Jekyll plugin or template that auto-generates social sharing images containing the post title, category, and date.
  > ***NOTE!*** - **Solution:** Created a custom Jekyll Generator plugin `_plugins/og_image_generator.rb` that dynamically generates stylized, branded SVG Open Graph sharing images holding the title, category, and date of pages and posts. It automatically sets the page metadata for `jekyll-seo-tag` integration, bypasses Safe Mode compiles cleanly, and includes an explicit head tag fallback in `head.html` using `site.theme_settings.og_image.default`.
- [x] 🟢🌟✅ **UI/StepIndicator** - Visual step indicator for multi-part tutorials or onboarding. Active, complete, upcoming states.
- [x] 🟢🌟✅ **UI/Tooltip** - Hover/focus tooltip via CSS or JS. Placement auto-flip. ARIA-described.
- [x] 🟢🌟✅ **UI/FeatureGrid** - A grid component (2-4 columns) showcasing icons, titles, and descriptions, sourcing its items from page front-matter or a YAML/JSON data file.
- [x] 🟡🌟✅ **Features/Timeline** - Vertical chronological list. Each entry: date, heading, body. Reads from YAML.
- [x] 🟡🌟✅ **DX/Annotations** - Since many components depend on others, document these dependencies in Liquid comments and documentation. Optionally, define dependencies in the front-matter YAML header of components and render them beautifully using a dedicated dependency component.
- [x] 🟡🌟✅ **UI/TOC** - Ensure the Table of Contents (TOC) only picks up headings from the main article content rather than auxiliary headings inside widgets or layout components.
- [x] 🟡🌟✅ **DX/CI** - Bundler before-script does not like to be run as root. I have removed the before-script for global scope and attached it to the build stage. I'm unsure how to fix this; this is causing the build to fail. Source Bundler documentation to find a fix.
- [x] 🟡🌟✅ **Features/Search** - Fully support Algolia search, Lyra/Lucia search, and Pagefind. Provide three distinct options: Wasm-based (Pagefind), client-side JS-based (Lyra), and hosted-service (Algolia).
- [x] 🟢🌟✅ **UI/Feedback** - Support static page likes, comments, and reviews.
  > ***NOTE!*** - **Solution:** Implemented the `likes.html` component that provides a client-side heart like button (saving state to localStorage and firing analytics events) and the `comments.html` component that embeds Disqus or Giscus discussion threads dynamically based on `site.theme_settings.feedback`. Integrated both components into `default.html` layout and documented options in `docs/configuration.md`.
- [x] 🟡🌟✅ **Features/Charts** - Render site stats using visual charts.
  > ***NOTE!*** - **Solution:** Upgraded `site-stats.html` with an optional `show_charts=true` parameter. When active, it aggregates tag and category post counts and passes them as datasets into either the `chartjs` or `svg` rendering engines. Documented it in `docs/components/site-stats.md`.
- [x] 🟡🌟✅ **UI/Tickers** - Integrate subtle pneumatic micro-animations and numeric tickers for stats.
  > ***NOTE!*** - **Solution:** Added data-ticker-value attributes to site stats and high-density metric elements. Implemented the setupNumericTickers counting engine inside default.html using IntersectionObserver, requestAnimationFrame, and cubic easeOut. Added CSS animation rules in _metrics.scss to trigger a scale/brightness pop on animation completion.
- [x] 🟡🌟✅ **UI/Grids** - Refactor complex layout snippets into modular components and expose utility grids for layout composition.
  > ***NOTE!*** - **Solution:** Refactored grid systems by creating a general-purpose, highly configurable layout include in comps/grid.html supporting customizable desktop/tablet/mobile column counts, gap styles, styles injection, and responsive content mapping. Created documentation in docs/components/grid.md.
- [x] 🟡🌟✅ **UI/Branding** - Partitioned branding elements into top and bottom rows with styling offsets to ensure `inline`, `stacked`, and `split` layouts align dynamically and display elegantly.
  > ***NOTE!*** - **Solution:** Partitioned branding elements into `rd-brand-top-row` and `rd-brand-bottom-row` containers in `sidebar.html`. Provided CSS definitions in `_navigation.scss` for `.rd-brand--inline`, `.rd-brand--stacked`, and `.rd-brand--split` layouts to ensure brand assets, text, and version tags scale, align, and offset elegantly across different branding styles.
- [x] 🟡🌟✅ **UI/TOC** - Implement three TOC styles (lines, nodes, simple/default) configurable in `_config.yml`, along with customizable font sizes.
  > ***NOTE!*** - **Solution:** Implemented `theme_settings.toc` layout styles (`simple`, `lines`, `nodes`) and sizing densities (`compact`, `default`, `relaxed`) in CSS and default layouts.
- [x] 🟢🌟✅ **DX/Environment** - Prevents PostHog or Google Analytics from polluting production metrics.
- [x] 🟡🌟✅ **DX/CI** - Minification only runs in CI. Add to the CI step alongside linting — but be mindful that linters may break Liquid syntax that requires single-line formatting. Icons and other elements nested inside other elements will break if their HTML spans multiple lines. There are workarounds, but I prefer to note this directly in the component documentation, as I have done with almost all components, so developers can read and understand why.
  > ***NOTE!*** - **Solution:** Integrated the pwsh workspace linter into the test_build job and created tools/minify.ps1 (a PowerShell-based HTML/CSS/JS minifier that preserves code/pre/script formatting via placeholders) which runs during cloudflare_pages production deployments. Also patched the workspace linter to strip IAL tags before checking heading bolding.
- [x] 🟢🌟✅ **UI/Footer** - Allows construction of footer sections using discrete items: links, icons, logos, images, iframes, badges, and more. Using `footer-item` to specify the target column enables seamless footer construction that matches the style of professional sites — whether simple or detailed. These components should appear before the license and "powered by" section.
- [x] 🟡🌟✅ **Docs/Limitations** - The introduction page needs to be informative and clearly written. Include a notice that Zero Dark was purposefully designed not to support collections siblings — this is intentional, not an oversight.
- [x] 🟡🌟✅ **Collections/Grid** - Collection grid layout.
- [x] 🟡🌟✅ **Collections/List** - Collection list layout.
- [x] 🟡🌟✅ **Collections/Documents** - Collection documents layout.
- [x] 🟡🌟✅ **Collections/Posts** - Collection posts layout.
- [x] 🟡🌟✅ **Collections/Blog** - Collection blog layout.
- [x] 🟡🌟✅ **Collections/API** - Collection API layout.
- [x] 🟡🌟✅ **Collections/Data** - Collection data layout.
- [x] 🟡🌟✅ **Collections/Commands** - Collection commands layout.
- [x] 🟡🌟✅ **Collections/CLI** - CLI, modules, and tools collections layout.
  > ***NOTE!*** - **Solution:** Developed 9 dedicated layouts in _layouts/ (collection-grid, collection-list, collection-documents, collection-posts, collection-blog, collection-api, collection-data, collection-commands, collection-cli) supporting custom tags filtering and weight/order/date/title sorting, standardizing layout parameters for technical specs sheets, API docs, CLI tool suites, and blog collections.
- [x] 🟡🌟✅ **UI/Layouts** - Some additional layouts like blog, articles, and blank page templates.
  > ***NOTE!*** - **Solution:** Implemented unified `blog.html` (supporting card grid, list, limits, and category/tag filters), premium technical `article.html` (with reading time, author bio lookup, banner gradients, and pagination), and a clean `blank.html` layout (completely stripping navigation/toc elements for full-screen dashboards/canvases). Documented in `docs/layouts.md`.
- [x] 🟡🌟✅ **Features/Fetcher** - Fetch and receive data from TheTVDB, TheMovieDB, free anime metadata APIs, or Warhammer metadata providers.
  > ***NOTE!*** - **Solution:** Implemented `extra-api-fetcher.html` — a client-side JS fetch component that queries any JSON API, auto-decodes Jikan (Anime) v4 payload shapes, caches responses in `localStorage` with configurable expiry, handles rate-limit fallback from stale cache, and renders either a media card or full details panel.
- [x] 🟡🌟✅ **Features/MediaDetails** - Media details: display entry details. Make it robust so it can support music, anime, and other categories like Warhammer.
  > ***NOTE!*** - **Solution:** Implemented `extra-media-details.html` featuring a backdrop-banner header with poster art, metadata row badges, rating display, overview, abilities/wargear blocks, genre tags, and a details sidebar table. Adapts column presence based on data keys.
- [x] 🟢🌟✅ **Features/MediaShowcase** - Media card: supports custom properties.
  > ***NOTE!*** - **Solution:** Implemented `extra-media-card.html` rendering image, title, type badge, year, genres, and truncated overview. Supports `glass` glassmorphism flag, hover elevation, and lazy-loaded poster image scaling.
- [x] 🟡🌟✅ **Features/MediaCarousel** - Related carousel: perhaps reuse the existing carousel component.
  > ***NOTE!*** - **Solution:** Implemented `extra-related-carousel.html` wrapping `extra-media-card.html` instances inside a reused carousel track/viewport structure. Carousel JS is shared with the standard carousel component.
- [x] 🟡🌟✅ **Features/WikiGrid** - Components to make info sites like anime charts or Warhammer info/wiki pages.
  > ***NOTE!*** - **Solution:** Implemented `extra-wiki-grid.html` — a high-density CSS grid for unit stat profiles (M/WS/BS/S/T/W/A/Ld/Sv etc.). Accepts key-value stat pairs from YAML front matter. Also absorbed into the media details sidebar.
- [x] 🟡🌟✅ **Features/Spinner** - Spinners for dynamic components: themed to match the website, using a cool fetch animation.
  > ***NOTE!*** - **Solution:** Implemented `extra-spinner.html` — a CSS keyframe ring spinner honouring `--rd-clr-*` design tokens. Supports `small`, `medium`, `large` sizes and `accent`, `warning`, `danger`, `info`, `purple` color variants. Used automatically as the loading state inside `extra-api-fetcher.html`.
- [x] 🟡🌟✅ **Features/Search** - Extend the theme layout logic so YAML front matter metadata supports `enable_search: false` by default (opt-in search configuration), and `enable_nav: true` by default specifically for collection documents.
  > ***NOTE!*** - **Solution:** Implemented `enable_search: false` by default. Pages must explicitly opt in with `enable_search: true` in their front matter to be compiled into `search-index.json` or indexed by Pagefind (otherwise `data-pagefind-ignore` is appended to the body tag). For collections, document navigation defaults to `enable_nav: true` by default.
  * [ ] 🟢❓ ***RavenUI Starter Template (`ravenui-starter`)*** - Develop a boilerplate repository containing a clean folder structure, pre-configured `_config.yml` settings, standard `.gitignore`, and base layouts. Downstream users can clone this boilerplate to bootstrap a new site. *(Referenced by rvcli-bootstrap)*
  * [ ] 🟢❓ ***Multi-Variant Layout System*** - Implement support for distinct theme variants, such as a "Minimalist" layout optimized for basic developer blogs, and a "Standard/Complex" layout for multi-level technical documentation sites. *(Referenced by rvcli-variants)*
  * [ ] 🟢❓ ***CI/CD Variant Packaging Workflow*** - Create GitLab CI/CD pipelines to automatically assemble, zip, and release the theme's variant distribution files (e.g., `dist/theme-variant-starter.zip`) when a new version tag is pushed. *(Referenced by rvcli-variants)*
  * [ ] 🟢❓ ***Component Code Skeleton Templates*** - Author standard Liquid/HTML and Markdown document templates for all component classes. These templates will serve as the blueprints for the CLI scaffolding generator. *(Referenced by rvcli-modes artisan)*
- [x] 🟡🌟✅ **CLI/rvcli** - Implementation of a dynamic developer and user CLI/TUI companion.
  * [x] 🟢✅ ***rvcli-core*** - Cross-Platform Runtime & Packaging Decision.
  * [x] 🟢✅ ***rvcli-tui*** - Dynamic Terminal UI & Theme Styling.
  * [x] 🟢✅ ***rvcli-modes*** - Execution Modes & Commands.
  * [x] 🟢✅ ***rvcli-hotreload*** - Intelligent Livereload Wrapper.
  * [x] 🟢✅ ***rvcli-linter*** - Diagnostic & Linting Utilities.
  * [x] 🟢✅ ***rvcli-bootstrap*** - Project Bootstrap & Initialization.
  * [x] 🟢✅ ***rvcli-metadata*** - Component Dependency Tree Generator.
  * [x] 🟢✅ ***rvcli-variants*** - Multi-Variant Theme Packager.
  * [x] 🟢✅ ***rvcli-doctor*** - Environment & System Diagnostic Command (QOL).
  * [x] 🟢✅ ***rvcli-port*** - Intelligent Port Collision Resolver (QOL).
  * [x] 🟢✅ ***rvcli-upgrade*** - Upstream Theme Version Upgrader (QOL).
  * [x] 🟢✅ ***rvcli-searchindex*** - Search Index Builder Integration (QOL).
  * [x] 🟢✅ ***rvcli-mapping*** - CLI Wrapper for Jekyll & Bundler.
  * [x] 🟢✅ ***rvcli-webrick*** - WEBrick Server Integration.
  * [x] 🟢✅ ***rvcli-incremental*** - Incremental Build Support.
  * [x] 🟢✅ ***rvcli-commands*** - Jekyll Command Auditing.
  * [x] 🟢✅ ***rvcli-help*** - Help Flag Integration.
- [x] 🟡🌟✅ **Features/Plugins** - Implement custom Liquid Ruby plugins as an alternative to standard `{% include %}` tags (e.g., `{% rd component_name %}`/`{% rdi component_name %}`).
  > ***NOTE!*** - **Solution:** Implemented custom block `rd` and inline `rdi` tags to bypass standard include path verbosity. Block tag captures nested markup and passes it as `include.content`. Auto-resolves variables in context.
- [x] 🟡🌟✅ **Features/Data** - Fully support all Jekyll data file types (YAML, JSON, CSV, TSV) for components.
  > ***NOTE!*** - **Solution:** All data-driven components (e.g. `timeline.html`, `steps.html`, `datatable.html`) use the dynamic dot-notation data source resolver. Since Jekyll natively parses `.yml`, `.yaml`, `.json`, `.csv`, and `.tsv` files under `_data/` into hashes/arrays, they are fully supported out-of-the-box. Covered in detail in data configuration documentation.
- [x] 🟡🌟✅ **Features/Converter** - Implement a converter layout or feature that allows saving pages as Markdown (`.md`), HTML, or other supported formats.
  > ***NOTE!*** - **Solution:** Created the page converter component (`_includes/comps/converter.html`) and associated stylesheet (`_sass/ravenui-sp/_converter.scss`). The component provides dropdown options to Download Markdown (reconstructing raw repository urls from `page.path` and repository credentials), Download HTML (extracting target elements' innerHTML wrapped in clean page styling), and Print / Export PDF. Documented usage in `docs/components/converter.md`.
- [x] 🟡🌟✅ **Features/PlatformSupport** - Create a platform support indicator component (e.g., `platform-support.html`) that reads metadata from the front matter and outputs elegant icons (GitHub, GitLab, Netlify, Cloudflare Pages, etc.) showing where the component is supported.
  > ***NOTE!*** - **Solution:** Implemented platform-support.html include mapping hosting platforms (GitHub, GitLab, Netlify, Cloudflare, Vercel) to check/x/warn indicators utilizing Simple Icons, with documentation in docs/components/platform-support.md.
- [x] 🟡🌟✅ **Features/BrowserSupport** - Create a browser support indicator component (e.g., `browser-support.html`) that shows compatibility for features across different engines (Chrome, Edge, Firefox, Safari) using inline icons and checks, referencing MDN guidelines.
  > ***NOTE!*** - **Solution:** Implemented browser-support.html include displaying modern browser engine compatibility (Chrome, Edge, Firefox, Safari) with support for minimum versions and status badges, with documentation in docs/components/browser-support.md.
- [x] 🟡🌟✅ **Features/LayoutVisualizer** - Implement a layout visualizer component to help developers visualize different site layouts, useful for demonstrating alternative RavenUI layout structures.
  > ***NOTE!*** - **Solution:** Created the client-side layout visualizer component (`_includes/comps/layout-visualizer.html`) and associated stylesheet (`_sass/ravenui-sp/_layout-visualizer.scss`). The component provides interactive layout switching (Default Sidebar, Top Header, Blank Canvas) inside a mockup browser grid, with dynamic url-address and descriptive panel updates. Documented usage in `docs/components/layout-visualizer.md`.
- [x] 🟡🌟✅ **Features/Sitemap** - Create a sitemap component to dynamically visualize the site page hierarchy and structure.
  > ***NOTE!*** - **Solution:** Created the sitemap.html include component that dynamically renders a structured layout of pages, documentation components, blog posts, and collections. Added matching SASS rules in _sitemap.scss and full reference page in docs/components/sitemap.md.
- [x] 🟡🌟✅ **Features/TagFiltering** - Introduce tags that trigger searches or filter content by tag on click, allowing users to select additional tags from a list to refine results.
  > ***NOTE!*** - **Solution:** Created the client-side tag-filter component (`_includes/comps/tag-filter.html`) and associated stylesheet (`_sass/ravenui-sp/_tag-filter.scss`). The component supports auto-extracting tags from target elements' `data-tags` attribute and synchronizes selections with URL search parameters (`?tags=...`). Toggling tags refines the results using AND logic. Updated blog and collection list/grid layouts to support tag filtering out-of-the-box, and documented usage in `docs/components/tag-filter.md`.
- [x] 🟡🌟✅ **Features/ComponentPlayground** - Implement a component playground that provides interactive live previews with configurable properties for maximum component documentation.
  > ***NOTE!*** - **Solution:** Created the client-side component playground (`_includes/comps/playground.html`) and associated stylesheet (`_sass/ravenui-sp/_playground.scss`). The component supports dynamic playground instances for Button, Callout, Alert, and Tag, dynamically updating element attributes and re-rendering Lucide icons, while outputting real-time generated Liquid code blocks with copy-to-clipboard functionality. Documented usage in `docs/components/playground.md`.
- [x] 🟡🩹✅ **Enhancements/Environment** - Properly ship environment flags (e.g., dev mode and production mode) read directly from `_config.yml` or `theme_settings` configuration.
  > ***NOTE!*** - **Solution:** Implemented site.theme_settings.environment flag mapping alongside jekyll.environment inside head.html to gate tracker scripts and show draft warnings on local pages.
- [x] 🟡🩹✅ **Enhancements/Generators** - Explore if custom Jekyll Generators can be utilized to extend or automate theme features.
  > ***NOTE!*** - **Solution:** Implemented the `RuntimeMetadataGenerator` in `_plugins/runtime_metadata.rb` which automatically injects platform, compiler, and gem version details into `site.config` during build.
- [x] 🟡🩹✅ **Enhancements/Minification** - Allow minification of JS, CSS, and HTML for maximum performance, checking for compatibility issues with Liquid.
  > ***NOTE!*** - **Solution:** Rewrote `tools/minify.ps1` into a production-grade PowerShell minifier using `.NET` classes and `[System.Text.StringBuilder]` throughout. Key improvements: fixed the critical `-bor` `RegexOptions` bug (was `-or`), added JS template-literal and string-literal protection to prevent regex from mangling JS code, added `<style>` and `<textarea>` block preservation for HTML, added per-file size reporting with percentage reduction, `--dry-run` mode, `--quiet` flag, selective `--no-html/--no-css/--no-js` type switches, `--skip <glob>` exclusion pattern, and a comprehensive summary block. Preserved `/*!` licence-banner comments in CSS/JS. Wired the minifier as a first-class `rvcli minify` command via a new `Invoke-RvMinify.ps1` cmdlet in `tools/rvcli/Public/`, registered in the `Start-RvCli.ps1` router and `Show-RvCommandHelp.ps1`. The CI `cloudflare_pages` job already invokes `tools/minify.ps1` directly and remains unchanged.
- [x] 🟡🌟✅ **DX/Distribution** - Document and support the three primary installation and distribution models: Gem-Based Theme, Remote Theme (public GitHub repository with version locking), and Forking/Copying.
  > ***NOTE!*** - **Solution:** Refactored `docs/installation.md` to introduce and explain the three models: Gem-Based, Remote Theme (utilizing `jekyll-remote-theme` with version tagging), and Forking/Copying (using local overriding layout rules).
- [x] 🟡🌟✅ **DX/Ruby3.4** - Fixed Gemfile to include `csv`, `base64`, and `bigdecimal` gems which were removed from the Ruby 3.4 standard library.
- [x] 🟡🌟✅ **Docs/Discovery** - Consolidated all component documentation under the "Components" section in the sidebar. Added `Component Index` for better overview.
- [x] 🟡🌟✅ **UI/Layouts** - Implemented "Portfolio", "Metrics/Stats", and "Hero Showcase" templates.
- [x] 🟡🌟✅ **Docs/Refinement** - Refine documentation sections to make them clear, robust, and technical.
- [x] 🟡🌟✅ **Docs/Tone** - Remove any loose tone, focusing on professional and robust documentation.
- [x] 🟡🌟✅ **DX/Polish** - Perform additional polish.
- [x] 🟡🌟✅ **Collections/Core** - Coexistence & Environment Engine.
  > ***NOTE!*** - **Note!** Implement the core environment feature flags. Ensure the theme boots and operates seamlessly when `collections` is disabled (falling back entirely to the manual `_data/navigation.yml` structure) or enabled. Maintain high portability without requiring code splits.
- [x] 🟡🌟✅ **Collections/Index** - Dynamic Layout Templates.
  > ***NOTE!*** - **Note!** Develop layout templates for rendering collection indices. Support multiple display variants:
    * `list`: High-density linear lists.
    * `grid`: Columnar grids of cards.
    * `cards`: Detailed summary card layouts.
    * `index` / `tree`: Nested hierarchy folder structure layout.
    * `pathways`: Chronological sequential roadmaps or tutorials.
- [x] 🟡🌟✅ **Collections/Sidebar** - Automatic Sidebar Navigation Generator.
  > ***NOTE!*** - **Note!** Auto-generate sidebar navigation structures dynamically from collection documents. Support:
    * Multi-level navigation depth hierarchy.
    * Custom collection titles and sub-item titles (replicating the UX of `navigation.yml`).
    * Large section titles and dividers to partition different collections.
    * Customizable end-of-collection horizontal lines (`hr`) configured in the index frontmatter.
- [x] 🟡🌟✅ **Collections/Docs** - Dedicated Documentation & Resource Section.
  > ***NOTE!*** - **Note!** Create a dedicated "Collections" documentation page in the docs site. Reference official Jekyll collection patterns and provide examples.
  > ***NOTE!*** - **Note!** Avoid complex explanations; instead, use callouts (normal or inline) to showcase the simplest/standard way to implement each pattern, with quick tips like "You can combine this collection with tag filtering or custom pagination."
  > ***NOTE!*** - The **collections architecture decision** is the one I'd suggest resolving early — it has a knock-on effect on the `ravenui` guide scope and whether the fork ever gets maintained in parallel. Worth a short decision note even if just to record "decided: separate theme, reason: X."
  > ***NOTE!*** - The **`theme_settings` object** is a strong QOL feature — worth sketching out the key names before implementing so the public API is clean from the start rather than retrofitted.

    *Solution to the Collections Architecture Decision: Consulted another web engineer (Claude 4.8)*

    Here's the honest case.

    ---

    **Your `_data/navigation.yaml` approach is clever, but it's fighting Jekyll rather than using it.**
    What you've built is essentially a manual collection — you're storing structured content metadata in YAML, iterating over it with Liquid, and outputting index pages. That works, and for small, stable content it's fine. But here's where it starts costing you:
    **You lose `site.posts`-style filtering for free.** Tags, categories, date sorting, pagination — all of that is built into collections. Your YAML approach means you're reimplementing that logic manually every time a user wants a filtered index. That's complexity you're pushing onto the site builder, not absorbing in the theme.
    **Content and metadata are split.** With your current approach, a user creates a page *and* has to register it in `navigation.yaml`. Two files, two places to keep in sync. They will get out of sync. Non-technical users will absolutely get out of sync.
    **You're already almost there.** You said it yourself — "not quite but almost." That gap is exactly where users hit friction. If they expect collection behavior and get 80% of it, the 20% they're missing feels like a bug, not a design decision.
    **The fork plan has a real cost.** Maintaining two themes that are structurally similar means every bug fix, every QOL improvement, every font config update gets done twice — or one fork quietly falls behind. That's a maintenance burden that compounds. Most dual-theme projects end up with one abandoned variant within a year.

    ---

    **The honest counter-argument in your favour:**
    Collections do add complexity to the theme internals. Pagination, `jekyll-paginate-v2` config, collection-scoped front-matter defaults — it's real work, and it makes `_config.yml` more involved for users who don't need it. Your YAML approach genuinely is simpler for purely static, manually curated sites.

    ---

    **My frank recommendation:**
    Add collection support to RavenUI with a feature flag — `collections: false` by default. Users who don't need it see nothing different. Users who do get first-class support without a separate fork to maintain. The `_data/navigation.yaml` system stays as the manual/curated path. They coexist.
    You avoid the fork, you avoid the maintenance split, and the theme becomes genuinely capable rather than "almost."

- [x] 🟡🌟✅ **Features/Excerpts** - Support and implement excerpts in the theme where applicable, enabled by default.
  > ***NOTE!*** - **Solution:** Updated blog and collection card/list/detailed/pathways layouts to support stripping HTML and falling back to `excerpt` when `description` is omitted.
- [x] 🟢🌟✅ **Features/RuntimeMetadata** - Expose runtime metadata (Jekyll, Ruby, Bundler, and active plugin versions) as site/page variables for debugging.
  > ***NOTE!*** - **Solution:** Developed a custom Jekyll generator plugin, built the `runtime-metadata.html` include component, registered it in sidebar, and documented usage in `docs/components/runtime-metadata.md`.
- [x] 🟡🌟✅ **Features/Drafts** - Support visual draft/unpublished indicator badges on pages and lists when running the site in development mode.
  > ***NOTE!*** - **Solution:** Added draft badge indicators in sidebar.html collection loops, default.html page headers, and post.html article headers when page.draft is true and site environment is set to development.
- [x] 🟡🌟✅ **CLI/PowerShellHelpers** - Port helper functions from `resources/helpers_functions.ps1` to extend the CLI's management capabilities.
  > ***NOTE!*** - **Solution:** Implemented three new first-class rvcli cmdlets covering the core automation helpers below. Shared `Invoke-RvGitCmd` helper moved to `Private/Helpers.ps1` to avoid duplication. All commands registered in `Start-RvCli.ps1` router and `Show-RvCommandHelp.ps1`.
  * [x] 🟡🌟✅ ***CLI/GitTagsGenerator*** - Automate the generation of `_data/git-tags.yml` or release data files using git history.
    > ***NOTE!*** - **Solution:** Implemented `Invoke-RvGitTags.ps1`. Runs `git tag --sort=-version:refname`, resolves commit hash, ISO date, and subject per tag, builds YAML via `StringBuilder`, writes to `docs/_data/git-tags.yml`. Supports `--limit N`, `--output <path>`, `--dry-run`.
  * [x] 🟡🌟✅ ***CLI/ReleasesGenerator*** - Automate changelog and release note data generation from git commit logs.
    > ***NOTE!*** - **Solution:** Implemented `Invoke-RvReleases.ps1`. Parses `git log <prevTag>..HEAD --no-merges` and groups commits by Conventional Commit type (feat, fix, refactor, perf, docs, style, test, chore, build, ci, revert). Generates YAML matching the existing `releases.yml` schema. Supports `--append`, `--tag <name>`, `--output <path>`, `--dry-run`.
  * [x] 🟡🌟✅ ***CLI/VersionAutomation*** - Automate site version management in configuration files, and build a component to render the current version.
    > ***NOTE!*** - **Solution:** Implemented `Invoke-RvVersion.ps1` with four sub-commands: `get` (reads both VERSION and _config.yml, warns if out of sync), `set <ver>` (writes to both), `bump major|minor|patch` (parses semver, increments the specified part, resets lower parts, preserves `v` prefix), `sync` (pushes VERSION → _config.yml). Uses `[regex]::Replace` with `(?m)^version:\s*.*$` for in-place config patching.

### **Bug Fixes (priority-4)**
- [x] 🟡🪲✅ **BugFix/Typewriter** - Prevent Typewriter Component heading tags from bleeding into the TOC.
  > ***NOTE!*** - **Solution:** Cloned heading nodes in the TOC generator script, replaced the typewriter container content with its `data-first-word` fallback attribute, and stripped cursors/indicators before extracting clean text.
- [x] 🟡🪲✅ **BugFix/Modal** - Resolve modal component layout bleed-through issues in Liquid.
  > ***NOTE!*** - **Solution:** Wrapped the entire component content in a block-level `<div class="rd-modal-component">` wrapper, forcing Jekyll's Kramdown parser to treat the inclusion output as raw HTML rather than inline markdown text which was wrapping the modal in `<p>` and HTML-escaping the overlay div.
- [x] 🟡🪲✅ **BugFix/Progress** - Prevent step indicator content from overflowing on mobile or smaller screens.
  > ***NOTE!*** - **Solution:** Added `min-width: 0` constraints to the flex item container (`.rd-step`) and word wrapping logic to `.rd-step-content` to prevent long text from stretching the bar.
- [x] 🟢🪲✅ **BugFix/Sidebar** - Reduce sidebar navigation item vertical padding.
- [x] 🟢🪲✅ **BugFix/Footer** - Fixed empty space after footer content causing unwanted bottom scrolling.
- [x] 🟡🪲✅ **BugFix/Releases** - Resolved access problems fetching YAML data.
- [x] 🟡🪲✅ **BugFix/Liquid** - Resolved invalid `include` tag nesting in `docs/components/api-ref.md`.
- [x] 🟡🪲✅ **BugFix/Permalink** - Resolved duplication by removing `docs/blog/index.md` in favor of `docs/blog.md`.
- [x] 🟢🪲✅ **BugFix/Footer** - Removed blank scrolling whitespace below the footer.
- [x] 🟢🪲✅ **BugFix/CI** - Fixed GitLab CI `test_build` job failure where Bundler threw `Could not locate Gemfile`. This was caused by the files being named `GemFile` and `GemFile.lock` with a capital `F`. In case-sensitive Linux CI docker environments, Bundler was unable to find them. Resolved by renaming the files to lowercase `Gemfile` and `Gemfile.lock`.


### **Documentation (priority-5)**
- [x] 🟡🌟✅ **Docs/AtomicMapping** - Every component in `_includes/comps/*.html` has a corresponding `docs/components/*.md` file.
- [x] 🟡🌟✅ **Docs/General** - Comprehensive documentation update (all features, details dropdowns for code).
- [x] 🟡🌟✅ **Docs/Layouts** - Layout documentation updated in the docs.
- [x] 🟡🌟✅ **Docs/Liquid** - Added robust text color, gradients, borders, font size, and font weight utility classes to Liquid IRL guide.
- [x] 🟡🌟✅ **Docs/Liquid** - Added examples for all utility CSS classes inside Liquid IRL guide.
- [x] 🟢🌟✅ **Features/Docstats** - Create a new automatic JSON data endpoint (`docstats.json`) showing the document count metrics of the site.
- [x] 🟡🌟✅ **Docs/Installation** - Provide a quick-start guide alongside an advanced installation path. Advanced options should cover: building from source, cloning the repo and replacing or editing docs, changing the folder structure, and using the Zero Dark docs implementation to build a site — for users who don't want the default docs website. Consider a summary page for advanced installation with a link to an in-depth page covering working directly with the repo.
- [x] 🟡🌟✅ **Docs/DeveloperGuide** - A dedicated developer guide covering the full RavenUI folder layout and extension points.
  > ***NOTE!*** - **Solution:** Created `docs/developer-guide.md` at permalink `/developer-guide/`. It documents directory structure, core layout frames/components, custom block Liquid tags (rd, rdi), custom Ruby plugins, SASS variables and theme customization, and extension points for component creation and custom `rvcli` command wiring.
- [x] 🟢🌟✅ **Docs/Rename** - Because we no longer need the second theme RavenUI-MP, we can rename to "RavenUI" in readme and docs using RavenUI Jekyll theme.
- [x] 🟡🌟✅ **Docs/ExtraComponents** - Expose these components under a new "Extra Components" category.
  > ***NOTE!*** - **Solution:** Added `Extra Components` sidebar section in `docs/_data/navigation.yml` and created `docs/components/extra-components.md` with live previews, API parameter tables, and code examples for all five new components.
- [x] 🟡🌟✅ **Docs/Liquid** - Created `docs/liquid-irl.md` demonstrating how to use theme-specific CSS utility classes.
- [x] 🟡🌟✅ **Docs/Releases** - Created `docs/releases.md` with usage examples for `releases.html` and `tags.html`.
- [x] 🟢🌟✅ **Docs/Picsum** - for showcasing images in the docs: use `https://picsum.photos/200/300` for random images.
- [x] 🟡🌟✅ **Docs/References** - Provide cross-references to self-documentation and remote documentation (e.g., Liquid template engine, Jekyll docs) using HTML anchor links to jump to specific sections.
  > ***NOTE!*** - **Solution:** Created `docs/references.md` at permalink `/references/`. It compiles external references and configuration APIs for Jekyll, Liquid, Lucide, Simple Icons, Font Awesome, Pagefind, Algolia, KaTeX, GSAP, and Anime.js.
- [x] 🟡🌟✅ **Docs/Scope** - Maintain a meticulous, detailed documentation scope, taking inspiration from the Laravel documentation style, keeping it informative, clear, and concise without being overwhelming.
  > ***NOTE!*** - **Solution:** Created `docs/scope.md` at permalink `/scope/`. It outlines the theme's design philosophy, client-side gzipped performance budgets, and intentional boundaries (such as manual navigation by default and lack of collection sibling mapping).
- [x] 🟡🌟✅ **Docs/Paths** - Provide complete documentation explaining which path types RavenUI supports, how to alter them in the config, and show example outputs. Ensure layouts and components are aware of these paths so they can dynamically adapt.
  > ***NOTE!*** - **Solution:** Created `docs/paths.md` at permalink `/paths/`. It documents absolute/relative URL resolution filters, trailing slashes, flat vs nested folder layout compatibility, and assets directory mapping.
- [x] 🟢🌟✅ **Docs/FileTypes** - Document when to use .md vs .html extensions for pages and components, explaining any parsing differences.
  > ***NOTE!*** - **Solution:** Created `docs/file-types.md` at permalink `/file-types/`. Covers the Jekyll processing pipeline, `.md` vs `.html` characteristics, RavenUI component file behavior, a decision table, the Kramdown paragraph-wrapping artifact and workaround, and collection document extension rules. Added to sidebar navigation under Configuration.
- [x] 🟡🌟✅ **Docs/Variables** - Document useful Jekyll/Liquid variables and how they interact with components, referencing parent Jekyll documentation.
  > ***NOTE!*** - **Solution:** Created `docs/variables.md` at permalink `/variables/`. It details core Jekyll global scopes (`site`, `page`, `layout`, `content`), custom `site.theme_settings` namespaces (toc, header, borders, analytics, versions), page front-matter metadata configuration overrides, and inline component data-sourcing properties.
- [x] 🟢🌟✅ **Docs/DataConfig** - Author documentation on configuring data files (YAML, JSON) for components, providing clear anchor links for customization options.
  > ***NOTE!*** - **Solution:** Created `docs/data-config.md` at permalink `/data-config/`. Covers all four supported formats (YAML, JSON, CSV, TSV), `data_source` parameter path resolution, format examples with Liquid usage, subfolder cross-reference, and inline `items` vs. `data_source` guidance. Added to sidebar navigation under Configuration.
- [x] 🟢🌟✅ **Docs/DataSubfolders** - Document how to organize and reference data files stored in subfolders under the `_data/` directory.
  > ***NOTE!*** - **Solution:** Created `docs/data-subfolders.md` at permalink `/data-subfolders/`. Covers dot-notation access, directory structure examples, two-level nesting, `data_source` dot-path in components, naming conventions (kebab → underscore), use cases, and compilation caveats. Added to sidebar navigation under Configuration.
- [x] 🟢🌟✅ **Docs/JSONData** - Document and provide examples of utilizing JSON data files (`_data/*.json`) with theme components.
  > ***NOTE!*** - **Solution:** Created `docs/data-json.md` at permalink `/data-json/`. Covers JSON array and object file formats, Liquid iteration, `data_source` component usage, nested JSON dot-notation, CI generation patterns, JSON vs. YAML comparison table, and validation guidance. Added to sidebar navigation under Configuration.


### **Refactoring (priority-6)**
- [x] 🟢🌟✅ **Refactoring/Navigation** - Consolidated component links and verified all URLs. Structure is now lean and logical.
- [x] 🟢🌟✅ **Refactoring/Folders** - Renamed `_includes/components` to `_includes/comps` and updated all 100+ references codebase-wide.
- [x] 🟢🌟✅ **Refactoring/Cleanup** - Removed redundant `docs/components/visual-elements.md`.
  > ***NOTE!*** - **Solution:** File did not exist in the repository at audit time. Task marked complete as the cleanup was already done in a prior session.
- [x] 🟢🌟✅ **Refactoring/WordPremium** - Replaced 'premium' with 'elegant', 'professional', or 'useful' across all SASS comments, layout files, and documentation pages.
- [x] 🟢🩹✅ **Refactoring/Branding** - Change theme name to RavenUI (default dark theme: RavenUI, default light theme: DarkZero) - update Repo title to `ravenui-jekyll-theme` and gem name to `jekyll-theme-ravenui`.
  > ***NOTE!*** - **Solution:** Renamed all project identities and gems to `jekyll-theme-ravenui`.
- [x] 🟡🩹✅ **Refactoring/Vars** - Evaluate changing CSS variables prefix from `zd-` to `ru-` (e.g., `ru-accent` vs `rd-accent`).
  > ***NOTE!*** - **Solution:** Renamed all variables and CSS classes to use the `rd-` prefix.
- [x] 🟢🌟✅ **Refactoring/Repo** - `ravenui-jekyll-theme`
- [x] 🟢🌟✅ **Refactoring/Repo** - `jekyll-theme-ravenui`
  > ***NOTE!*** - **Solution:** Renamed gemspec to `jekyll-theme-ravenui.gemspec` and updated dependencies in `docs/Gemfile` and `.gitlab-ci.yml`.
- [x] 🟢🌟✅ **Refactoring/Repo** - `staticcanvas`
  > ***NOTE!*** - **Solution:** Checked and verified owner settings under `_config.yml` and gemspec author definitions.
- [x] 🟢🌟✅ **Refactoring/Repo** - `https://gitlab.com/staticcanvas/ravenui-jekyll-theme`
  > ***NOTE!*** - **Solution:** Updated repository link pointers inside `_config.yml`, `docs/_config.yml`, and `_includes/core/footer.html`.
- [x] 🟡🌟✅ **Refactoring/Repo** - `A professional, high-contrast Jekyll theme for technical documentation.`
  > ***NOTE!*** - **Solution:** Updated gemspec summary/description and README.md header to introduce RavenUI as both a production-ready theme framework and component library.
- [x] 🟢🌟✅ **Refactoring/Repo** - `MIT`
- [x] 🟡🌟 **Refactoring/Components** - Migrate static layout structures (header, toc, sidebar, footer) to modular components so they can be dynamically rendered within a blank layout. Ensure that child elements automatically scale/adjust based on parent containers to ensure a none-opinionated, highly responsive component system (a "theme that builds itself").
  > ***NOTE!*** - **Solution:** Migrated the static layout frames by creating modular component includes `comps/header.html`, `comps/sidebar.html`, `comps/footer.html`, and `comps/toc.html` with inline JS scroll-spy generation. Added `.rd-header--inline`, `.rd-sidebar--inline`, `.rd-page-toc-container--inline`, and `.rd-footer--inline` SASS styles for seamless canvas grid embedding. Updated `_layouts/default.html` to reference the modular components and documented them in `docs/components/` and the navigation menu.

### **Refine Features (priority-7)**
- [x] 🟢✅ **Refine/Badges** - To help with discoverability, allow the navigation items to have `is_new_feature` in navigation data files to display a glowing badge or status label.
  > ***NOTE!*** - **Solution:** Implemented CSS-based glowing badges (`.rd-nav-badge`) supporting `new`, `updated`, `beta`, and `hot` classifications. Integrated Liquid rendering logic in `sidebar.html` and `header.html`, and added documentation to `docs/navigation.md`.
- [x] 🟢🌟✅ **Refine/Badges** - Implemented shield component and documented it.
- [x] 🟡🌟✅ **Refine/Badges** - Supported via the new customizable tag and shield components.
- [x] 🟡🌟✅ **Refine/Transitions** - Animate social media icons so they morph smoothly from text labels to simple icon logos.
- [x] 🟡🌟✅ **Refine/Collections** - Decided to support collections via a feature flag (`collections: false` by default) to avoid maintaining a separate fork while keeping core theme navigation simple.
  > ***NOTE!*** - **Solution:** Decision recorded in lessons-learned context files.
- [x] 🟡🌟✅ **Refine/Collections** - Add collection support to RavenUI with a feature flag — `collections: false` by default. Users who don't need it see nothing different. Users who do get first-class support without a separate fork to maintain. The `_data/navigation.yml` system stays as the manual/curated path. They coexist.
  > ***NOTE!*** - **Solution:** Implemented core environment flag checks.
    - Full Collections Support:
    - Collection indexes
- [x] 🟡🌟✅ **Refine/Collections** - Expand collections integration with sorting, ordering, and tagging capabilities.
  > ***NOTE!*** - **Solution:** Verified Liquid layouts implementation of custom sorting (`sort_by` supporting date, title, weight/order), tag filtering (`filter_tag`), and manual ordering (`order` and `weight`), and documented these features in `docs/collections.md`.
  * [x] 🟡🌟✅ ***Collections/Tags*** - Support and utilize tags in collection document front-matter for categorizing collection files.
  * [x] 🟡🌟✅ ***Collections/Sorting*** - Support custom sorting parameters (date, weight, or title) for collection documents.
  * [x] 🟡🌟✅ ***Collections/ManualOrdering*** - Support manual ordering of documents in collections using an `order` or `weight` front-matter property.
- [x] 🟡🌟✅ **Refine/Collections** - Build a robust, high-performance, and fully configurable Jekyll collections integration system that coexists seamlessly with the existing static/manual `navigation.yml` configuration (toggled via a feature flag: `collections: false` by default).
  > ***NOTE!*** - **Solution:** Implemented core environment flag checks, auto-sidebar navigation generation, generic collections index layouts, and detailed documentation.
  > ***NOTE!*** - **Note!** This task implements 100% standard Jekyll collection support. It allows users to define custom content groups and automatically render filtered views, index layouts, and structured sidebar hierarchies without duplicating metadata.
  > ***NOTE!*** - **Note!** Split the Collections Integration task into multiple sub-tasks below for a modular, phased implementation and better engineering understanding.
- [x] 🟡🌟✅ **Refine/Transitions** - Basic view transition support implemented for seamless page navigation.
- [x] 🟡🌟✅ **Refine/Transitions** - Enhanced the search modal with an elegant, spring-based animation (`translateY` + `scale`). Standardized transition variables in `_root.scss`.
- [x] 🟡🌟✅ **Audit/Components** - Perform a complete component audit, listing all components and tracking their status (completed, issues, needs refinement).
  > ***NOTE!*** - **Solution:** Completed a full mapping and status audit of all 78 includes in `_includes/comps/` to their corresponding 69 documentation files in `docs/components/`. Verified that all component templates have been fully rebranded, documented, and checked. The full report has been compiled in [component_audit_report.md](file:///home/gsnow/.gemini/antigravity-cli/brain/e2715d69-5954-4674-9c95-f8d40909297f/component_audit_report.md).
- [x] 🟡🌟✅ **Audit/ComponentSystem** - Detailed component system audit. Review all 85 files in `_includes/comps/`, detailing their functionality and potential issues.
  > ***NOTE!*** - **Solution:** Performed a complete code audit of all 85 dynamic components, detailing their use cases, parameters, fallbacks, and potential problems. All includes align 1:1 or are verified via mapping exceptions in the linter, compiling cleanly in Jekyll.
  * [x] 🟢🩹 **animate.html** - Utility component that adds CSS classes for GSAP, Anime.js, AOS, or Animate.css animations.
    > ***NOTE!*** - Depends on external CDN libraries being enabled in `_config.yml`. If they are disabled, the animation classes will have no effect.
  * [x] 🟢🩹 **announcement.html** - Renders a top-of-viewport alert/announcement banner.
    > ***NOTE!*** - Can shift the layout flow unless body padding offsets are dynamically handled.
  * [x] 🟢🩹 **api-reference.html** - Traditional API parameters and details documentation component.
    > ***NOTE!*** - May result in horizontal overflow on small mobile viewports if API parameter tables are excessively wide.
  * [x] 🟢🩹 **breadcrumbs.html** - Generates a hierarchical navigation path.
    > ***NOTE!*** - Depends on logical slash-separated path structures; won't generate deep levels for files located in the root.
  * [x] 🟢🩹 **browser-support.html** - Displays compatibility matrix for modern browser engines.
    > ***NOTE!*** - Completely static; requires manual updates if target browser compatibility details shift.
  * [x] 🟢🩹 **button.html** - Highly configurable button component supporting multiple styles, sizes, and icons.
  * [x] 🟢🩹 **callout.html** - Renders standard colored note/warning callout boxes.
    > ***NOTE!*** - Liquid template parses markdown content inside, which can sometimes result in unwanted double paragraph tags (`<p>`) if whitespace is not trimmed.
  * [x] 🟢🩹 **card-index.html** - Renders a grid of visual navigation cards from navigation data files.
  * [x] 🟢🩹 **card.html** - Content panel box supporting borders, hover scales, and glassmorphism.
  * [x] 🟢🩹 **carousel.html** - Image and text slide-show carousel wrapper.
    > ***NOTE!*** - Slides containing images of different aspect ratios will cause jarring container height changes unless constrained.
  * [x] 🟢🩹 **chartjs.html** - Canvas-based interactive charts rendering using Chart.js.
    > ***NOTE!*** - Requires loading the external Chart.js library from CDN or local; fails if offline or scripts are blocked.
  * [x] 🟢🩹 **codepen.html** - Embeds CodePen examples.
    > ***NOTE!*** - Includes a client-side CORS verification; if the CodePen oEmbed API rate-limits the user, the fallback 404 card will render.
  * [x] 🟢🩹 **codesandbox.html** - Embeds CodeSandbox instances.
  * [x] 🟢🩹 **color-block.html** - Renders a tiny inline color block indicator for styling reference.
  * [x] 🟢🩹 **command-ref.html** - Formats parameters reference for CLI tools.
  * [x] 🟢🩹 **comments.html** - Integrates Giscus or Disqus comment threads.
    > ***NOTE!*** - Requires exact API configuration credentials in `_config.yml`; will fail silently or display errors if missing.
  * [x] 🟢🩹 **copy-button.html** - Standalone click-to-copy clipboard button.
  * [x] 🟢🩹 **customer-callout.html** - Formats customer quotes and testimonials.
  * [x] 🟢🩹 **datatable.html** - Injects and parses YAML, JSON, or CSV data into sortable HTML tables.
    > ***NOTE!*** - Rendering huge tables can cause long Liquid compile times and browser paint lag.
  * [x] 🟢🩹 **dependencies.html** - Lists dependencies for component modules.
  * [x] 🟢🩹 **details.html** - Accessible `<details>` details/summary folding block.
  * [x] 🟢🩹 **example-block.html** - DX template for capturing markdown.
  * [x] 🟢🩹 **example-code.html** - Side-by-side split render for demo layouts.
  * [x] 🟢🩹 **extra-api-fetcher.html** - Fetches dynamic JSON API data with localStorage caching.
    > ***NOTE!*** - Relies on client-side JS; rate limits or CORS headers on target API endpoints will prevent data from loading.
  * [x] 🟢🩹 **extra-media-card.html** - Interactive media card display for fetched datasets.
  * [x] 🟢🩹 **extra-media-details.html** - Renders profiles for Warhammer units or media files.
  * [x] 🟢🩹 **extra-related-carousel.html** - Carousel tracks specifically styled for fetched media cards.
  * [x] 🟢🩹 **extra-spinner.html** - Keyframe-based CSS loading spinner.
  * [x] 🟢🩹 **extra-wiki-grid.html** - Flexible unit stat block grids.
  * [x] 🟢🩹 **faq-item.html** - Individual question/answer collapsible folding block.
  * [x] 🟢🩹 **faq.html** - Grid wrapper container for grouping FAQ items.
  * [x] 🟢🩹 **feature-card.html** - Displays feature info with visual overlays.
  * [x] 🟢🩹 **feature-grid.html** - Multi-column grid showcasing features.
  * [x] 🟢🩹 **feedback.html** - Page helpfulness widget triggering analytics.
    > ***NOTE!*** - Analytics calls are subject to ad-blocker filtering; if tracking scripts fail to load, events won't fire.
  * [x] 🟢🩹 **figure.html** - HTML5 semantic figure container with alignments.
  * [x] 🟢🩹 **font-awesome.html** - Font Awesome vector icons helper.
    > ***NOTE!*** - Relies on a public CDN stylesheet; if offline, custom brand icons won't display.
  * [x] 🟢🩹 **footer-2col.html** - Two-column footer layout.
  * [x] 🟢🩹 **footer-3col.html** - Three-column footer layout.
  * [x] 🟢🩹 **footer-item.html** - Modular footer item builder.
  * [x] 🟢🩹 **git-tags.html** - Renders repository tags from YAML data.
    > ***NOTE!*** - Relies on static data compiled in `_data/git-tags.yml`; does not update dynamically without CLI/CI runs.
  * [x] 🟢🩹 **gradient-text.html** - Renders text with customized linear/radial gradient styling.
  * [x] 🟢🩹 **grid-palette.html** - Showcase grid for theme color palette swatches.
  * [x] 🟢🩹 **grid.html** - Multi-column layout grid composition include.
  * [x] 🟢🩹 **heading.html** - Styled page header with Lucide icon support.
  * [x] 🟢🩹 **hero-card.html** - Renders a large highlighted banner card.
  * [x] 🟢🩹 **hr.html** - Styled horizontal line divider with optional text or icon.
  * [x] 🟢🩹 **icon-grid.html** - Renders a copyable grid of available Lucide icons.
  * [x] 🟢🩹 **icon.html** - Renders Lucide SVG icons.
    > ***NOTE!*** - High icon density on a single page can inflate DOM node counts and impact render speeds.
  * [x] 🟢🩹 **iframe.html** - Lazy-loaded iframe wrapper.
  * [x] 🟢🩹 **image.html** - Responsive image placeholder container with lazy loading and blur-up effects.
  * [x] 🟢🩹 **inline-callout.html** - Tiny inline text note bubbles.
  * [x] 🟢🩹 **kbd-group.html** - Groups shortcut key caps side by side.
  * [x] 🟢🩹 **kbd.html** - Keyboard key cap visual styling.
  * [x] 🟢🩹 **last-edited.html** - Renders last modified date and author details.
    > ***NOTE!*** - Requires manual front-matter or custom generator plugins to populate edit history.
  * [x] 🟢🩹 **likes.html** - Standard client-side heart like button.
    > ***NOTE!*** - Saves state locally in localStorage; does not sync count value to any central database.
  * [x] 🟢🩹 **metrics.html** - General-purpose stats and metrics details container.
  * [x] 🟢🩹 **modal.html** - Accessible dialog modal container.
  * [x] 🟢🩹 **package-tabs.html** - Installation package manager commands toggle (npm/yarn/pnpm/bun).
  * [x] 🟢🩹 **page-nav.html** - Back/Next page navigation arrows.
  * [x] 🟢🩹 **platform-support.html** - Displays deployment hosting targets compatibility indicators.
  * [x] 🟢🩹 **previously-read.html** - Client-side history widget showing visited pages.
    > ***NOTE!*** - Relies on localStorage; history won't persist across different browsers or in private browsing sessions.
  * [x] 🟢🩹 **progress.html** - Scroll reading progress indicator bar.
  * [x] 🟢🩹 **releases.html** - Changelog release timeline generator.
    > ***NOTE!*** - Requires static YAML release data in `_data/releases.yml` which must be updated manually.
  * [x] 🟢🩹 **rendered-el-showcase.html** - Wraps components in a window with tilt details.
  * [x] 🟢🩹 **roadmap-item.html** - Single milestone block with optional progress bar.
  * [x] 🟢🩹 **roadmap.html** - Outer container for mapping roadmap tracks.
  * [x] 🟢🩹 **shield.html** - Generates stylized shields/badges (e.g. key-value badges).
  * [x] 🟢🩹 **simple-icon.html** - Loads vector icons from Simple Icons.
    > ***NOTE!*** - Relies on static SVG paths; missing brands won't display.
  * [x] 🟢🩹 **site-stats.html** - Displays overall counts (posts, tags, categories, words, read time).
    > ***NOTE!*** - Heavy Liquid calculations can slow down site compilation times on repositories with thousands of posts.
  * [x] 🟢🩹 **sitemap.html** - Renders dynamic folder-structure sitemap.
    > ***NOTE!*** - Scanning all files recursively in Liquid is resource-intensive for large websites.
  * [x] 🟢🩹 **sponsored-by.html** - Logo showcase for sponsor grids.
  * [x] 🟢🩹 **steps.html** - Multi-step sequential tutorial progress tracker.
  * [x] 🟢🩹 **svgcharts.html** - Pure SVG charts (line, bar, pie, doughnut, radar) built entirely in Liquid.
    > ***NOTE!*** - Math calculations in Liquid are slow and limited; complex charts with thousands of points can exhaust memory limits.
  * [x] 🟢🩹 **tag-cloud.html** - Displays tag cloud weighted by count.
  * [x] 🟢🩹 **tag.html** - Renders single stylized category/tag label.
  * [x] 🟢🩹 **terminal.html** - Interactive mockup window mimicking CLI terminal shell.
  * [x] 🟢🩹 **theme-toggle.html** - Theme selection buttons/dropdown selector.
  * [x] 🟢🩹 **timeline.html** - Vertical chronological list tracker.
  * [x] 🟢🩹 **tooltip.html** - Pure-CSS hover/focus info bubbles.
    > ***NOTE!*** - Static positioning makes it prone to clipping at viewport edges.
  * [x] 🟢🩹 **tree.html** - Folder layout tree display helper.
  * [x] 🟢🩹 **typewriter.html** - Animated typewriter headings.
    > ***NOTE!*** - Raw typewriter tags can pollute TOC heading titles unless cleaned up by JS parser.
  * [x] 🟢🩹 **version-switcher.html** - Multi-version documentation select switcher.
    > ***NOTE!*** - Relies on static version array configurations; will not dynamically forward to the corresponding page relative path.
  * [x] 🟢🩹 **vhs.html** - Retro screen scanlines visual effects overlay.
  * [x] 🟢🩹 **written-by.html** - Author card displaying name, avatar, bio, and social handles.
    > ***NOTE!*** - Relies on author profiles registered in site data file; defaults to generic fallback if missing.
  * [x] 🟢🩹 **youtube.html** - YouTube video player wrapper.


### **Refine Documentation (priority-8)**
- [x] 🟡🌟✅ **Audit/Visual** - Completed full pass on all 22 component pages; verified consistency in API tables and examples.
- [x] 🟢🌟✅ **Audit/Accessibility** - Walk through each documentation page and compile a detailed log of visual inconsistencies, bugs, potential fixes, and design improvements.
  > ***NOTE!*** - **Solution:** Standardized all documentation headings to use `comps/heading.html` includes, and recursively refactored all instances of `ZeroDark SP` and `ZeroDark` to the correct brand name `RavenUI` across 70+ files.
- [x] 🟡🌟✅ **Audit/Component** - Check comps/* components that do not have corresponding docs/* documentation pages.
- [x] 🟡🌟✅ **Audit/Code** - Check CSS, JS, and Liquid for any unused code. For components, add a multi-line Liquid comment to the top of the file explaining the component's purpose, caveats, and usage, and update the docs to reflect this.


