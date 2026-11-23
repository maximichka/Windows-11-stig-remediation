<#
.SYNOPSIS
    Disables Windows Game Recording and Broadcasting on Windows 11.

.NOTES
    Author          : Maxim Bondarchuk
    Template Credit : Josh Madakor
    Date Created    : 2026-11-22
    Last Modified   : 2026-11-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000252

.TESTED ON
    Date(s) Tested  : 2026-11-22
    Tested By       : Maxim Bondarchuk
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
    Example:
    .\WN11-CC-000252.ps1
#>

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR'

# Create the registry key only if it is missing
if (-not (Test-Path -Path $path)) {
    New-Item -Path $path -Force -ErrorAction Stop | Out-Null
}

# Disable Windows Game Recording and Broadcasting
New-ItemProperty -Path $path -Name 'AllowGameDVR' -PropertyType DWord -Value 0 -Force -ErrorAction Stop | Out-Null

# Verify the configured value; expected output: 0
Get-ItemPropertyValue -Path $path -Name 'AllowGameDVR' -ErrorAction Stop
