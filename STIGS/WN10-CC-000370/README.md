# WN10-CC-000370 — The Convenience PIN for Windows 10 Must Be Disabled

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-CC-000370`, which requires that the **convenience PIN sign-in** feature be disabled for domain users. Disabling this feature prevents the use of PINs for domain logons, reducing the risk of password stuffing and unauthorized access.

---

## 📋 STIG Overview

- **STIG ID**: WN10-CC-000370  
- **SRG**: SRG-OS-000095-GPOS-00049  
- **Category**: Logon Policy  
- **Requirement**: Convenience PIN for domain users must be disabled  
- **Severity**: Medium  
- **CCI**: CCI-000381  
- **Vuln ID**: V-220870  
- **Rationale**: Prevents the use of weaker authentication (PINs) for domain logons, which could be exploited using password stuffing or brute-force attacks.

---

## 🔁 Reproducing the Vulnerability

To simulate this vulnerability, enable the **Turn on convenience PIN sign-in** policy or set the registry value `AllowDomainPINLogon` to `1` or delete it entirely.

---

## 🧾 Viewing the Setting in Local Group Policy

To verify or manually adjust the setting:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → System → Logon`  
3. Double-click on **Turn on convenience PIN sign-in**.  
4. Ensure it is set to **Disabled**.

---

## 🛠️ Manual Remediation Demonstration

### **Group Policy Method**
1. Open the **Local Group Policy Editor** (`gpedit.msc`).  
2. Navigate to:  
   `Computer Configuration → Administrative Templates → System → Logon`  
3. Set **Turn on convenience PIN sign-in** to **Disabled**.  
4. Apply changes and run:  
   ```powershell
   gpupdate /force
