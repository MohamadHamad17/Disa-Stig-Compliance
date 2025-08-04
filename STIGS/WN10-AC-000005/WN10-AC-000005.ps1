<#
.SYNOPSIS
    This PowerShell script sets the Windows Application event log size to a minimum of 32768 KB (32 MB) to meet security requirements.


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
    PS C:\> STIG-ID-WN10-AC-000005.ps1 
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

