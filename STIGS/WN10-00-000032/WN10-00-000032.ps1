<#
.SYNOPSIS
    Ensures the registry value “MinimumPIN” (REG_DWORD) under
    HKLM:\SOFTWARE\Policies\Microsoft\FVE is set to 6 or greater,
    as required by STIG ID WN10-00-000032.

.DESCRIPTION
    - Creates the key if it does not exist.
    - Reads the current value.
    - If the value is missing or less than 6, sets it to 6.
    - Logs the action to the console.

.NOTES
    Author      : Mohamad Hamad
    Date        : 2025-08-04
    Version     : 1.0
    STIG-ID     : WN10-00-000032
    Registry Key: HKLM\SOFTWARE\Policies\Microsoft\FVE
    Value Name  : MinimumPIN (REG_DWORD)

.EXAMPLE
    PS C:\> .\Set-MinimumPIN.ps1
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

