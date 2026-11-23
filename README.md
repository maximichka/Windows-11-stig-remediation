# Windows 11 STIG Remediation

This project shows how I fixed 10 Windows 11 security settings in an Azure lab using PowerShell. I used Tenable to scan the computer and check that each fix worked.

A STIG, or Security Technical Implementation Guide, is a set of security rules published by DISA. These rules help organizations protect their systems.

## What You Will Find

The [scripts folder](./scripts) contains one PowerShell script for each STIG requirement. Each script explains its purpose, applies the required registry setting, and reads the value back to check it.

| STIG ID | What the Script Does |
| --- | --- |
| [WN11-AU-000500](./scripts/WN11-AU-000500.ps1) | Sets the Application event log size to 32 MB. |
| [WN11-CC-000005](./scripts/WN11-CC-000005.ps1) | Disables camera access from the lock screen. |
| [WN11-CC-000010](./scripts/WN11-CC-000010.ps1) | Disables lock screen slideshows. |
| [WN11-CC-000100](./scripts/WN11-CC-000100.ps1) | Blocks printer driver downloads over HTTP. |
| [WN11-CC-000105](./scripts/WN11-CC-000105.ps1) | Stops web publishing and online ordering wizards from downloading provider lists. |
| [WN11-CC-000110](./scripts/WN11-CC-000110.ps1) | Blocks printing over HTTP. |
| [WN11-CC-000180](./scripts/WN11-CC-000180.ps1) | Disables AutoPlay for non-volume devices, such as phones using Media Transfer Protocol. |
| [WN11-CC-000185](./scripts/WN11-CC-000185.ps1) | Prevents AutoRun commands from running. |
| [WN11-CC-000252](./scripts/WN11-CC-000252.ps1) | Disables Windows Game Recording and Broadcasting. |
| [WN11-CC-000326](./scripts/WN11-CC-000326.ps1) | Enables PowerShell script block logging. |

## How I Tested the Fixes

1. Found a failed requirement in Tenable.
2. Applied the setting manually and scanned again.
3. Removed the setting and checked that the scan showed Failed.
4. Applied the fix with PowerShell.
5. Scanned again to confirm the requirement showed Passed.

Each of the 10 selected checks showed **Passed** after its PowerShell fix.

## Tools Used

- Microsoft Azure and Windows 11
- PowerShell 5.1
- Windows Registry Editor
- Tenable Vulnerability Management

## Running a Script

Open PowerShell as Administrator. From the downloaded repository folder, run the script you need. For example:

```powershell
.\scripts\WN11-CC-000180.ps1
```

The script prints the saved registry value. The comments explain the expected result. A Tenable scan provides a separate check of the setting.

## Author and Credits

**Author:** Maxim Bondarchuk  
**Script template credit:** Josh Madakor

This project was completed as part of my cybersecurity lab training.
