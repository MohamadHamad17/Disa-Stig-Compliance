<#
.SYNOPSIS
    This Powershell script ensures Windows 10 systems must use a BitLocker PIN with a minimum length of six digits for pre-boot authentication.
    
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
    STIG-ID         : WN10-00-000032

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-00-000032.ps1 
#>


# Requires Administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole('Administrators')) {
    Write-Warning "Run PowerShell as Administrator."
    exit 1
}

$regPath      = 'HKLM:\SOFTWARE\Policies\Microsoft\FVE'
$valueName    = 'MinimumPIN'
$desiredValue = 7

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Created registry path: $regPath"
}

# Retrieve current value (if any)
$currentValue = (Get-ItemProperty -Path $regPath -Name $valueName -ErrorAction SilentlyContinue).$valueName

if ($null -eq $currentValue) {
    Write-Host "Value '$valueName' not found. Setting to $desiredValue ..."
    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
}
elseif ($currentValue -lt $desiredValue) {
    Write-Host "Current value ($currentValue) is less than $desiredValue. Updating ..."
    Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord
}
else {
    Write-Host "Current value ($currentValue) meets or exceeds requirement; no change needed."
}

# Display final value for confirmation
$finalValue = (Get-ItemProperty -Path $regPath -Name $valueName).$valueName
Write-Host "MinimumPIN is now set to $finalValue."

