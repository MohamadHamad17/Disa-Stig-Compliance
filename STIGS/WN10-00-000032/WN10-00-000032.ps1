<#
.SYNOPSIS
    Ensures that BitLocker is configured to require a startup PIN of **at least six characters** (STIG ID WN10-00-000032).

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : https://linkedin.com/in/mohamad-hamad-428a15318
    GitHub          : https://github.com/MohamadHamad17
    Date Created    : 2025-08-04
    Last Modified   : 2025-08-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000032

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Example:
    PS C:\> .\WN10-00-000032.ps1
#>

# PowerShell Script to enforce Group Policy equivalent of:
# "Configure minimum PIN length for startup" for BitLocker

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$valueName = "MinimumPIN"
$desiredValue = 6

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set or update the MinimumPIN value
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord

# Confirm the value was set
$current = Get-ItemProperty -Path $regPath -Name $valueName | Select-Object -ExpandProperty $valueName
if ($current -ge $desiredValue) {
    Write-Host "✅ BitLocker Minimum PIN Length successfully set to $current digits." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to set BitLocker Minimum PIN Length. Current value: $current" -ForegroundColor Red
}

# Run gpupdate to enforce the change immediately
Write-Host "🔄 Running gpupdate /force to apply the policy..." -ForegroundColor Yellow
Start-Process -FilePath "cmd.exe" -ArgumentList "/c gpupdate /force" -Verb RunAs -WindowStyle Hidden
