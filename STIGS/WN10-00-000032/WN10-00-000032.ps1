# PowerShell Script to enforce Group Policy equivalent of:
# "Configure minimum PIN length for startup" for BitLocker

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$valueName = "MinimumPIN"
$desiredValue = 6

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set or update the MinimumPIN value
Set-ItemProperty -Path $regPath -Name $valueName -Value $desiredValue -Type DWord

# Confirm the value was set
$current = Get-ItemProperty -Path $regPath -Name $valueName | Select-Object -ExpandProperty $valueName
if ($current -ge $desiredValue) {
    Write-Host "✅ BitLocker Minimum PIN Length successfully set to $current digits." -ForegroundColor Green
} else {
    Write-Host "❌ Failed to set BitLocker Minimum PIN Length. Current value: $current" -ForegroundColor Red
}

# Run gpupdate to enforce the change immediately
Write-Host "🔄 Running gpupdate /force to apply the policy..." -ForegroundColor Yellow
Start-Process -FilePath "cmd.exe" -ArgumentList "/c gpupdate /force" -Verb RunAs -WindowStyle Hidden
