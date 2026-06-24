# Unpack-RvRelease Cmdlet
# Natively extracts ZIP and TAR.GZ release archives using .NET compression assemblies.
# Supports pipeline input from Request-RvRelease.
# [Compliance: public cmdlet | .NET classes | GZipStream & TarFile | zero external dependencies]

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Unpack-RvRelease {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [string]$Path,

        [Parameter(Mandatory = $false)]
        [string]$Destination = "",

        [Parameter(Mandatory = $false)]
        [switch]$CleanDestination
    )

    begin {
        # Ensure Zip and Tar assemblies are loaded if possible
        try {
            Add-Type -AssemblyName "System.IO.Compression" -ErrorAction SilentlyContinue | Out-Null
            Add-Type -AssemblyName "System.IO.Compression.FileSystem" -ErrorAction SilentlyContinue | Out-Null
        } catch {
            # Non-critical, system types might already be visible
        }
    }

    process {
        $resolvedPath = [System.IO.Path]::GetFullPath($Path)
        if (-not [System.IO.File]::Exists($resolvedPath)) {
            Write-RvLog -Level "fail" -Message "Archive path not found: $Path" -Context "unpack"
            return
        }

        $resolvedDest = $Destination
        if ([string]::IsNullOrEmpty($resolvedDest)) {
            $resolvedDest = [System.IO.Directory]::GetCurrentDirectory()
        }
        $resolvedDest = [System.IO.Path]::GetFullPath($resolvedDest)

        # Create destination directory if it doesn't exist
        if (-not [System.IO.Directory]::Exists($resolvedDest)) {
            [System.IO.Directory]::CreateDirectory($resolvedDest) | Out-Null
        }

        # Clear destination directory if requested
        if ($CleanDestination) {
            Write-RvLog -Level "act" -Message "Cleaning destination directory: $resolvedDest" -Context "unpack"
            try {
                $files = [System.IO.Directory]::GetFiles($resolvedDest)
                foreach ($file in $files) {
                    [System.IO.File]::Delete($file)
                }
                $subdirs = [System.IO.Directory]::GetDirectories($resolvedDest)
                foreach ($subdir in $subdirs) {
                    [System.IO.Directory]::Delete($subdir, $true)
                }
            } catch {
                Write-RvLog -Level "warn" -Message "Failed to completely clean destination: $_" -Context "unpack"
            }
        }

        Write-RvLog -Level "act" -Message "Extracting archive '$Path' to '$resolvedDest'..." -Context "unpack"

        $ext = [System.IO.Path]::GetExtension($resolvedPath).ToLower()

        if ($ext -eq ".zip") {
            try {
                # Extract ZIP using ZipFile
                [System.IO.Compression.ZipFile]::ExtractToDirectory($resolvedPath, $resolvedDest, $true)
                Write-RvLog -Level "suc" -Message "Extracted ZIP archive successfully." -Context "unpack"
            } catch {
                Write-RvLog -Level "fail" -Message "Failed to extract ZIP archive: $_" -Context "unpack"
            }
        } elseif ($ext -eq ".gz" -or $resolvedPath.EndsWith(".tar.gz") -or $ext -eq ".tgz") {
            try {
                # Create temporary uncompressed tar path
                $tempTar = [System.IO.Path]::GetTempFileName() + ".tar"
                
                # Decompress Gzip stream to Tar
                $inputStream = [System.IO.File]::OpenRead($resolvedPath)
                $gzipStream = [System.IO.Compression.GZipStream]::new($inputStream, [System.IO.Compression.CompressionMode]::Decompress)
                $outputStream = [System.IO.File]::Create($tempTar)
                try {
                    $gzipStream.CopyTo($outputStream)
                } finally {
                    $outputStream.Dispose()
                    $gzipStream.Dispose()
                    $inputStream.Dispose()
                }

                # Extract Tar using native .NET formats class
                [System.Formats.Tar.TarFile]::ExtractToDirectory($tempTar, $resolvedDest, $true)
                
                # Clean up temporary tar file
                if ([System.IO.File]::Exists($tempTar)) {
                    [System.IO.File]::Delete($tempTar)
                }

                Write-RvLog -Level "suc" -Message "Extracted TAR.GZ archive successfully." -Context "unpack"
            } catch {
                Write-RvLog -Level "fail" -Message "Failed to extract TAR.GZ archive: $_" -Context "unpack"
            }
        } else {
            Write-RvLog -Level "fail" -Message "Unsupported archive format: '$ext'. Must be .zip, .tar.gz, or .tgz" -Context "unpack"
        }
    }
}
