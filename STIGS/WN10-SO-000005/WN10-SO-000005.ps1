<#
.SYNOPSIS
    This PowerShell script disables the built-in Administrator account to reduce unauthorized access risk.

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-07
    Last Modified   : 2028-08-07
    Version         : 1.1
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as Administrator.
    Example:
    PS C:\> .\STIG-ID-WN10-SO-000005.ps1
#>

# Ensure administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator."
    exit 1
}

# Find the built-in Administrator account (SID ending in -500)
$adminUser = Get-LocalUser | Where-Object { $_.SID.Value -like '*-500' }

if ($adminUser) {
    try {
        Disable-LocalUser -Name $adminUser.Name
        Write-Output "Built-in Administrator account '$($adminUser.Name)' has been disabled."
    } catch {
        Write-Error "Failed to disable account '$($adminUser.Name)': $_"
    }
} else {
    Write-Warning "Could not find the built-in Administrator account (SID -500)."
}

