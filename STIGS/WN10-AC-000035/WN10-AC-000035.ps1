
# Ensure the script is being run with administrative privileges
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script!`nPlease run PowerShell as Administrator."
    Exit 1
}

try {
    Write-Output "Applying STIG ID WN10-AC-000035: Setting Minimum Password Length to 14..."

    # Set the minimum password length to 14
    secedit /export /cfg "$env:temp\secpol.cfg"
    (Get-Content "$env:temp\secpol.cfg") -replace "MinimumPasswordLength = \d+", "MinimumPasswordLength = 14" |
        Set-Content "$env:temp\secpol_updated.cfg"
    secedit /configure /db secedit.sdb /cfg "$env:temp\secpol_updated.cfg" /quiet

    Write-Output "✅ Minimum password length successfully configured to 14 characters."
}
catch {
    Write-Error "❌ An error occurred: $_"
}
