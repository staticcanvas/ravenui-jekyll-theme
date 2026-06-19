# Jekyll Theme RavenUI - Development Notes and Workflow Instructions

## **Tasklist**

### **Critical Path (priority-1)**
### **Active Enhancements (priority-2)**
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
- [ ] 🟡🌟 **Features/IssueTemplate** - Research and design a "Report Issue" template component where users fill out a form that compiles to a merge request, exploring secure API integrations for static sites to prevent exposure of API keys. [#64](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/64)
- [ ] 🟡🌟 **Features/TiltedCarousel** - Design and build a "Tilted Lapping Carousel" component featuring overlapping, swiveled, and layered card layouts (where spacing scales dynamically with card density). Implement card-flipping hover animations. [#65](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/65)
- [ ] 🟠🌟 **CLI/Helpers** - Build and test standalone utility helpers in `tools/` adhering to the root module loader structure, to be integrated into `rvcli`: [#70](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/70)
    - [ ] 🟡🌟 **CLI/Helpers/RequestRelease** - Implement `Request-RvRelease` using .NET `[System.Net.Http.HttpClient]` (non-API mode) to query and fetch releases from GitLab/GitHub.
    - [ ] 🟡🌟 **CLI/Helpers/UnpackRelease** - Implement `Unpack-RvRelease` supporting pipeline inputs (`ValueFromPipeline`) to unpack release archives natively.
    - [ ] 🟡🌟 **CLI/Helpers/RequestTag** - Implement `Request-RvTag` to query tags from GitHub.
    - [ ] 🟡🌟 **CLI/Helpers/ModuleWrappers** - Implement private helper functions wrapping `Find-Module`, `Install-Module`, and `Get-Module` to automate workspace dependency validation.

- [ ] 🟡🌟3️⃣ **Feature** - Implement context capsule exporter mode to generate structured AI-ready workspace context
- [ ] 🟠🌟3️⃣ **Feature** - Implement automated conventional changelog generator compiling completed tasks
- [ ] 🟡🌟3️⃣ **Feature** - Add CI verification checks to block merge requests if branch task list is out of sync
### **Bug Fixes (priority-4)**
### **Refactoring & QOL (priority-5)**
### **Documentation & Docs (priority-6)**
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

> unsorted
> https://remixicon.com/ add
> giscus add support to ravenui - https://giscus.app/
