# Confirm administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You must run this script as Administrator."
    exit 1
}

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
$valueName = "ProcessCreationIncludeCmdLine_Enabled"

try {
    # Create registry path if it doesn't exist
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }

    # Set the required value
    Set-ItemProperty -Path $regPath -Name $valueName -Value 1

    Write-Output "✅ 'Include command line in process creation events' has been enabled (Value = 1)."
} catch {
    Write-Error "❌ Failed to apply the setting: $_"
}
