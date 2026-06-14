#!/usr/bin/env pwsh
# RavenUI CLI - Core Entry Runner

$scriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
Import-Module ([System.IO.Path]::Combine($scriptPath, "tools/rvcli/rvcli.psd1")) -Force
Start-RvCli @args
