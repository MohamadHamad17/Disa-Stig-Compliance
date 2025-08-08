# WN10-SO-000005 — The Built-In Administrator Account Must Be Disabled

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-SO-000005`, which requires the **built-in Administrator account** to be disabled to reduce the risk of exploitation and ensure user accountability.

---

## 📋 STIG Overview

- **STIG ID**: WN10-SO-000005  
- **SRG**: SRG-OS-000104-GPOS-00051  
- **Category**: Security Options / Local Accounts  
- **Requirement**: Disable the built-in Administrator account  
- **Severity**: Medium  
- **CCI**: CCI-000764  
- **Vuln ID**: V-220908  
- **Rationale**: The built-in Administrator account is a known default with elevated privileges, making it a common target for attacks. Disabling it prevents unauthorized use and improves auditability by ensuring administrators use named accounts.

---

## 🔁 Reproducing the Vulnerability

To simulate non-compliance, set the local security policy “Accounts: Administrator account status” to **Enabled**, which allows login using the built-in Administrator account.

---

## 🧾 Verifying the Setting in Group Policy

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Computer Configuration → Windows Settings → Security Settings → Local Policies → Security Options`  
3. Find **Accounts: Administrator account status**, and ensure it is set to **Disabled**.

---

## 🛠️ Manual Registry or Script-Based Remediation

This setting can also be enforced using PowerShell by disabling the built-in Administrator account via local user management tools.

> Note: The setting is **compliant** when the built-in Administrator account is **disabled**.

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.

