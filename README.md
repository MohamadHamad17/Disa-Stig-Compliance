# Disa-Stig-Compliance

<p align="center">
  <img width="550" height="452" alt="Screenshot 2025-08-03 at 12 47 08 PM" src="https://github.com/user-attachments/assets/802ffd0e-70f5-4fac-90b7-d28e0c106752" />
</p>


A repository for automating and tracking **DISA STIG** (Security Technical Implementation Guide) compliance on **Windows 10 systems**. This project focuses on identifying failed STIGs, remediating them using PowerShell, and verifying success using tools like Tenable.io.

---

## 🧩 STIG Creation & Remediation Workflow

1. **Scan the VM**  
   Run a Windows 10 STIG audit scan on your VM using a tool like Tenable.io.

2. **Pick a Failing STIG**  
   From the results, select a failed STIG (e.g., `WN10-AU-000500`) to remediate.

3. **Manual Remediation (Optional)**  
   Research how to fix it manually (e.g., registry edit or policy change), apply the change, and test.

4. **Confirm Fix**  
   Re-scan to ensure the finding is resolved. Then **undo** the change and re-scan to confirm it fails again.

5. **Automate with PowerShell**  
   Script the fix in PowerShell and apply it.

6. **Re-test**  
   Re-scan to confirm the STIG finding is cleared.

7. **Publish**  
   Add your script to this repository under the correct STIG ID folder.

---

## 🧪 General STIG Automation Instructions

1. Log in to [Azure Portal](https://portal.azure.com) and set up a Windows 10 VM.
2. Disable the Windows Firewall using `wf.msc`.
3. Log in to [Tenable.io](https://cloud.tenable.com).
4. Create a new **Advanced Network Scan**:
   - Engine: `LOCAL-SCAN-ENGINE-01`
   - Target: Private IP of your VM
   - Add: Valid Windows credentials
5. Add compliance checks for:  
   `DISA Windows 10 STIG v3r1`
6. (Optional for speed):
   - Disable all plugins
   - Enable only `Windows Compliance Checks` in the "Policy Compliance" tab
7. Run a baseline scan and identify failed STIGs.
8. Research and fix one manually or automate it.
9. Test the fix → Revert it → Re-test → Script it → Confirm again.

---

## 💻 Technologies Used

- **Tenable.io** — For scanning virtual machines and identifying failed STIGs  
- **Microsoft Azure** — For creating and managing Windows 10 VMs used in compliance testing  
- **PowerShell** — For scripting automated remediation of STIG findings  

---

## 📁 Repo Structure

```plaintext
/Disa-Stig-Compliance/
│
├── WN10-<STIG-ID>/
│   └── fix.ps1                # PowerShell script for that STIG
│
├── .gitignore
├── LICENSE
└── README.md
