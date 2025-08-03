<#
.SYNOPSIS
    This script checks if the built-in Guest account exists and disables it if it's enabled to comply with STIG WN10-SO-000010

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-03
    Last Modified   : 2028-08-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-SO-000010.ps1 
#>

# Remediation Script for STIG ID: WN10-SO-000010
# Description: Disables the built-in Guest account

# Check if the Guest account exists
$guest = Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue

if ($guest) {
    if ($guest.Enabled) {
        Disable-LocalUser -Name "Guest"
        Write-Output "Guest account has been disabled."
    } else {
        Write-Output "Guest account is already disabled."
    }
} else {
    Write-Output "Guest account not found on this system."
}
