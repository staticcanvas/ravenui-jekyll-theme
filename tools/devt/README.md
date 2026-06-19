# **devt — Branded Task Lifecycle & Git Automation Module**

`devt` is a lightweight, self-contained PowerShell utility module designed to manage task lists, conventional commits, and GitLab project tracking directly from the terminal. 

It is designed to be fully reusable across any Git repository to bridge local file-based task tracking with remote GitLab work items and milestones, while keeping context token footprints low for AI coding assistants.

---

## **Why It Was Created**

1. **Context Capsule Efficiency**: Large project task lists consume significant AI context tokens. `devt` compiles a comprehensive task source file into a compact, pending-only task list to keep AI processing speeds high and token usage low.
2. **Local-First Source of Truth (SOT)**: Keeps the task list in plain Markdown committed to Git, avoiding heavy project management web app overhead while retaining full version control history.
3. **Automation Bridge**: Automates Git conventional commits, branch diffing, and two-way status/comment syncing with GitLab issues, milestones, and Merge Requests.

---

## **File Lifecycle Architecture**

`devt` manages tasks across three canonical files in the repository root:

*   **`devtracker-source.md`**: The local Source of Truth (SOT) containing all active tasks, historical notes, and completed records.
*   **`devtracker-pending.md`**: The compiled active task list. Completed items are filtered out to keep it lightweight for AI agents.
*   **`devtracker-archive.md`**: Permanent archival file for completed tasks that have been pruned from the active source.

---

## **Key Features & Execution Modes**

### **Task Compilation & Lifecycle**
*   `devt init`: Prepares a fresh `devtracker-source.md` template file.
*   `devt compile` (or `comp`): Filters and compiles active tasks from the source file into `devtracker-pending.md`.
*   `devt sync`: Merges completed task checkmarks and inline developer notes from the pending file back into the source file.
*   `devt prune`: Moves all completed tasks from the source file to `devtracker-archive.md`.
*   `devt stats`: Renders a high-fidelity terminal dashboard with task metrics and progress bars using ANSI gradients.
*   `devt list`: Lists tasks in a clean terminal view with optional filters (`-Difficulty`, `-Scope`, `-CompleteStatus`).
*   `devt add`: Formats and appends a new task line to the source tracker.
*   `devt remove` (or `rm`): Deletes a task from the source file matching a search key.
*   `devt validate`: Audits the source task list to ensure it conforms to the canonical emoji and category formatting.

### **Git & GitLab Integration**
*   `devt sync-gitlab`: Performs two-way synchronization between local tasks and GitLab issues:
    *   Creates/maps GitLab milestones based on Markdown category headings.
    *   Creates GitLab issues for local tasks, automatically assigning them to the developer and linking them to milestones.
    *   Appends Markdown issue links (e.g. `[#123](url)`) to the local task lines.
    *   Closes GitLab issues when local tasks are checked off.
    *   Marks local tasks completed when the corresponding GitLab issues are closed (two-way sync).
    *   Tracks active tasks (marked with `🌀` emoji) and adds `workflow::in-progress` labels on GitLab.
    *   Syncs local task comments (lines starting with `>`) as discussion notes in the GitLab issue.
*   `devt commit`: Prompts for Conventional Commit metadata (type, scope, summary, version impact, additions, fixes) and performs a structured commit adhering to standard versioning schemas.
*   `devt diff`: Displays a styled summary of staged/unstaged changes.
*   `devt branches`: Displays a terminal comparison dashboard of local repository branches, listing relative active age, commits ahead/behind compared to the base branch, and the last commit message.
*   `devt gitdiff` (optionally using `-Branch <compare-branch>`): Shows structured code differences (commits ahead, modified files, diff code preview) between the current branch and a compare branch.
*   `devt create-mr`: Compiles commits on the current branch that are ahead of `develop` and generates a Draft Merge Request description on GitLab containing Linked Issues, Feature Additions, and Bug Fixes.
*   `devt changelog`: Automatically parses git conventional commit history and compiles a structured, grouped `CHANGELOG.md` file in the repository root.

---

## **Technical Implementation & Portability**

### **Module Directory Structure**

The module is structured according to clean PowerShell automation standards:

