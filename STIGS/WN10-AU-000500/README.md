# WN10-AU-000500 — The Application event log size must be configured to 32768 KB or greater

This documentation outlines the process of identifying, remediating, and validating STIG ID `WN10-AU-000500`, which requires that the **Application** event log have a maximum size of at least **32,768 KB** to ensure sufficient space for auditing security-relevant events.

---

## 📋 STIG Overview

- **STIG ID**: WN10-AU-000500  
- **Category**: Event Log Settings  
- **Requirement**: The Application event log must be set to 32,768 KB (32 MB) or more  
- **Severity**: Medium  
- **Rationale**: Logs are critical for detecting and investigating security incidents. If the size is too small, valuable audit data may be overwritten before review.

---

## 🔁 Reproducing the Vulnerability

To simulate the STIG failure, the **maximum size of the Application event log** was manually reduced below 32,768 KB using the Windows Registry.

## 🧾 Viewing the Registry Key in Regedit

To verify or manually adjust the setting, you can navigate to the following path using the **Registry Editor**:

<img width="1251" height="665" alt="Screenshot 2025-08-03 at 3 09 09 PM" src="https://github.com/user-attachments/assets/a28d777b-575c-4af9-8929-c889d990cf15" />

## Inspecting STIG ID: WN10-AU-000500 and how to remediate it manually before automation.
<img width="1422" height="452" alt="Screenshot 2025-08-03 at 3 10 25 PM" src="https://github.com/user-attachments/assets/025bda27-fac6-411f-92d3-92251cfb0a42" />

## 🛡️ Tenable Scan After Remediation in Place

<img width="1425" height="546" alt="Screenshot 2025-08-03 at 3 12 45 PM" src="https://github.com/user-attachments/assets/4393d8d9-1fa6-4331-8e72-706634a72143" />

## 🆚 Before vs After Comparison

### ❌ Before Remediation (STIG Failed)

<img width="1425" height="469" alt="Screenshot 2025-08-03 at 3 14 34 PM" src="https://github.com/user-attachments/assets/7cd0b013-87e7-4eb5-afae-a787b26530f6" />

---

### ✅ After Remediation (STIG Passed)

<img width="1425" height="469" alt="Screenshot 2025-08-03 at 3 16 02 PM" src="https://github.com/user-attachments/assets/d24d8902-41ab-4b0e-8ebe-c8b5da8bfb1a" />


---

✅ Proudly remediated as part of hands-on STIG hardening practice.  
_Security isn’t a one-time fix — it’s a habit._

Please find the remediation script in this folder within the repository.
