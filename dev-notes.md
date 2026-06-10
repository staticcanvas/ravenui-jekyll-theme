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

- [x] **Fluent UI Refinement:** Applied extensive visual polish to splash components (cards, buttons, terminals) including subtle elevations, refined borders (`color-mix`), and scale-based interactive states.
- [x] Implement custom scrollbars for main content and sidebars.
- [x] Refine Checkbox accessibility (focus rings, disabled states).
- [x] Standardize focus-visible rings across all interactive elements.
- [x] Add smooth transition to sidebar backdrop-filter on toggle.
- [x] Hero h-tags padding reduction.
- [x] Comprehensive documentation update (all features, details dropdowns for code).
- [x] Implement `grid-palette` component for showcasing color palettes.
- [x] Reduce sidebar navigation item vertical padding.
- [x] Configurable sidebar navigation padding via `_config.yml` (compact, tight, comfy, spacy).
- [x] **Standardized Design System:** Added Fluent UI-specific variables to `_sass/zero-dark-sp/_root.scss` (Elevations, Radius, Transitions).
- [x] **headings and hero** - Added configurable `zd_nav_spacing` (compact, tight, comfy, spacy) support to headings (h2, h3) and hero sections via `head.html` and SCSS variables.
- [x] **code blocks** - Fixed copy button and language labels overlap by moving the language label to the left and copy button to the far right.
- [x] **code blocks** - Ensured code blocks are centered on mobile by setting `margin-inline: 0` and `width: 100%` in mobile media queries.
- [x] **tags pastel color pallete** - Introduced a subtle pastel color palette for tags (`.zd-tag--blue`, `--purple`, etc.) with matching borders for improved readability.
- [x] **card-index** component sytling is broken, logic works but display is jumbled, fix this.
- [x] **codeblocks** language label compact is spans overlapping with copy button, also need slight margin/padding above the highlight div code is abit to close to the top.
- [x] **grid-palette.html** - not output color from yaml captured in the include, need to fix this.
- [x] **grid-palette.html** - must be ajustable to allow thins like grid pallet of colors with a size of 12px, and also allow the user to set the size of the grid, also grid pallete of apps, devices, etc. 
- [x] **grid-palette.html** - use this to show case theme color pallet, perhaps create a new menu item for this.
- [x] **deployment** - move menu object location in sidebar, needs to have its only title and currently we have documentation and Component Lirary, add Deployment to the menu and move the current deployment items to the new menu.
- [x] **color-block.html** - to work inline with tables and other elements this component needs to be a single line of code, allowing it to be rendered in tables etc without breaking the layout.
- [x] git tags, and tags are combine, perhaps combin releases, gtags, and tags should be seperated.
- [x] layouts needs update in the docs
- [x] for the sidebar we need another section type, which can use as sperator, also another section type for a for a larger title that flows with theme.
- [x] Extended Color Pallete, for use with Liquid IRL and other components
    - Add Colors 
    - Viridian #00ff9d
    - Note #9B7AE0
    - Warning #E8994A
    - Danger #E05A5A 
    - Black#0A0C0E
    - Void #10141A
    - Ink #161B24
    - Slate #1E2530
    - Steel #2A3340
    - Mist #3D4D5E
    - Smoke #5A6E82
    - Ash #8A9BAC
    - Silver #B8C5D0
    - Ghost #D6DFE7
    - White #EDF1F5
    --zd-border-subtle:      #1A212B;
    --zd-border-default:     #25303D;
    --zd-border-strong:      #344252;
    --zd-border-accent:      #00FF9D;
    --zd-bg-panel:           #161B24;
    --zd-bg-card:            #1B212B;
    --zd-bg-hover:           #242C38;
    --zd-bg-active:          #2C3645;
    --zd-clr-terminal-green: #00FF9D;
    --zd-clr-terminal-blue:  #4DA3FF;
    --zd-clr-terminal-purple:#B06CF7;
    --zd-clr-terminal-orange:#FF9E57;
    --zd-clr-terminal-red:   #FF6B6B;
- [x] headings:
    - `h1` Fraunces font faminly Fraunces 400 
    - `h2` Fraunces font faminly Fraunces 500
    - `h3`  IBM Plex Sans 500 500 
- [x] add new param to component callout: `inline` to allow inline callouts (default is block)
- [x] Liquid IRL needs addition utitlity classes, add additional text color, gradients, and borders, add font size and weight, robost, 
- [x] empty space after footer content, causing content to scroll to blank space
- [x] tags and release check if there correctly accessing the _data/tags.yml and releases.yml via site.data.tags and site.data.releases, not content is shown perhaps we are accessing data inconnection.
- [x] `utitliy css classes` - we need to updat the liquery IRL with examples to cover all utility classes
- [x] **deployment** - we need a new section in sibar menu called deployement
  - [x] deploy to gitlab
    - [x] includes forwarding options for cloudflare using gitlab domain
  - [x] deploy to github
      - [x] includes forwarding options for cloudflare using github domain
  - [x] deploy to cloudflare static pages
  - [x] deploy to netlify
  - [x] deploy to vercel
  - [x] deploy to surge
  - [x] deploy to aws
  - [x] deploy to azure
  - [x] deploy to firebase
