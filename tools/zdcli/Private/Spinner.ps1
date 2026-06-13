# Zero-Dark CLI - Stateful Spinner Helper

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$script:ZdSpinnerIdx = 0

function New-ZdSpinner {
    [CmdletBinding()]
    param(
        [string[]]$Steps = @('⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'),
        [switch]$Reset
    )

    process {
        if ($Reset) {
            $script:ZdSpinnerIdx = 0
            return ''
        }

        $currentIndex = $script:ZdSpinnerIdx % $Steps.Count
        $char = $Steps[$currentIndex]
        $script:ZdSpinnerIdx++
        return $char
    }
}
