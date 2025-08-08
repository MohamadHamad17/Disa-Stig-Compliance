<#
.SYNOPSIS
    This PowerShell script enables PowerShell Transcription to log command and script activity for auditing.

.NOTES
    Author          : Mohamad Hamad
    LinkedIn        : linkedin.com/in/mohamad-hamad-428a15318/
    GitHub          : github.com/MohamadHamad17
    Date Created    : 2025-08-07
    Last Modified   : 2028-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000327

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> STIG-ID-WN10-CC-000327.ps1 
#>

# Confirm Admin privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator."
    exit 1
}

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$enableValue = "EnableTranscripting"
$outputDirValue = "OutputDirectory"

# Recommended transcript log path (customize if needed)
$logDir = "C:\Transcripts"

try {
    # Ensure directory exists
    if (-not (Test-Path $logDir)) {
        New-Item -Path $logDir -ItemType Directory -Force | Out-Null
    }

    # Create registry path if missing
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Enable transcription
    Set-ItemProperty -Path $regPath -Name $enableValue -Value 1

    # Set transcript output directory
    Set-ItemProperty -Path $regPath -Name $outputDirValue -Value $logDir

    Write-Output "PowerShell Transcription has been enabled."
    Write-Output "Logs will be saved to: $logDir"
} catch {
    Write-Error "Failed to apply the setting: $_"
}
