# WN10-CC-000145 — Users Must Be Prompted for a Password on Resume from Sleep (On Battery)

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000145`, which requires that **users be prompted for a password when resuming from sleep while on battery power** to ensure session security.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000145  
- **SRG**: SRG-OS-000373-GPOS-00156  
- **Category**: Power Management / Sleep Settings  
- **Requirement**: Require password on resume from sleep (on battery)  
- **Severity**: Medium  
- **CCI**: CCI-002038  
- **Vuln ID**: V-220821  
- **Rationale**: If a device wakes from sleep without requiring authentication, unauthorized users may gain access. Enabling this setting ensures the session is locked while on battery power until the user reauthenticates.

---

## 🔁 Reproducing the Vulnerability

To simulate the vulnerability, set the registry value `DCSettingIndex` to `0` or delete it. This will disable the password prompt on resume while on battery.

---

## 🧾 Verifying the Setting in Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → System → Power Management → Sleep Settings`  
3. Double-click on **Require a password when a computer wakes (on battery)**, and set it to **Enabled**.

---

## 🛠️ Manual Registry Remediation

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51`  
- **Value Name**: `DCSettingIndex`  
- **Value Type**: `REG_DWORD`  
- **Value**:
  - `1` = ✅ Compliant (Password prompt required)
  - `0` or missing = ❌ Non-compliant (No password prompt on resume)

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.

