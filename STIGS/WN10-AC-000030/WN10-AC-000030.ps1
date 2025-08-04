<#
.SYNOPSIS
This PowerShell script sets the Minimum Password Age to at least 1 day to comply with DISA STIG requirements and prevent password history cycling.
    
    IMPORTANT: SCRIPT MUST BE RAN WITH ELEVATED PRIVILEGES

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-04
    Last Modified   : 2028-08-04
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
    PS C:\> STIG-ID-WN10-AC-000030.ps1 
#>

# Set the Minimum Password Age to 1 day
secedit /export /cfg "$env:TEMP\secpol.cfg"

(Get-Content "$env:TEMP\secpol.cfg") |
    ForEach-Object {
        if ($_ -match "^MinimumPasswordAge") {
            "MinimumPasswordAge = 1"
        } else {
            $_
        }
    } | Set-Content "$env:TEMP\secpol.cfg"

secedit /configure /db secedit.sdb /cfg "$env:TEMP\secpol.cfg" /areas SECURITYPOLICY

# Cleanup
Remove-Item "$env:TEMP\secpol.cfg" -Force

Write-Output "Minimum Password Age has been set to 1 day as per DISA STIG."
