<#
.SYNOPSIS
    This PowerShell script configures the minimum password length policy to 14 characters 

     Ensure the script is being run with administrative privileges

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-05
    Last Modified   : 2028-08-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-AC-000035.ps1 
#>

# Ensure the script is being run with administrative privileges
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease run PowerShell as Administrator."
    Exit 1
}

try {
    Write-Output "Applying STIG ID WN10-AC-000035: Setting Minimum Password Length to 14..."

    # Set the minimum password length to 14
    secedit /export /cfg "$env:temp\secpol.cfg"
    (Get-Content "$env:temp\secpol.cfg") -replace "MinimumPasswordLength = \d+", "MinimumPasswordLength = 14" |
        Set-Content "$env:temp\secpol_updated.cfg"
    secedit /configure /db secedit.sdb /cfg "$env:temp\secpol_updated.cfg" /quiet

    Write-Output "Minimum password length successfully configured to 14 characters."
}
catch {
    Write-Error "An error occurred: $_"
}
