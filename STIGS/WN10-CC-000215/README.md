# WN10-CC-000215 — Explorer Data Execution Prevention Must Be Enabled

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000215`, which ensures that **Data Execution Prevention (DEP)** remains enabled for **File Explorer** to protect against malicious memory-based attacks.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000215  
- **SRG**: SRG-OS-000433-GPOS-00192  
- **Category**: Memory Protection  
- **Requirement**: Explorer Data Execution Prevention must be enabled  
- **Severity**: Medium  
- **CCI**: CCI-002824  
- **Vuln ID**: V-220837  
- **Rationale**: DEP helps block malicious code execution by checking memory locations. This setting prevents DEP from being turned off for File Explorer, enhancing system security.

---

## 🔁 Reproducing the Vulnerability

To simulate non-compliance, set the registry value `NoDataExecutionPrevention` to `1`, which disables DEP for File Explorer.

---

## 🧾 Verifying the Setting in Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → Windows Components → File Explorer`  
3. Double-click on **Turn off Data Execution Prevention for Explorer**, and ensure it is set to **Not Configured** or **Disabled**.

---

## 🛠️ Manual Registry Remediation

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Policies\Microsoft\Windows\Explorer`  
- **Value Name**: `NoDataExecutionPrevention`  
- **Value Type**: `REG_DWORD`  
- **Compliant Values**:
  - `0` = ✅ Compliant (DEP is ON for Explorer)  
  - *(Value missing)* = ✅ Compliant (Default behavior)  
  - `1` = ❌ Non-compliant (DEP is OFF for Explorer)

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.
