# WN10-SO-000010 — The built-in guest account must be disabled

This documentation covers the full process of identifying, triggering, remediating, and validating STIG ID `WN10-SO-000010`, which requires that the built-in Guest account be disabled on Windows 10 systems.

---

## 📋 STIG Overview

- **STIG ID**: WN10-SO-000010  
- **Category**: Security Options  
- **Requirement**: The built-in Guest account must be disabled  
- **Severity**: Medium  
- **Rationale**: The Guest account allows unauthenticated access to a system. Leaving it enabled is a security risk and violates DISA STIG compliance.

---

## 🔁 Reproducing the Vulnerability

To intentionally trigger the STIG failure, the Guest account was **manually enabled** using Command Prompt:

```cmd
net user guest /active:yes
```

<img width="961" height="499" alt="Screenshot 2025-08-03 at 2 54 51 PM" src="https://github.com/user-attachments/assets/ea338977-007e-4001-ac4a-08798cd203c5" />

## 🔍 Vulnerability Scan Results — Before and After

After enabling the Guest account, a Tenable scan was performed to capture the STIG failure. The Guest account was then disabled using PowerShell, and a follow-up scan was run to validate successful remediation.

---

### ❌ Before Remediation: STIG Failed

The scan shows that `WN10-SO-000010` failed due to the Guest account being enabled.

<img width="1435" height="750" alt="Screenshot 2025-08-03 at 2 58 14 PM" src="https://github.com/user-attachments/assets/13c899d9-46f8-476a-aba3-816fe8f9b6b1" />

<img width="1435" height="750" alt="Screenshot 2025-08-03 at 3 00 09 PM" src="https://github.com/user-attachments/assets/8ff7692a-e27f-4ec9-b4d3-08dec3af1405" />

---

### 🛠️ Running the Script  
Below is the script I created to remediate the STIG after manually enabling the Guest account.


<img width="915" height="715" alt="Screenshot 2025-08-03 at 1 57 15 PM" src="https://github.com/user-attachments/assets/5aa9c4a8-5447-4db6-8013-eed49b91c305" />



___

### ✅ After Remediation: STIG Passed

Following execution of the PowerShell remediation script, the Guest account was successfully disabled and the STIG passed.

<img width="1435" height="750" alt="Screenshot 2025-08-03 at 2 58 46 PM" src="https://github.com/user-attachments/assets/f8b24e83-1f5b-4ab5-b708-c286a0b3c8a6" />


---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository
