<#
.SYNOPSIS
    This PowerShell script disables the built-in Administrator account to reduce unauthorized access risk.

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-07
    Last Modified   : 2028-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-SO-000005.ps1 
#>

# Ensure administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator."
    exit 1
}

try {
    # Disable the built-in Administrator account
    Disable-LocalUser -Name "Administrator"
    Write-Output "The built-in Administrator account has been disabled."
} catch {
    Write-Error "Failed to disable the Administrator account: $_"
}

