<#
.SYNOPSIS
    This PowerShell script Prevents Printing over HTTP.
    
    IMPORTANT: SCRIPT MUST BE RAN WITH ELEVATED PRIVILEGES

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-06
    Last Modified   : 2028-08-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000110

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-CC-000110.ps1 
#>

# Ensure administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You must run this script as Administrator."
    exit 1
}

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$valueName = "DisableHTTPPrinting"

try {
    # Create registry path if it doesn't exist
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the value to disable HTTP printing
    Set-ItemProperty -Path $regPath -Name $valueName -Value 1

    Write-Output "HTTP printing has been disabled successfully. (DisableHTTPPrinting = 1)"
} catch {
    Write-Error "Failed to apply the setting: $_"
}
