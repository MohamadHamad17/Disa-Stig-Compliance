

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

