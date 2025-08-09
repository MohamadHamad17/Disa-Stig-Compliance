<#
.SYNOPSIS
    This script ensures that User Account Control (UAC) is configured to automatically deny elevation requests for standard users, as required by STIG ID WN10-SO-000255.

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-08
    Last Modified   : 2028-08-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000255

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-SO-000255.ps1 
#>

# Create the key (no error if it already exists)
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null

# Set ConsentPromptBehaviorUser = 0 (DWORD)
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
  -Name 'ConsentPromptBehaviorUser' -Type DWord -Value 0

# (Optional) refresh local policy; domain GPOs can still override this
gpupdate /target:computer /force

# Verify
(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
  -Name 'ConsentPromptBehaviorUser').ConsentPromptBehaviorUser