```text
tools/devt/
├── devt.psd1                     # Module manifest defining exports and metadata
├── devt.psm1                     # Root module loader (sources all scripts dynamically)
├── README.md                     # Documentation
├── Public/
│   └── Invoke-Devt.ps1           # Main cmdlet orchestrator (aliased to 'devt')
└── Private/
    ├── Helpers.ps1               # Text parsers, dynamic root resolution & validators
    ├── GitLabSync.ps1            # GitLab REST API interaction & MR generation
    ├── GitOps.ps1                # Conventional Commit helper & diff formatting
    ├── Get-ConventionalCommitVersion.ps1 # Tag-anchored conventional commits versioning engine
    ├── New-AsciiGradient.ps1     # Native ANSI 256-color gradient generator
    ├── New-AsciiColor.ps1        # Standard terminal color helper
    └── lazylog.ps1               # Structured execution logger
```

### **Dynamic Git Root Resolution**
To ensure `devt` remains fully reusable and independent of the folder path in which it is installed, the module resolves the repository root dynamically by walking up the directory tree from the module's location until it locates a `.git` directory. If none is found, it falls back to three directory levels above the helper directory.

### **Version Engine: Get-ConventionalCommitVersion**
`devt` integrates the `Get-ConventionalCommitVersion` engine to calculate project semantic versions (SemVer). 
*   **Tag-Anchored Analysis**: The engine locates the most recent Git tag (e.g., `v1.2.3`) to establish a version baseline, scanning only the commit logs generated since that tag.
*   **Fallback Scanning**: If no tags are found in the repository history, the engine scans the full repository history starting from `0.1.0`.
*   **Commit Parsing**: It inspects subject lines for conventional types (`feat` minor bump, `fix` or `perf` patch bump) and checks commit bodies for `BREAKING CHANGE:` keywords to trigger major version bumps.

### **GitLab Auto-Authentication**
`devt` automatically extracts the credentials needed for the GitLab REST API by parsing the repository's Git remote origin URL:
```text
https://username:token@gitlab.com/namespace/project.git
```
This avoids hardcoding or maintaining separate environment configuration files, enabling secure API interactions for `sync-gitlab` and `create-mr` commands.

### **Performance Optimization**
The module is designed with high-performance .NET classes under the hood:
*   Utilizes `[System.IO.File]` and `[System.IO.Path]` for direct disk I/O, bypassing slow PowerShell disk cmdlets.
*   Implements `[System.Text.StringBuilder]` for layout compiling to minimize memory allocation.
*   Uses `[System.Collections.Generic.List[type]]` for in-memory collections.

---

## **Task Format Conventions**

To be parsed and validated correctly by `devt`, task lines in the Markdown files must conform to the following schema:

```markdown
- [ ] <difficulty><scope>[status][priority] **Category/SubCategory** - Task Description
```

### **Metadata Emojis**
*   **Difficulty**: `🟢` (Very Easy), `🟡` (Easy), `🟠` (Moderate), `🔴` (Very High)
*   **Scope**: `💡` (Concept), `🌟` (Feature), `🦀` (Active Bug), `🪲` (Resolved Bug), `🩹` (Fix)
*   **Status**: `✔️` (Partially Complete), `❓` (Working with Issues), `✅` (Verified Complete), `🌀` (Work in Progress)
*   **Priority**: Keycap digits `0️⃣` to `🔟`

*Example:*
```markdown
- [ ] 🟠🌟🌀 **CLI/TaskTracker** - Implement GitLab sync logic
```

---

## **How to Reuse in Other Repositories**

To reuse the `devt` task manager in another repository:

1. Copy the `tools/devt` directory into your target repository.
2. In the target repository root, create an entry script named `devt.ps1` (or add an alias to your shell profile):
   ```powershell
   #!/usr/bin/env pwsh
   $scriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
   Import-Module ([System.IO.Path]::Combine($scriptPath, "tools/devt/devt.psd1")) -Force
   Invoke-Devt @args
   ```
3. Initialize the task structure:
   ```bash
   pwsh -File devt.ps1 init
   ```
4. Update `devtracker-source.md` with your repository-specific tasks.
