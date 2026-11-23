<#
.SYNOPSIS
    Configures Windows 11 to prevent AutoRun commands from executing.

.NOTES
    Author          : Maxim Bondarchuk
    Template Credit : Josh Madakor
    Date Created    : 2026-11-23
    Last Modified   : 2026-11-23
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000185

.TESTED ON
    Date(s) Tested  : 2026-11-23
    Tested By       : Maxim Bondarchuk
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
    Example:
    .\WN11-CC-000185.ps1
#>

$path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'

# Create the registry key only if it is missing
if (-not (Test-Path -Path $path)) {
    New-Item -Path $path -Force -ErrorAction Stop | Out-Null
}

# Prevent AutoRun commands from executing
New-ItemProperty -Path $path -Name 'NoAutorun' -PropertyType DWord -Value 1 -Force -ErrorAction Stop | Out-Null

# Verify the configured value; expected output: 1
Get-ItemPropertyValue -Path $path -Name 'NoAutorun' -ErrorAction Stop
