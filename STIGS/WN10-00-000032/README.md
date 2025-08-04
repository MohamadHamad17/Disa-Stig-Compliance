# WN10-00-000032 — BitLocker must require a startup PIN that is **at least six characters long**

This README explains how to identify, remediate, and verify compliance with **STIG ID WN10-00-000032**.  
The control mandates that BitLocker enforce a minimum startup PIN length of **six or more characters** to strengthen pre-boot authentication.

---

## 📋 STIG Quick Facts

| Field            | Value                                                  |
|------------------|--------------------------------------------------------|
| **STIG ID**      | WN10-00-000032                                         |
| **Category**     | BitLocker Encryption                                   |
| **Requirement**  | Configure BitLocker to use a PIN with a minimum length of 6 characters |
| **Severity**     | Medium                                                 |
| **Why it matters** | Short PINs are easier to guess or brute-force. A longer PIN better protects data on encrypted drives if the device is lost or stolen. |

---

## 🔍 How to Check the Current Setting

1. Press **Windows + R**, type `gpedit.msc`, and press **Enter**.  
2. Browse to:

   ```text
   Computer Configuration
   └── Administrative Templates
       └── Windows Components
           └── BitLocker Drive Encryption
               └── Operating System Drives

3. In the right-hand pane, locate Configure minimum PIN length for startup.
4. If the policy is Not Configured or Enabled with a value less than 6, the system is non-compliant.

## ✅ Solution: Enforce Minimum BitLocker PIN Length via Group Policy

### 📍 Policy Path
```text
Computer Configuration
└── Administrative Templates
    └── Windows Components
        └── BitLocker Drive Encryption
            └── Operating System Drives
                └── Configure minimum PIN length for startup
```

<img width="1434" height="738" alt="Screenshot 2025-08-04 at 12 46 23 PM" src="https://github.com/user-attachments/assets/983c1c63-c04e-415b-be82-f27e3c8c0ec5" />

### 🛠️ Step-by-Step Instructions

1. **Open Local Group Policy Editor**  
   * Press **Windows + R**  
   * Type `gpedit.msc` and press **Enter**

2. **Navigate** to the policy path shown above.

3. In the right pane, **double-click** **Configure minimum PIN length for startup**.

4. **Configure the setting:**  
   * Select **Enabled**  
   * In **Minimum characters**, enter **6** (or higher if required by your organization)  
   * Click **Apply**, then **OK**


🔁 Apply the Group Policy Immediately
Open Command Prompt (Admin) and run:

```cmd
gpupdate /force
```
This refreshes policies without waiting for the next background update.
