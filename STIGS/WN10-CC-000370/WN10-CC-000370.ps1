<#
.SYNOPSIS
    This script disables convenience PIN sign-in to prevent domain users from using a PIN to log in.

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-08
    Last Modified   : 2028-08-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-CC-000370.ps1 
#>

# WN10-CC-000370: Disable convenience PIN sign-in (AllowDomainPINLogon = 0)
# Run as Administrator

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$name    = "AllowDomainPINLogon"

# Create key (if missing) and set value to 0 (Disabled)
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name $name -Value 0 -Type DWord -Force

# Apply policy and quick verify
gpupdate /target:computer /force | Out-Null
if ((Get-ItemProperty -Path $regPath -Name $name).$name -eq 0) {
  Write-Host "Convenience PIN sign-in is disabled."
} else {
  Write-Warning "Failed to disable convenience PIN sign-in (value not 0)."
}
