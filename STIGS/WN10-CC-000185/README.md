# WN10-CC-000185 — The Default Autorun Behavior Must Be Configured to Prevent Autorun Commands

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000185`, which ensures **autorun commands are blocked** to prevent automatic execution of potentially malicious code.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000185  
- **SRG**: SRG-OS-000368-GPOS-00154  
- **Category**: Device Control / AutoPlay  
- **Requirement**: Prevent autorun commands from executing  
- **Severity**: High  
- **CCI**: CCI-001764  
- **Vuln ID**: V-220828  
- **Rationale**: Autorun can be exploited by attackers to automatically execute malware when removable media is inserted. Disabling this feature reduces the risk of infections from USB drives, CDs, or network shares.

---

## 🔁 Reproducing the Vulnerability

To simulate the vulnerability, set the registry value `NoAutorun` to `0` or delete it. This allows autorun commands to execute.

---

## 🧾 Verifying the Setting in Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → Windows Components → AutoPlay Policies`  
3. Double-click on **Set the default behavior for AutoRun**, and set it to:  
   **Enabled: Do not execute any autorun commands**

---

## 🛠️ Manual Registry Remediation

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer`  
- **Value Name**: `NoAutorun`  
- **Value Type**: `REG_DWORD`  
- **Value**:
  - `1` = ✅ Compliant (autorun is disabled)  
  - `0` or missing = ❌ Non-compliant (autorun is allowed)

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.
