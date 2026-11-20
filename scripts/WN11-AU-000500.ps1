<#
.SYNOPSIS
    Configures the Application event log maximum size to 32768 KB (32 MB).

.NOTES
    Author          : Maxim Bondarchuk
    Template Credit : Josh Madakor
    Date Created    : 2026-11-20
    Last Modified   : 2026-11-20
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 2026-11-20
    Tested By       : Maxim Bondarchuk
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
    Example:
    .\WN11-AU-000500.ps1
#>

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'

# Create the registry key if needed
New-Item -Path $path -Force | Out-Null

# Set the maximum Application event log size to 32768 KB
New-ItemProperty -Path $path -Name 'MaxSize' -PropertyType DWord -Value 32768 -Force | Out-Null

# Verify the configured value; expected output: 32768
Get-ItemPropertyValue -Path $path -Name 'MaxSize'
