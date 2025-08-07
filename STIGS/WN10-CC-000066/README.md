# WN10-CC-000066 — Command Line Data Must Be Included in Process Creation Events

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000066`, which requires that the **command line data** be included in **process creation audit events** to enhance audit trail completeness and support forensic investigations.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000066  
- **SRG**: SRG-OS-000042-GPOS-00020  
- **Category**: Audit Policy  
- **Requirement**: Command line data must be included in process creation events  
- **Severity**: Medium  
- **CCI**: CCI-000135  
- **Vuln ID**: V-220809  
- **Rationale**: Including command-line arguments in process creation events allows system administrators and security analysts to reconstruct events more accurately, detect suspicious behavior, and identify malware executions more effectively.

---

## 🔁 Reproducing the Vulnerability

To simulate this vulnerability, the registry value `ProcessCreationIncludeCmdLine_Enabled` was either removed or set to `0`, disabling the recording of command-line data in process creation audit logs.

---

## 🧾 Viewing the Setting in Local Group Policy

To verify or manually adjust the setting:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → System → Audit Process Creation`  
3. Double-click on **Include command line in process creation events**, and set the value to **Enabled**.

---

## 🛠️ Manual Remediation Demonstration

You can also validate or configure this setting directly in the registry:

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit`  
- **Value Name**: `ProcessCreationIncludeCmdLine_Enabled`  
- **Type**: `REG_DWORD`  
- **Value**: `1` (Enabled)

If this value is missing or set to `0`, it is considered **non-compliant**.

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.

