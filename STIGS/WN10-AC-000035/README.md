# WN10-AC-000035 — The Minimum Password Length Must Be Configured to 14 Characters

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-AC-000035`, which requires that the **minimum password length** be configured to **14 characters or greater** to enhance password strength and protect system access.

---

## 📋 STIG Overview

- **STIG ID**: WN10-AC-000035  
- **SRG**: SRG-OS-000078-GPOS-00046  
- **Category**: Password Policy  
- **Requirement**: Minimum password length must be configured to at least 14 characters  
- **Severity**: Medium  
- **CCI**: CCI-004066, CCI-000205  
- **Vuln ID**: V-220745  
- **Rationale**: Weak or short passwords are easily compromised using brute-force or dictionary attacks. Enforcing a longer password length increases the time and complexity required to crack credentials.

---

## 🔁 Reproducing the Vulnerability

To simulate this vulnerability, the **minimum password length** was set to a value below 14 characters using the Local Group Policy Editor.

---

## 🧾 Viewing the Setting in Local Group Policy

To verify or manually adjust the setting:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Local Computer Policy → Computer Configuration → Windows Settings → Security Settings → Account Policies → Password Policy`  
3. Double-click on **Minimum password length** and set the value to **14** or greater.

---

## 🛠️ Manual Remediation Demonstration


Update the **Minimum password length** setting to **14 characters** to meet security requirements and protect against unauthorized access.


✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.

