# WN10-SO-000255 — User Account Control Must Automatically Deny Elevation Requests for Standard Users

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-SO-000255`, which requires that **User Account Control (UAC)** be configured to **automatically deny elevation requests for standard users**. This prevents non-administrative accounts from attempting privilege elevation, reducing the risk of credential theft and unauthorized access.

---

## 📋 STIG Overview

- **STIG ID**: WN10-SO-000255  
- **SRG**: SRG-OS-000373-GPOS-00157  
- **Category**: Security Options  
- **Requirement**: User Account Control must automatically deny elevation requests for standard users  
- **Severity**: Medium  
- **CCI**: CCI-002038  
- **Vuln ID**: V-220947  
- **Rationale**: Limiting privilege elevation to administrative accounts ensures that tasks requiring elevated rights are initiated only by authorized users. This policy helps mitigate credential theft and misuse.

---

## 🔁 Reproducing the Vulnerability

To simulate this vulnerability, the **User Account Control: Behavior of the elevation prompt for standard users** policy was set to a value **other than** “Automatically deny elevation requests” in the Local Group Policy Editor or its corresponding registry value was set incorrectly.

---

## 🧾 Viewing the Setting in Local Group Policy

To verify or manually adjust the setting:

1. Press `Windows + R`, type `gpedit.msc`, and press Enter.  
2. Navigate to:  
   `Local Computer Policy → Computer Configuration → Windows Settings → Security Settings → Local Policies → Security Options`  
3. Locate **User Account Control: Behavior of the elevation prompt for standard users**.  
4. Set the value to **Automatically deny elevation requests**.

---

## 🛠️ Manual Remediation Demonstration

### **Group Policy Method**
1. Open the **Local Group Policy Editor** (`gpedit.msc`).  
2. Go to:  
   `Computer Configuration → Windows Settings → Security Settings → Local Policies → Security Options`  
3. Set **User Account Control: Behavior of the elevation prompt for standard users** to **Automatically deny elevation requests**.  
4. Apply the changes and run:  
   ```powershell
   gpupdate /force
