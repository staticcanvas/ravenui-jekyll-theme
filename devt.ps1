#!/usr/bin/env pwsh
# RavenUI Task Tracker PowerShell Entry Runner

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false, Position=0)]
    [ValidateSet("init", "compile", "comp", "sync", "prune", "stats", "list", "add", "remove", "rm", "commit", "diff", "validate", "sync-gitlab", "create-mr", "branches", "gitdiff", "changelog", "capsule", "help")]
    [string]$Mode = "compile",

    [Parameter(Mandatory=$false)]
    [string]$SourcePath = "devtracker-source.md",

    [Parameter(Mandatory=$false)]
    [string]$TargetPath = "devtracker-pending.md",

    [Parameter(Mandatory=$false)]
    [string]$ArchivePath = "devtracker-archive.md",

    [Parameter(Mandatory=$false)]
    [switch]$ExcludeCompleted,

    [Parameter(Mandatory=$false)]
    [switch]$IncludeCompleted,

    [Parameter(Mandatory=$false)]
    [string[]]$KeepCompletedWithEmoji = @(),

    [Parameter(Mandatory=$false)]
    [string[]]$ExcludeCompletedWithEmoji = @(),

    [Parameter(Mandatory=$false)]
    [string[]]$FilterEmoji = @(),

    [Parameter(Mandatory=$false)]
    [string[]]$ExcludeEmoji = @(),

    [Parameter(Mandatory=$false)]
    [switch]$KeepInstructions,

    [Parameter(Mandatory=$false)]
    [switch]$CleanTemplate,

    [Parameter(Mandatory=$false)]
    [string]$TaskText,

    [Parameter(Mandatory=$false)]
    [string]$Category,

    [Parameter(Mandatory=$false)]
    [ValidateSet('very-easy', 'easy', 'moderate', 'very', '🟢', '🟡', '🟠', '🔴')]
    [string]$Difficulty,

    [Parameter(Mandatory=$false)]
    [ValidateSet('feature', 'bug', 'bug-fixed', 'fix', 'concept', '🌟', '🦀', '🪲', '🩹', '💡')]
    [string]$Scope,

    [Parameter(Mandatory=$false)]
    [ValidateSet('0','1','2','3','4','5','6','7','8','9','10', '0️⃣','1️⃣','2️⃣','3️⃣','4️⃣','5️⃣','6️⃣','7️⃣','8️⃣','9️⃣','🔟')]
    [string]$Priority,

    [Parameter(Mandatory=$false)]
    [ValidateSet('incomplete', 'partially', 'issues', 'complete', 'working', '✔️', '❓', '✅', '🌀')]
    [string]$CompleteStatus,

    [Parameter(Mandatory=$false)]
    [string]$Branch,

    [Parameter(Mandatory=$false)]
    [string]$TaskKey
)

$scriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
Import-Module ([System.IO.Path]::Combine($scriptPath, "tools/devt/devt.psd1")) -Force
if ($args) {
    Invoke-Devt @PSBoundParameters @args
} else {
    Invoke-Devt @PSBoundParameters
}
