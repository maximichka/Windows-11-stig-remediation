<#
.SYNOPSIS
    Disables slide shows on the Windows 11 lock screen.

.NOTES
    Author          : Maxim Bondarchuk
    Template Credit : Josh Madakor
    Date Created    : 2026-11-22
    Last Modified   : 2026-11-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000010

.TESTED ON
    Date(s) Tested  : 2026-11-22
    Tested By       : Maxim Bondarchuk
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
    Example:
    .\WN11-CC-000010.ps1
#>

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'

# Create the registry key if needed
New-Item -Path $path -Force | Out-Null

# Disable slide shows on the lock screen
New-ItemProperty -Path $path -Name 'NoLockScreenSlideshow' -PropertyType DWord -Value 1 -Force | Out-Null

# Verify the configured value; expected output: 1
Get-ItemPropertyValue -Path $path -Name 'NoLockScreenSlideshow'
