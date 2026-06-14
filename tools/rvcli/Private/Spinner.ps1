# RavenUI CLI - Stateful Spinner Helper

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$script:RvSpinnerIdx = 0

function New-RvSpinner {
    [CmdletBinding()]
    param(
        [string[]]$Steps = @('⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'),
        [switch]$Reset
    )

    process {
        if ($Reset) {
            $script:RvSpinnerIdx = 0
            return ''
        }

        $currentIndex = $script:RvSpinnerIdx % $Steps.Count
        $char = $Steps[$currentIndex]
        $script:RvSpinnerIdx++
        return $char
    }
}
