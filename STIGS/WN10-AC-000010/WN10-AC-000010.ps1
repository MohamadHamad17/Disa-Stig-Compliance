<#
.SYNOPSIS
    This PowerShell script configures Windows account lockout settings to meet security requirements.
    
    IMPORTANT: SCRIPT MUST BE RAN WITH ELEVATED PRIVILEGES

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-05
    Last Modified   : 2025-08-05
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-AC-000010.ps1 
#>

secedit /export /cfg "$env:TEMP\secpol.cfg"

(Get-Content "$env:TEMP\secpol.cfg") |
    ForEach-Object {
        if ($_ -match "^LockoutBadCount") {
            "LockoutBadCount = 3"
        }
        elseif ($_ -match "^LockoutDuration") {
            "LockoutDuration = 15"
        }
        elseif ($_ -match "^ResetLockoutCount") {
            "ResetLockoutCount = 15"
        }
        else {
            $_
        }
    } | Set-Content "$env:TEMP\secpol.cfg"

secedit /configure /db secedit.sdb /cfg "$env:TEMP\secpol.cfg" /areas SECURITYPOLICY

# Cleanup
Remove-Item "$env:TEMP\secpol.cfg" -Force

Write-Host "✅ Account Lockout Threshold set to 3. Duration and Reset Counter set to 15 minutes."

