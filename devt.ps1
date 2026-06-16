#!/usr/bin/env pwsh
# RavenUI Task Tracker PowerShell Entry Runner

$scriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
Import-Module ([System.IO.Path]::Combine($scriptPath, "tools/devt/devt.psd1")) -Force
Invoke-Devt @args
