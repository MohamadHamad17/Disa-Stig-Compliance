# Ensure admin privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator."
    exit 1
}

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"
$valueName = "LetAppsActivateWithVoiceAboveLock"

try {
    # Create registry path if it doesn't exist
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set value to 2 = Force Deny
    Set-ItemProperty -Path $regPath -Name $valueName -Value 2

    Write-Output "Voice activation above the lock screen has been disabled (LetAppsActivateWithVoiceAboveLock = 2)."
} catch {
    Write-Error "Failed to apply the setting: $_"
}
