# Ensure the registry path exists
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value to disable lock screen camera access
New-ItemProperty -Path $regPath -Name "NoLockScreenCamera" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Output "Camera access from the lock screen has been disabled (NoLockScreenCamera = 1)."
