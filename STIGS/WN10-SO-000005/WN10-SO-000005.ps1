# Ensure administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Please run this script as Administrator."
    exit 1
}

try {
    # Disable the built-in Administrator account
    Disable-LocalUser -Name "Administrator"
    Write-Output "The built-in Administrator account has been disabled."
} catch {
    Write-Error "Failed to disable the Administrator account: $_"
}

