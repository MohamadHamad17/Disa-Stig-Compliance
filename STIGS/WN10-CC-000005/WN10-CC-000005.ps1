<#
.SYNOPSIS
    This script disables camera access from the lock screen to prevent unauthorized use before login.

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-07
    Last Modified   : 2028-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-CC-000005 .ps1 
#>


# Ensure the registry path exists
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value to disable lock screen camera access
New-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Output "Camera access from the lock screen has been disabled (NoLockScreenCamera = 1)."
