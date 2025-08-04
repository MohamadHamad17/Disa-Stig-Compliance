<#
.SYNOPSIS
    Remediates the DISA STIG finding by setting the "Minimum Password Age" to 1 day.
.DESCRIPTION
    Prevents users from cycling through password history by requiring a 1-day minimum before password changes.
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