- [x] **New Component** - button - examples and documentation showcause button examples: 'GETTING STARTED', 'VIEW SOURCE', CHANGELOG, DEPRECATED, DOWNLOAD, EDIT THIS PAGE, SEARCH DOCS.
    - [x] buttons should have the ability to have color, text, text-size, icon, and icon-color
    - [x] buttons should have the ability to have a border, border-color, border-size, and border-radius
- [x] lets also add in powered by zerodark sp and the link to the github repo allow the user the hide this from _config.yaml
- [x] releases menu item is missing icon, perhaps choose one from the icons
- [x] update color-grid.html to use the new extended color pallete, make sure the color grid size can be ajusted.
- [x] lets add a gradient text component
- [x] mermaidjs - not sure if we need a component, and update docs to relect feature
- [x] mathamatical expressions support? and update docs to relect feature
- [x] inline-callout compoenent and update docs to relect feature
- [x] version tag version-beta.rc1 lets make it a cool versatile tag update docs to relect feature
- [ ] progress bar compoenent update docs to relect feature
- [ ] written by component
- [ ] svgcharts compornent - support for line, bar, pie, doughnut, radar, polar area, bubble also support sourcing from site.data.placeholderName and scatter charts, update docs to relect feature
- [ ] chartjs component - support for line, bar, pie, doughnut, radar, polar area, bubble also support sourcing from site.data.placeholderName and scatter charts, update docs to relect feature
- [ ] other well known charting libraries, maybe we can make a generic chart component that can be used for any charting library, update docs to relect feature - may need to look into futher combine might make more sense to have specific components for each library, we can always add more later.
- [ ] codepen component - allows users to embed codepens with ease, update docs to relect feature
- [ ] code sandbox component - allows users to embed code sandboxes with ease, update docs to relect feature
- [ ] youtube component - allows users to embed youtube videos with ease, update docs to relect feature
- [ ] sponsered-bt combonent - allows users to add a sponsered by section with logo and link to sponser, update docs to relect feature
- [ ] customer callout compient - users that have used the product and liked it
- [ ] new compoenet last edited, add below should have the lasted edited date, author, this can be enabled in \_condig, default show edited date and time.
- [ ] image component - supports lazy loading, blur up, and different sizes for responsive design, update docs to relect feature
- [ ] iframe component - supports lazy loading, blur up, and different sizes for responsive design, update docs to relect feature
- [ ] rendered-el-showcase.html - wraps the element in another emelemtn with an svg tilted vertical lines with title and logo example rendered code, we allow users to specify title name, size and icon.
- [ ] htags "link" ancher invisible default, user can enabled always viable in \_condig, update docs to relect feature
- [ ] previously read, a localstorage backed site page tracker that can be used to show users which pages they have already read, update docs to relect feature
- [ ] enable Google analytics and update docs to relect feature
- [ ] enabled posting to google analytics when user clicks on a link, update docs to relect feature
- [ ] shields.io component - allows users to easily add shields.io badges to their site, update docs to relect feature
- [ ] badges component - allows users to easily add badges to their site, update docs to relect feature
vimage carousel compoenent - supports lazy loading, blur up, and different sizes for responsive design, update docs to relect feature
- [ ] typewriter component - must be enabled in \_config help with unnecessary bloat. update docs to relect feature
- [ ] FAQ component and FAQ item component. update docs to relect feature
- [ ] make sure all markdown elements are themed correctly to much theme. update docs to relect feature
- [ ] change api-ref to command ref create a new component called api-referece this can be used for traditional api documentation akin to web not cli
- [ ] 3xample pages foe all the different layouts this done need to be in the menu just page and a button goin back to previous page.
- [ ] new hr component - supports gradients, logo at start middle end or text all Inline. update docs to relect feature


## Bug Fixes
- [x] **Ruby 3.4 Compatibility:** Fixed GemFile to include `csv`, `base64`, and `bigdecimal` gems which were removed from the Ruby 3.4 standard library.
- [x] **Liquid Syntax Fix:** Resolved invalid `include` tag nesting in `docs/components/api-ref.md`.
- [x] **Navigation Sync:** Added `docs/releases.md` to `_data/navigation.yml` under "Components".
- [x] **Permalink Conflict:** Resolved duplication by removing `docs/blog/index.md` in favor of `docs/blog.md`.
- [x] **unwanted spacing** - below the footer, there is a space that is not needed, it is causing the content to scroll to the bottom of the page
- [x] **releases/tags** - the tags and release component are not showing any data from _data/tags.yml or _data/releases.yml files please look into this.
- [x] **releases/tags** - shows data from `_data/tags.yml` or `_data/releases.yml` files but not when using capture tags, look into this.
- [x] **white space** below every page there is a significant amount of white space, this is not needed and is causing the content to scroll to the bottom of the page please look into this.

