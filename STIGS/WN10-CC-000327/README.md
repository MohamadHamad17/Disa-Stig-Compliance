# WN10-CC-000327 — PowerShell Transcription Must Be Enabled on Windows 10

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000327`, which requires that **PowerShell Transcription** is enabled to capture a detailed log of PowerShell activity for security auditing.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000327  
- **SRG**: SRG-OS-000041-GPOS-00019  
- **Category**: Audit Logging  
- **Requirement**: PowerShell Transcription must be enabled  
- **Severity**: Medium  
- **CCI**: CCI-000132, CCI-000134  
- **Vuln ID**: V-252896  
- **Rationale**: PowerShell is a powerful tool that can be used by administrators — or abused by attackers. Enabling transcription creates a log of all executed commands and script output, aiding incident response and forensic investigations.

---

## 🔁 Reproducing the Vulnerability

To simulate the vulnerability, ensure the registry value `EnableTranscripting` is missing or set to `0`. This disables PowerShell transcription.

---

## 🧾 Verifying the Setting in Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → Windows Components → Windows PowerShell`  
3. Double-click on **Turn on PowerShell Transcription**, and set it to **Enabled**.  
4. Specify an output directory (preferably a secure or central log server location).

---

## 🛠️ Manual Registry Remediation

- **Registry Hive**: `HKEY_LOCAL_MACHINE`  
- **Registry Path**: `SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription`  
- **Value Name**: `EnableTranscripting`  
- **Value Type**: `REG_DWORD`  
- **Value**:
  - `1` = ✅ Compliant (transcription is enabled)
  - `0` or missing = ❌ Non-compliant (transcription is disabled)

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.
