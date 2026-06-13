#!/usr/bin/env pwsh
# Zero-Dark CLI - Core Entry Runner

$scriptPath = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)
Import-Module ([System.IO.Path]::Combine($scriptPath, "tools/zdcli/zdcli.psd1")) -Force
Start-ZdCli @args
