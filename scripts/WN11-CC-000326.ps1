<#
.SYNOPSIS
    Enables PowerShell script block logging on Windows 11.

.NOTES
    Author          : Maxim Bondarchuk
    Template Credit : Josh Madakor
    Date Created    : 2026-11-21
    Last Modified   : 2026-11-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326

.TESTED ON
    Date(s) Tested  : 2026-11-21
    Tested By       : Maxim Bondarchuk
    Systems Tested  : Windows 11
    PowerShell Ver. : 5.1

.USAGE
    Run PowerShell as Administrator.
    Example:
    .\WN11-CC-000326.ps1
#>

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'

# Create the registry key if needed
New-Item -Path $path -Force | Out-Null

# Enable PowerShell script block logging
New-ItemProperty -Path $path -Name 'EnableScriptBlockLogging' -PropertyType DWord -Value 1 -Force | Out-Null

# Verify the configured value; expected output: 1
Get-ItemPropertyValue -Path $path -Name 'EnableScriptBlockLogging'
