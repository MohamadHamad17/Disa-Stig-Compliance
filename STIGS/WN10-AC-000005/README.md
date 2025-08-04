# WN10-AC-000005 — Windows must enforce an account lockout duration of 15 minutes or more

This README explains how to identify, remediate, and verify compliance with **STIG ID WN10-AC-000005**.  
The control mandates that Windows enforce a lockout period of **15 minutes or more** after a specified number of failed logon attempts, reducing the risk of brute-force attacks.

---

## 📋 STIG Quick Facts

| Field              | Value                                                                 |
|--------------------|-----------------------------------------------------------------------|
| **STIG ID**        | WN10-AC-000005                                                        |
| **Category**       | Account Lockout Policy                                                |
| **Requirement**    | Set account lockout duration to 15 minutes or greater (or 0 if admin unlock is required) |
| **Severity**       | Medium                                                                |
| **Why it matters** | Locking accounts after failed attempts slows down brute-force attacks and helps identify suspicious behavior. |

---

## 🔍 How to Check the Current Setting

1. Press **Windows + R**, type `gpedit.msc`, and press **Enter**.  
2. Navigate to:

   ```text
   Computer Configuration
   └── Windows Settings
       └── Security Settings
           └── Account Policies
               └── Account Lockout Policy
3. In the right-hand pane, locate Account lockout duration.
4. If the value is less than 15 minutes (excluding 0, which requires admin intervention), the system is non-compliant.

<img width="1434" height="634" alt="Screenshot 2025-08-04 at 3 07 40 PM" src="https://github.com/user-attachments/assets/697f8966-f38c-4195-a66c-302d5d45709c" />

---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.
