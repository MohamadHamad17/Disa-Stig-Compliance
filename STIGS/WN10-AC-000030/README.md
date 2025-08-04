# WN10-AC-000005 — The Minimum Password Age must be configured to at least 1 day

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-AC-000005`, which requires that the **Minimum Password Age** be set to **at least 1 day** to ensure password history enforcement cannot be bypassed by rapid cycling.

---

## 📋 STIG Overview

- **STIG ID**: WN10-AC-000005  
- **Category**: Password Policy  
- **Requirement**: Minimum Password Age must be set to at least 1 day  
- **Severity**: Medium  
- **Rationale**: If users are allowed to change passwords immediately after resetting them, they can bypass password history restrictions by cycling through passwords. Setting a minimum password age of 1 day prevents this and enforces stronger password hygiene.

---

## 🔁 Reproducing the Vulnerability

To simulate the STIG failure, the **Minimum Password Age** was manually set to **0 days** using `net accounts` or Local Security Policy, allowing passwords to be changed repeatedly in rapid succession.

---

## 🧾 Viewing the Setting in Local Group Policy

To verify or adjust the setting manually:

1. Run `gpedit.msc`
2. Navigate to:

```
Local Computer Policy >>
Computer Configuration >>
Windows Settings >>
Security Settings >>
Account Policies >>
Password Policy >>
Minimum password age
```

3. Set the value to **1 day** or greater.

---

## 🛡️ Tenable Scan After Remediation in Place

![Tenable Pass Screenshot](https://github.com/user-attachments/assets/example-tenable-pass.png)

---

## 🆚 Before vs After Comparison

### ❌ Before Remediation (STIG Failed)

![STIG Fail Screenshot](https://github.com/user-attachments/assets/example-tenable-fail.png)

---

### ✅ After Remediation (STIG Passed)

![STIG Pass Screenshot](https://github.com/user-attachments/assets/example-tenable-pass.png)

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time_

