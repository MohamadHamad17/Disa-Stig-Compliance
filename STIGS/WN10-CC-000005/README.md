# WN10-CC-000005 — Camera Access from Lock Screen Must Be Disabled

This documentation outlines the identification, remediation, and validation of STIG ID `WN10-CC-000005`, which requires **disabling camera access from the lock screen** to prevent unauthorized use and enhance physical security controls.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000005  
- **SRG**: SRG-OS-000095-GPOS-00049  
- **Category**: Lock Screen Settings  
- **Requirement**: Prevent enabling the lock screen camera  
- **Severity**: Medium  
- **CCI**: CCI-000381  
- **Vuln ID**: V-220792  
- **Rationale**: Allowing camera access from the lock screen increases the risk of unauthorized use. Restricting access ensures only authenticated users can interact with hardware peripherals like the camera.

---

## 🔁 Reproducing the Vulnerability

To simulate the vulnerability, the `NoLockScreenCamera` registry value can be deleted or set to `0`, which enables camera access from the lock screen.

---

## 🧾 Viewing the Setting in Local Group Policy

To manually verify or configure this setting:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → Control Panel → Personalization`  
3. Double-click on **Prevent enabling lock screen camera**, and set it to **Enabled**.

---

## 🛠️ Manual Registry Remediation

You can apply the setting directly through the Windows registry:

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Policies\Microsoft\Windows\Personalization`  
- **Value Name**: `NoLockScreenCamera`  
- **Type**: `REG_DWORD`  
- **Value**: `1` (Disabled)

If this value is missing or set to `0`, it is considered **non-compliant**.

---

✅ Successfully remediated during system hardening exercises.  
_Taking control of physical access starts at the lock screen._

Please find the remediation script for this setting inside the appropriate folder in this repository.
