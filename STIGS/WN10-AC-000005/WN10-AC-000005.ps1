<#
.SYNOPSIS
    Remediates STIG ID WN10-AC-000005 by configuring Account Lockout Policy:
    - Sets Account lockout duration to 15 minutes (or greater).
    - Sets Account lockout threshold to 5 invalid attempts.
    - Sets Reset account lockout counter after 15 minutes.

.DESCRIPTION
    Uses `secedit` to securely apply local security policy changes.
    Ensures compliance with STIG WN10-AC-000005, which requires that locked accounts remain inaccessible for at least 15 minutes.

.NOTES
    Author          : Mohamad Hamad
    Date Created    : 2025-08-04
    Version         : 1.0
    STIG ID         : WN10-AC-000005
    Remediation Type: Local Security Policy (secedit)
    Platform        : Windows 10 / 11
    PowerShell Ver. : 5.1+

.EXAMPLE
    PS C:\> .\WN10-AC-000005.ps1
    Applies Account Lockout Policy settings and forces Group Policy update.
#>

# Ensure script is run as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole('Administrators')) {
    Write-Warning "This script must be run as Administrator."
    exit 1
}

# Define paths
$backupPath = "$env:SystemDrive\SecurityPolicyBackup.inf"
$tempPolicyPath = "$env:SystemDrive\Temp_AccountLockoutPolicy.inf"
$dbPath = "$env:SystemRoot\Security\Database\SecEdit.sdb"

# Backup current policy
Write-Host "Backing up current security policy to: $backupPath"
secedit /export /cfg $backupPath /quiet

# Define compliant policy settings
$policyContent = @"
[System Access]
LockoutBadCount = 5
LockoutDuration = 15
ResetLockoutCount = 15
"@

# Write new policy to temp file
$policyContent | Out-File -Encoding ASCII -FilePath $tempPolicyPath -Force
Write-Host "Temporary policy written to: $tempPolicyPath"

# Apply the updated policy
Write-Host "Applying Account Lockout Policy settings..."
secedit /configure /db $dbPath /cfg $tempPolicyPath /quiet

# Clean up temporary file
Remove-Item $tempPolicyPath -Force
Write-Host "Removed temporary file: $tempPolicyPath"

# Force Group Policy update
Write-Host "Running gpupdate to apply settings..."
Start-Process -FilePath "cmd.exe" -ArgumentList "/c gpupdate /force" -Verb RunAs -WindowStyle Hidden

Write-Host "STIG WN10-AC-000005 remediation complete. Account Lockout Policy is now compliant."

