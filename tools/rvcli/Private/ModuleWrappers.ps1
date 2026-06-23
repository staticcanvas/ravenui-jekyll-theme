# RavenUI CLI - PowerShell Module Wrappers Helper
# Wraps Find-Module, Install-Module, and Get-Module to validate and manage workspace dependencies without user prompting.
# [Compliance: Private helper | Write-RvLog | Zero prompts]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Checks if a module is loaded or available in the module path
function Test-RvModuleInstalled {
    param(
        [Parameter(Mandatory)]
        [string]$ModuleName
    )

    # 1. Check if loaded
    if (Get-Module -Name $ModuleName -ErrorAction SilentlyContinue) {
        return $true
    }

    # 2. Check if available on disk in PSModulePath
    if (Get-Module -Name $ModuleName -ListAvailable -ErrorAction SilentlyContinue) {
        return $true
    }

    return $false
}

# Attempts to install a module securely using CurrentUser scope to avoid privilege elevation
function Install-RvModuleSecure {
    param(
        [Parameter(Mandatory)]
        [string]$ModuleName
    )

    Write-RvLog -Level "act" -Message "Attempting to install module '$ModuleName' from PSGallery..." -Context "dep-check"

    # Set PSGallery repository to Trusted if it exists to prevent interactive prompts
    try {
        $repo = Get-PSRepository -Name "PSGallery" -ErrorAction SilentlyContinue
        if ($repo -and $repo.InstallationPolicy -ne "Trusted") {
            Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted -ErrorAction SilentlyContinue | Out-Null
        }
    } catch {
        # Non-critical, continue
    }

    try {
        # Install with parameters to prevent prompting and run without admin rights
        Install-Module -Name $ModuleName `
                       -Scope CurrentUser `
                       -Force `
                       -AllowClobber `
                       -SkipPublisherCheck `
                       -ErrorAction Stop | Out-Null
        
        Write-RvLog -Level "suc" -Message "Module '$ModuleName' installed successfully." -Context "dep-check"
        return $true
    } catch {
        Write-RvLog -Level "fail" -Message "Failed to install module '$ModuleName': $_" -Context "dep-check"
        return $false
    }
}

# Asserts module requirement, installing it if missing, and throwing if installation fails
function Assert-RvModuleRequired {
    param(
        [Parameter(Mandatory)]
        [string]$ModuleName
    )

    if (Test-RvModuleInstalled -ModuleName $ModuleName) {
        return $true
    }

    Write-RvLog -Level "warn" -Message "Required module '$ModuleName' is not installed." -Context "dep-check"
    
    $installed = Install-RvModuleSecure -ModuleName $ModuleName
    if (-not $installed) {
        throw "Missing required PowerShell module: $ModuleName. Please install it manually with: Install-Module $ModuleName"
    }

    return $true
}
