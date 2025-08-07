# WN10-CC-000110 — Printing Over HTTP Must Be Prevented

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000110`, which requires that **printing over HTTP** be disabled to reduce the risk of sensitive data being sent over untrusted networks or to external printers.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000110  
- **SRG**: SRG-OS-000095-GPOS-00049  
- **Category**: Internet Communication Management  
- **Requirement**: Printing over HTTP must be prevented  
- **Severity**: Medium  
- **CCI**: CCI-000381  
- **Vuln ID**: V-220817  
- **Rationale**: Some system features may communicate with external services, downloading components or sending system data. Disabling printing over HTTP prevents such interactions, ensuring that print operations occur only within controlled, internal environments.

---

## 🔁 Reproducing the Vulnerability

To simulate this vulnerability, the registry value `DisableHTTPPrinting` is either deleted or set to `0`, allowing printing over HTTP.

---

## 🧾 Verifying the Setting in Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → System → Internet Communication Management → Internet Communication Settings`  
3. Double-click on **Turn off printing over HTTP**, and set it to **Enabled**.

---

## 🛠️ Manual Registry Remediation

This setting can also be applied directly using the Windows Registry:

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Policies\Microsoft\Windows NT\Printers`  
- **Value Name**: `DisableHTTPPrinting`  
- **Value Type**: `REG_DWORD`  
- **Value**: `1`  
  - `1` = ✅ Compliant (HTTP printing disabled)  
  - `0` or missing = ❌ Non-compliant (HTTP printing allowed)

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.
