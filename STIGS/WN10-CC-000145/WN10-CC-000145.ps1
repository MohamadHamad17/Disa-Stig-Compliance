# Check for admin privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator."
    exit 1
}

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$valueName = "DCSettingIndex"

try {
    # Create registry path if missing
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the value to require password on resume (on battery)
    Set-ItemProperty -Path $regPath -Name $valueName -Value 1

    Write-Output "Password prompt on resume from sleep (battery) has been enabled. (DCSettingIndex = 1)"
} catch {
    Write-Error "Failed to apply the setting: $_"
}
