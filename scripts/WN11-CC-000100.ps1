<#
.SYNOPSIS
    Prevents downloading print driver packages over HTTP on Windows 11.

.NOTES
    Author          : Maxim Bondarchuk
    Template Credit : Josh Madakor
    Date Created    : 2026-11-22
    Last Modified   : 2026-11-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000100

.TESTED ON
    Date(s) Tested  : 2026-11-22
    Tested By       : Maxim Bondarchuk
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
    Example:
    .\WN11-CC-000100.ps1
#>

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers'

# Create the registry key only if it is missing
if (-not (Test-Path -Path $path)) {
    New-Item -Path $path -Force -ErrorAction Stop | Out-Null
}

# Prevent downloading print driver packages over HTTP
New-ItemProperty -Path $path -Name 'DisableWebPnPDownload' -PropertyType DWord -Value 1 -Force -ErrorAction Stop | Out-Null

# Verify the configured value; expected output: 1
Get-ItemPropertyValue -Path $path -Name 'DisableWebPnPDownload' -ErrorAction Stop
