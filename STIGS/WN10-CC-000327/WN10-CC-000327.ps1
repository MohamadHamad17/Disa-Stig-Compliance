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