## View Transitions
- [x] **Page Transitions:** Basic view transition support implemented for seamless page navigation.
- [x] **Component-Level Transitions:** Enhanced the search modal with a premium, spring-based animation (`translateY` + `scale`). Standardized transition variables in `_root.scss`.

## Docs
- [x] **Component Discovery:** Consolidated all component documentation under the "Components" section in the sidebar. Added `Component Index` for better overview.
- [x] **Liquid IRL Guide:** Created `docs/liquid-irl.md` demonstrating how to use theme-specific CSS utility classes.
- [x] **Specialist Layouts:** Implemented "Portfolio", "Metrics/Stats", and "Hero Showcase" templates.
- [x] **Releases & Tags Documentation:** Created `docs/releases.md` with usage examples for `releases.html` and `tags.html`.

## Completed Tasks (History)

### Lucide Icons (v1.3.4)
- [x] Add `animation`, `hover`, `click`, and `continuous` parameters to `icon.html`.
- [x] Animation Behaviors: Stroke Draw, Pulse/Scale, Rotation/Spin, Shake/Nudge, Flap/Toggle.
- [x] **Blog Feature:** Published "Advanced Iconography" post demonstrating new features.

### Simple Icons (v1.3.5)

To cover the gaps in the Lucide icon library, we have added add a new component for simple icons. This component is a lightweight wrapper around the `icon.html` include, allowing you to easily add custom icons to your documentation.
  - [x] Add `simple-icon.html` component or wrapper around icon.html which every is more clean
  - [x] ~~support the same params if possible unsure if simple icons supports the same animation types etc~~
  - [x] update documenation docs sompoents add new simple-icon.html component
  - [x] git/github related nagivation items update to use simple icons as lucide icons dont have gitlab and github icons
  - [x] lets have speration of concerns, lets just have the simple-icons.html component sperate from the icon.html component and we add a prop in nivation to use simple icons as well default to lucide icons unless simple icons are specified.
  - [x] **font awesome** - we need to add support for font awesome icons, new component for this, this will be an extended component meaning it requires flag in the _config.yml file to use this component. we already load 2 already lucide and simple. to keep speed and performance. we only enable 

## Local scripts vs CDN

To Adhere to privacy and security best practices, we have decided to use local scripts instead of CDN. This will ensure that your documentation is always up-to-date and secure, as the scripts are hosted locally on your machine
 - [x] Pin All Scripts with version 
 - [x] add documentation section for this, specificly noting the versions of the scripts and the cdn links.
   - Simple Icons
   - lucide Icons
   - Font Awesome
   - Pagefind
   - logcad
   - snail trail ()
 - [x] lets also make it easy for users to add switch to local or cdn versions.

### Documentation & Components
- [x] Types of Splash Pages with examples and usage guides.
- [x] Roadmap component enhancements: percent complete, status, tasks, milestones.
- [x] Professional metadata for Posts/Articles (date, author, tags, category).
- [x] Releases and Tag components (GitHub/GitLab ready).
- [x] TOC top/bottom navigation links and configurable heading levels.

### DX & Quality of Life
- [x] Sidebar scroll to active page on load.
- [x] LogCAD and SnailTrail debug integration.
- [x] Floating "Back to Top" and "Next Page" navigation.
- [x] Breadcrumbs implementation with top-margin refinement.
- [x] MonaspiceAr Nerd Font Mono for code blocks.
- [x] Fix code block language label overlap.
- [x] "Edit this page" button with dynamic platform logos.
- [x] Tab Selection component (npm, yarn, pnpm).

## Release Hardening
 
- [ ] check comps/* components that done have the corrisonding docs/* documentation pages.
- [ ] if instruction of infomation lags detail. 
- [ ] REMOVE any vibe coded work or tone, note: the contents current is extremely clean and professional, i just has some viby stuff like High Performance etc. i prefer for robust to the point and expannatory, thats understood by Newbies and Experts alike with insulting the persons intelligence.
- [ ] Deployment of theme to Ruby Gems
- [ ] Deployment to Jekyll Themes Third-party sites: https://jekyllthemes.io/ and https://jekyllthemes.org/
- [ ] make sure there are not missing component or syntax that would be usfull to the user/dev for use of development.
- [ ] perhaps we make a detailed section devoplopment with details of how to easy extent theme, gives theme a site file folder structure, where stuff is stored, and how to add new components, how to add new layouts, how to add new liquid filters, etc. all refering back to the liquid and jekyll documenations sites.
