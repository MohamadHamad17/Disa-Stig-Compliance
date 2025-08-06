# WN10-AC-000020 — The Account Lockout Threshold must be configured to 3 or fewer invalid logon attempts

This README explains how to identify, remediate, and verify compliance with **STIG ID WN10-AC-000020**.  
The control requires the **Account Lockout Threshold** to be configured to **3 or fewer invalid login attempts** (excluding 0), helping to prevent brute-force password attacks on Windows systems.

---

## 📋 STIG Quick Facts

| Field              | Value                                                             |
|--------------------|-------------------------------------------------------------------|
| **STIG ID**        | WN10-AC-000020                                                    |
| **Category**       | Account Lockout Policy                                            |
| **Requirement**    | Set the Account Lockout Threshold to 3 or fewer (but not 0)       |
| **Severity**       | Medium                                                            |
| **Why it matters** | A small number of failed attempts helps block password-guessing attacks while still allowing room for honest mistakes. Setting the value too high weakens the lockout protection. |

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
   ```

3. Locate **Account lockout threshold** in the right pane.
4. If the value is set to **0** or **more than 3**, this is a **finding** and the system is **non-compliant**.

---

## ✅ Solution: Enforce Account Lockout Threshold via Group Policy

### 📍 Policy Path

```text
Computer Configuration
└── Windows Settings
    └── Security Settings
        └── Account Policies
            └── Account Lockout Policy
                └── Account lockout threshold
```



---

### 🛠️ Step-by-Step Instructions

1. **Open Local Group Policy Editor**  
   * Press **Windows + R**  
   * Type `gpedit.msc` and press **Enter**

2. **Navigate** to the policy path shown above.

3. In the right pane, **double-click** **Account lockout threshold**.

4. **Configure the setting:**  
   * Set it to **3**  
   * Click **Apply**, then **OK**

5. Group Policy will automatically prompt you to configure:
   - **Reset account lockout counter after**  
   - **Account lockout duration**  
   > Choose reasonable values (e.g., 15 minutes) in accordance with organizational policy.

---

## 🔄 Apply the Group Policy Immediately

Open Command Prompt as Administrator and run:

```cmd
gpupdate /force
```

This ensures the new setting is applied immediately.


✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.


