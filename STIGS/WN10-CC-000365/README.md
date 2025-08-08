# WN10-CC-000365 — Prevent Windows Apps from Being Activated by Voice While the System Is Locked

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000365`, which ensures that **Windows apps cannot be voice-activated from the lock screen**, reducing the risk of unauthorized access.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000365  
- **SRG**: SRG-OS-000028-GPOS-00009  
- **Category**: App Privacy  
- **Requirement**: Prevent voice activation of Windows apps while system is locked  
- **Severity**: Medium  
- **CCI**: CCI-000056  
- **Vuln ID**: V-220869  
- **Rationale**: Allowing apps to activate via voice while the system is locked may enable unauthorized access or interaction. Disabling this functionality ensures apps can only be accessed by authenticated users.

---

## 🔁 Reproducing the Vulnerability

To simulate non-compliance:
- Set the registry value `LetAppsActivateWithVoiceAboveLock` to `1` or delete it.
- Or, leave `LetAppsActivateWithVoice` unset and allow voice activation from the lock screen.

---

## 🧾 Verifying the Setting in Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → Windows Components → App Privacy`  
3. Double-click on:
   - **Let Windows apps activate with voice while the system is locked**, and set it to **Enabled**  
     - Set "Default for all Apps:" to **Force Deny**  
4. Alternatively, if you configure:  
   - **Let Windows apps activate with voice** → **Enabled**  
     - Set "Default for all Apps:" to **Force Deny**  
     ➤ Then this STIG becomes **Not Applicable (NA)**.

---

## 🛠️ Manual Registry Remediation

### Primary Compliant Setting:

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Policies\Microsoft\Windows\AppPrivacy`  
- **Value Name**: `LetAppsActivateWithVoiceAboveLock`  
- **Value Type**: `REG_DWORD`  
- **Value**:
  - `2` = ✅ Compliant (Force Deny activation above lock screen)
  - `0` or `1` or missing = ❌ Non-compliant

### Alternative (Makes STIG NA):

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Policies\Microsoft\Windows\AppPrivacy`  
- **Value Name**: `LetAppsActivateWithVoice`  
- **Value Type**: `REG_DWORD`  
- **Value**:
  - `2` = ✅ Requirement becomes Not Applicable (Force Deny globally)

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.

