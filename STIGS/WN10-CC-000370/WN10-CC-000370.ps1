# WN10-CC-000370: Disable convenience PIN sign-in (AllowDomainPINLogon = 0)
# Run as Administrator

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$name    = "AllowDomainPINLogon"

# Create key (if missing) and set value to 0 (Disabled)
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name $name -Value 0 -Type DWord -Force

# Apply policy and quick verify
gpupdate /target:computer /force | Out-Null
if ((Get-ItemProperty -Path $regPath -Name $name).$name -eq 0) {
  Write-Host "Convenience PIN sign-in is disabled."
} else {
  Write-Warning "Failed to disable convenience PIN sign-in (value not 0)."
}
