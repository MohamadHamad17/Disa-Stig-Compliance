<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

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
    PS C:\> STIG-ID-WN10-AU-000500.ps1 
#>

# Remediation Script for STIG: Set MaxSize for Application Event Log

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$desiredValue = 32768  # Decimal equivalent of 0x00008000

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize value
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord

# Confirm remediation
$currentValue = Get-ItemProperty -Path $regPath -Name $valueName | Select-Object -ExpandProperty $valueName
if ($currentValue -ge $desiredValue) {
    Write-Output "Remediation successful. MaxSize is set to $currentValue KB."
} else {
    Write-Output "Remediation failed. Current MaxSize: $currentValue KB."
}
