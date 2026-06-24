# **RavenUI Workspace Context Capsule**
Generated on: 2026-06-24 18:56:17

## **1. Workspace Metadata**
- **Active Branch:** `feat/docs-references-scope/1700aa6`
- **Latest Commit:** `e6b71ee82036d2c18f96014cbccbd6a58f11dcf7`
- **Theme Version:** `1.18.0`
- **Workspace Status:** Dirty (modified files below):
```
 M .gitlab-ci.yml
 M CHANGELOG.md
 M devt.ps1
 M devtracker-pending.md
 M devtracker-source.md
 M tools/devt/Private/GitLabSync.ps1
 M tools/devt/Private/GitOps.ps1
 M tools/devt/Private/Helpers.ps1
 M tools/devt/Public/Invoke-Devt.ps1
 M tools/devt/devt.psm1
?? context-capsule.md
?? tools/devt/Private/ContextCapsule.ps1
```

## **2. Active Task List**

### **Critical Path (priority-1)**
### **Active Enhancements (priority-2)**
### **Feature Development (priority-3)**
- [ ] 🟡🌟 **DX/Deployment** - Deployment of theme to RubyGems. [#57](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/57)
- [ ] 🟡🌟 **DX/Deployment** - Deployment to third-party Jekyll theme directories. [#58](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/58)
- [ ] 🟡🌟 **Features/IssueTemplate** - Research and design a "Report Issue" template component where users fill out a form that compiles to a merge request, exploring secure API integrations for static sites to prevent exposure of API keys. [#64](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/64)
- [ ] 🟡🌟 **Features/TiltedCarousel** - Design and build a "Tilted Lapping Carousel" component featuring overlapping, swiveled, and layered card layouts (where spacing scales dynamically with card density). Implement card-flipping hover animations. [#65](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/65)
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

## **3. Theme Components & Documentation**
### **3.1. Reusable Components (_includes/comps/)**
- [`animate.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/animate.html) (1730 bytes)
- [`announcement.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/announcement.html) (2651 bytes)
- [`api-reference.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/api-reference.html) (2462 bytes)
- [`back-to-top.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/back-to-top.html) (880 bytes)
- [`breadcrumbs.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/breadcrumbs.html) (765 bytes)
- [`browser-support.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/browser-support.html) (2800 bytes)
- [`button.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/button.html) (1093 bytes)
- [`callout.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/callout.html) (835 bytes)
- [`card-index.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/card-index.html) (1340 bytes)
- [`card.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/card.html) (564 bytes)
- [`carousel.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/carousel.html) (4516 bytes)
- [`chartjs.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/chartjs.html) (5576 bytes)
- [`codepen.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/codepen.html) (4934 bytes)
- [`codesandbox.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/codesandbox.html) (907 bytes)
- [`color-block.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/color-block.html) (431 bytes)
- [`command-ref.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/command-ref.html) (1940 bytes)
- [`comments.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/comments.html) (2428 bytes)
- [`converter.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/converter.html) (4532 bytes)
- [`copy-button.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/copy-button.html) (1682 bytes)
- [`customer-callout.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/customer-callout.html) (1330 bytes)
- [`datatable.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/datatable.html) (9958 bytes)
- [`dependencies.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/dependencies.html) (926 bytes)
- [`depends-upon.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/depends-upon.html) (5752 bytes)
- [`details.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/details.html) (241 bytes)
- [`example-block.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/example-block.html) (192 bytes)
- [`example-code.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/example-code.html) (173 bytes)
- [`extra-api-fetcher.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/extra-api-fetcher.html) (11439 bytes)
- [`extra-media-card.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/extra-media-card.html) (1556 bytes)
- [`extra-media-details.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/extra-media-details.html) (4786 bytes)
- [`extra-related-carousel.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/extra-related-carousel.html) (3080 bytes)
- [`extra-spinner.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/extra-spinner.html) (773 bytes)
- [`extra-wiki-grid.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/extra-wiki-grid.html) (828 bytes)
- [`faq-item.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/faq-item.html) (465 bytes)
- [`faq.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/faq.html) (80 bytes)
- [`feature-card.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/feature-card.html) (353 bytes)
- [`feature-flags.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/feature-flags.html) (11032 bytes)
- [`feature-grid.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/feature-grid.html) (2195 bytes)
- [`feed-widget.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/feed-widget.html) (1442 bytes)
- [`feedback.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/feedback.html) (3280 bytes)
- [`figure.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/figure.html) (1116 bytes)
- [`font-awesome.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/font-awesome.html) (370 bytes)
- [`footer-2col.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/footer-2col.html) (1176 bytes)
- [`footer-3col.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/footer-3col.html) (1616 bytes)
- [`footer-item.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/footer-item.html) (1952 bytes)
- [`footer.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/footer.html) (5927 bytes)
- [`gist.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/gist.html) (1027 bytes)
- [`git-tags.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/git-tags.html) (3179 bytes)
- [`gradient-text.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/gradient-text.html) (712 bytes)
- [`grid-palette.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/grid-palette.html) (2824 bytes)
- [`grid.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/grid.html) (1267 bytes)
- [`header.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/header.html) (5249 bytes)
- [`heading.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/heading.html) (658 bytes)
- [`hero-card.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/hero-card.html) (896 bytes)
- [`hr.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/hr.html) (903 bytes)
- [`icon-grid.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/icon-grid.html) (1446 bytes)
- [`icon.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/icon.html) (568 bytes)
- [`iframe.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/iframe.html) (923 bytes)
- [`image.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/image.html) (1737 bytes)
- [`index-warning.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/index-warning.html) (4830 bytes)
- [`inline-callout.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/inline-callout.html) (107 bytes)
- [`kbd-group.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/kbd-group.html) (736 bytes)
- [`kbd.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/kbd.html) (470 bytes)
- [`last-edited.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/last-edited.html) (1152 bytes)
- [`layout-visualizer.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/layout-visualizer.html) (4534 bytes)
- [`likes.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/likes.html) (2501 bytes)
- [`metrics.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/metrics.html) (1569 bytes)
- [`modal.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/modal.html) (3682 bytes)
- [`package-tabs.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/package-tabs.html) (1502 bytes)
- [`page-nav.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/page-nav.html) (1400 bytes)
- [`paginator.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/paginator.html) (2231 bytes)
- [`platform-support.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/platform-support.html) (3260 bytes)
- [`playground.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/playground.html) (15214 bytes)
- [`previously-read.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/previously-read.html) (2703 bytes)
- [`progress.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/progress.html) (698 bytes)
- [`releases.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/releases.html) (2605 bytes)
- [`rendered-el-showcase.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/rendered-el-showcase.html) (1211 bytes)
- [`roadmap-item.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/roadmap-item.html) (1571 bytes)
- [`roadmap.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/roadmap.html) (1730 bytes)
- [`runtime-metadata.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/runtime-metadata.html) (7719 bytes)
- [`shield.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/shield.html) (1055 bytes)
- [`sidebar.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/sidebar.html) (10218 bytes)
- [`simple-icon.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/simple-icon.html) (720 bytes)
- [`site-stats.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/site-stats.html) (7084 bytes)
- [`sitemap.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/sitemap.html) (3372 bytes)
- [`spacer.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/spacer.html) (2308 bytes)
- [`sponsored-by.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/sponsored-by.html) (1086 bytes)
- [`static-files.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/static-files.html) (7846 bytes)
- [`steps.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/steps.html) (2239 bytes)
- [`svgcharts.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/svgcharts.html) (26129 bytes)
- [`tag-cloud.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/tag-cloud.html) (1254 bytes)
- [`tag-filter.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/tag-filter.html) (5309 bytes)
- [`tag.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/tag.html) (665 bytes)
- [`terminal.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/terminal.html) (512 bytes)
- [`theme-toggle.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/theme-toggle.html) (2876 bytes)
- [`timeline.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/timeline.html) (1824 bytes)
- [`toc.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/toc.html) (5469 bytes)
- [`tooltip.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/tooltip.html) (879 bytes)
- [`tree.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/tree.html) (2162 bytes)
- [`typewriter.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/typewriter.html) (1666 bytes)
- [`version-switcher.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/version-switcher.html) (836 bytes)
- [`vhs.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/vhs.html) (141 bytes)
- [`written-by.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/written-by.html) (2827 bytes)
- [`youtube.html`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/_includes/comps/youtube.html) (1350 bytes)

### **3.2. Documentation Pages (docs/components/)**
- [`announcement.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/announcement.md) (3176 bytes)
- [`api-reference.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/api-reference.md) (2908 bytes)
- [`back-to-top.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/back-to-top.md) (867 bytes)
- [`breadcrumbs.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/breadcrumbs.md) (1281 bytes)
- [`browser-support.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/browser-support.md) (1464 bytes)
- [`button.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/button.md) (2874 bytes)
- [`callout.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/callout.md) (1505 bytes)
- [`card-index.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/card-index.md) (1190 bytes)
- [`card.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/card.md) (1530 bytes)
- [`carousel.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/carousel.md) (3484 bytes)
- [`chartjs.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/chartjs.md) (4893 bytes)
- [`codepen.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/codepen.md) (2188 bytes)
- [`codesandbox.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/codesandbox.md) (1443 bytes)
- [`color-block.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/color-block.md) (1613 bytes)
- [`command-ref.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/command-ref.md) (2285 bytes)
- [`converter.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/converter.md) (1882 bytes)
- [`copy-button.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/copy-button.md) (1733 bytes)
- [`customer-callout.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/customer-callout.md) (1893 bytes)
- [`datatable.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/datatable.md) (2405 bytes)
- [`dependencies.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/dependencies.md) (1191 bytes)
- [`depends-upon.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/depends-upon.md) (4465 bytes)
- [`details.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/details.md) (1705 bytes)
- [`example-block.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/example-block.md) (1497 bytes)
- [`example-code.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/example-code.md) (1255 bytes)
- [`extra-components.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/extra-components.md) (7100 bytes)
- [`faq.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/faq.md) (2111 bytes)
- [`feature-card.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/feature-card.md) (1503 bytes)
- [`feature-flags.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/feature-flags.md) (2365 bytes)
- [`feature-grid.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/feature-grid.md) (2873 bytes)
- [`feedback.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/feedback.md) (3892 bytes)
- [`figure.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/figure.md) (2343 bytes)
- [`font-awesome.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/font-awesome.md) (2541 bytes)
- [`footer.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/footer.md) (3516 bytes)
- [`git-tags.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/git-tags.md) (2111 bytes)
- [`gradient-text.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/gradient-text.md) (2073 bytes)
- [`grid-palette.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/grid-palette.md) (4050 bytes)
- [`grid.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/grid.md) (2193 bytes)
- [`header.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/header.md) (1814 bytes)
- [`heading.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/heading.md) (1754 bytes)
- [`hero-card.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/hero-card.md) (1486 bytes)
- [`hr.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/hr.md) (2303 bytes)
- [`icon-grid.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/icon-grid.md) (1544 bytes)
- [`icon.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/icon.md) (1824 bytes)
- [`iframe.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/iframe.md) (1550 bytes)
- [`image.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/image.md) (1762 bytes)
- [`index-warning.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/index-warning.md) (1040 bytes)
- [`index.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/index.md) (2183 bytes)
- [`inline-callout.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/inline-callout.md) (1579 bytes)
- [`kbd.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/kbd.md) (2543 bytes)
- [`last-edited.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/last-edited.md) (1390 bytes)
- [`layout-visualizer.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/layout-visualizer.md) (1475 bytes)
- [`metrics.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/metrics.md) (3081 bytes)
- [`modal.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/modal.md) (2883 bytes)
- [`package-tabs.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/package-tabs.md) (1314 bytes)
- [`page-nav.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/page-nav.md) (1230 bytes)
- [`platform-support.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/platform-support.md) (2286 bytes)
- [`playground.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/playground.md) (2303 bytes)
- [`plugin-components.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/plugin-components.md) (3509 bytes)
- [`previously-read.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/previously-read.md) (1085 bytes)
- [`progress.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/progress.md) (1772 bytes)
- [`releases.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/releases.md) (1383 bytes)
- [`rendered-el-showcase.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/rendered-el-showcase.md) (1715 bytes)
- [`roadmap-item.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/roadmap-item.md) (1985 bytes)
- [`roadmap.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/roadmap.md) (4866 bytes)
- [`runtime-metadata.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/runtime-metadata.md) (2130 bytes)
- [`shield.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/shield.md) (2591 bytes)
- [`sidebar.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/sidebar.md) (1696 bytes)
- [`simple-icon.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/simple-icon.md) (1909 bytes)
- [`site-stats.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/site-stats.md) (2548 bytes)
- [`sitemap.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/sitemap.md) (1549 bytes)
- [`spacer.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/spacer.md) (3086 bytes)
- [`sponsored-by.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/sponsored-by.md) (1807 bytes)
- [`static-files.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/static-files.md) (2309 bytes)
- [`steps.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/steps.md) (2382 bytes)
- [`svgcharts.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/svgcharts.md) (5430 bytes)
- [`tag-cloud.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/tag-cloud.md) (1287 bytes)
- [`tag-filter.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/tag-filter.md) (4511 bytes)
- [`tag.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/tag.md) (3093 bytes)
- [`tags.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/tags.md) (2046 bytes)
- [`terminal.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/terminal.md) (2052 bytes)
- [`timeline.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/timeline.md) (2528 bytes)
- [`toc.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/toc.md) (2131 bytes)
- [`tooltip.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/tooltip.md) (2529 bytes)
- [`tree.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/tree.md) (1949 bytes)
- [`typewriter.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/typewriter.md) (1460 bytes)
- [`vhs.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/vhs.md) (1550 bytes)
- [`written-by.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/written-by.md) (2139 bytes)
- [`youtube.md`](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/docs/components/youtube.md) (1657 bytes)

## **4. Engineering Context & Architectural Guidelines**
### **4.1. Source: extended-knowledge-lessons-learned-building-ravenui-v1.md**
> Reference: [source file](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/context-source/extended-knowledge-lessons-learned-building-ravenui-v1.md)

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

### **1.3. Syntax Highlighter Standardization (Rouge vs. CodeRay)**
- **Decision:** Exclusively standardize on **Rouge** as the theme's syntax highlighter, avoiding any legacy CodeRay support.
- **Reasoning:** Rouge supports over 200+ languages (including modern JS/TS, JSX, Rust, YAML, and TOML) compared to CodeRay's ~40 languages. Additionally, CodeRay is deprecated and has been removed from native kramdown v2.x cores. Standardizing on Rouge prevents CSS bloat by avoiding duplicate syntax styling sheets.

### **1.4. Custom Plugin Architecture (Internal vs. External Gems)**
- **Decision:** Keep custom Jekyll plugins (`component_tag.rb`, `from_yaml.rb`, `og_image_generator.rb`, `runtime_metadata.rb`) internal to the theme within the `_plugins/` directory, rather than extracting and releasing them as independent Ruby gems.
- **Reasoning:** Keeping plugins internal provides a zero-configuration, out-of-the-box developer experience for theme consumers. Custom tags (like `rd` and `rdi`) are tightly coupled with the theme's modular `_includes` directories (such as `comps/` and `core/`), which would require complex path configuration if split into a separate gem. Furthermore, the lightweight nature of these plugins (ranging from 15 to 132 lines of code) does not justify the packaging and dependency maintenance overhead of multiple separate gems. Lastly, it ensures rapid local development and hot-reloading without the need for gem linking or local path overrides.

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

### **2.10. Literal Liquid Tags in Markdown Code Blocks**
- **Problem:** Writing markdown code blocks containing literal Jekyll Liquid templates (e.g. `{% capture %}` or `{{ site.title }}`) throws Jekyll compiler exceptions (such as `Syntax Error in 'capture' - Valid syntax: capture [var]`) or renders raw HTML elements unintentionally.
- **Cause:** Jekyll processes Liquid syntax across all file sections, including backtick fenced code blocks, before parsing markdown.
- **Resolution:** Wrap any code segments containing literal Liquid syntax in `{% raw %}` and `{% endraw %}` block tags.

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



---

### **4.1. Source: extended-knowledge-lessons-learned-building-ravenui.md**
> Reference: [source file](file:///mnt/g/devspace/projects/web/_repo/staticcanvas/zero-dark/ravenui-jekyll-theme/context-source/extended-knowledge-lessons-learned-building-ravenui.md)

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

