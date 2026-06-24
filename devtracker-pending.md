# Jekyll Theme RavenUI - Development Notes and Workflow Instructions

## **Tasklist**

### **Critical Path (priority-1)**
### **Active Enhancements (priority-2)**
- [ ] devt is needs to take advantage of powershells tab completion, via a dynamic augment completer or using the validateSet param property

### **Feature Development (priority-3)**
- [ ] 🟡🌟 **DX/Deployment** - Deployment of theme to RubyGems. [#57](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/57)
- [ ] 🟡🌟 **DX/Deployment** - Deployment to third-party Jekyll theme directories. [#58](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/58)
- [ ] 🟡🌟 **Features/IssueTemplate** - Research and design a "Report Issue" template component where users fill out a form that compiles to a merge request, exploring secure API integrations for static sites to prevent exposure of API keys. [#64](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/64)
- [ ] 🟡🌟 **Features/TiltedCarousel** - Design and build a "Tilted Lapping Carousel" component featuring overlapping, swiveled, and layered card layouts (where spacing scales dynamically with card density). Implement card-flipping hover animations. [#65](https://gitlab.com/staticcanvas/zero-dark-jekyll-theme/-/issues/65)
- [ ] 🟡🌟3️⃣ **Feature** - Implement context capsule exporter mode to generate structured AI-ready workspace context
- [ ] 🟡🌟3️⃣ **Feature** - Add CI verification checks to block merge requests if branch task list is out of sync
- [ ] 🟡🌟 **CLI/Devt/CommitLinks** - Update changelog compiler to display short commit hashes linked to commits for release notes or feature additions.
- [ ] 🟡🌟 **CLI/Devt/MRFooter** - Implement merge request footer template including checklist verification (e.g., Pester tests).
- [ ] 🟡🌟 **CLI/Devt/GitLabMapping** - Map GitLab task IDs to local devt tasks to automate issue closing references and ensure changelog consistency.
- [ ] 🟡🌟 **CLI/Devt/MRCommitCount** - Enhance merge request generation to include commit count and detailed, informative summaries for zero-touch AI automation.
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
