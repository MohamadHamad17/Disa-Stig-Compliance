# Confirm Administrator privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "❌ Please run this script as Administrator."
    exit 1
}

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
$valueName = "NoDataExecutionPrevention"

try {
    # If the key exists and is set to 1 (non-compliant), set it to 0
    if (Test-Path $regPath) {
        $currentValue = Get-ItemPropertyValue -Path $regPath -Name $valueName -ErrorAction SilentlyContinue
        if ($currentValue -eq 1) {
            Set-ItemProperty -Path $regPath -Name $valueName -Value 0
            Write-Output "✅ Set NoDataExecutionPrevention to 0 (DEP is enabled for Explorer)."
        } else {
            Write-Output "✅ Already compliant (NoDataExecutionPrevention is 0 or not set)."
        }
    } else {
        Write-Output "✅ Registry path does not exist — system defaults to compliant behavior (DEP enabled)."
    }
} catch {
    Write-Error "❌ Failed to update the registry: $_"
}
