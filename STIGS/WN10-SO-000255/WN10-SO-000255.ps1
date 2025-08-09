# Create the key (no error if it already exists)
New-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Force | Out-Null

# Set ConsentPromptBehaviorUser = 0 (DWORD)
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
  -Name 'ConsentPromptBehaviorUser' -Type DWord -Value 0

# (Optional) refresh local policy; domain GPOs can still override this
gpupdate /target:computer /force

# Verify
(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' `
  -Name 'ConsentPromptBehaviorUser').ConsentPromptBehaviorUser
