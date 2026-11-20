# Windows 11 DISA STIG Remediation (Tenable + Azure)

**Summary:** Scanned a Windows 11 Azure VM with a Tenable DISA STIG compliance audit, remediated 10 failed security settings, and rescanned to confirm each one passed. Each fix was done twice: once by hand (Registry Editor or Local Computer Policy) and once with a PowerShell script.

**What’s a STIG?** A Security Technical Implementation Guide, the U.S. Department of Defense’s checklist for hardening (locking down) a system.

**Tools:** Tenable (credentialed DISA STIG scan) · Microsoft Azure (Windows 11 VM) · Registry Editor · Local Computer Policy · PowerShell

**Method for each STIG:** Scan → Failed → manual fix → Passed → undo → Failed → PowerShell fix → Passed

| # | STIG ID | What it fixes | Severity | Before | After |
|---|---------|---------------|----------|--------|-------|
| 1 | [WN11-AU-000500](WN11-AU-000500/) | Application log size ≥ 32,768 KB | CAT II | Failed | ✅ Passed |
| 2 | [WN11-AU-000505](WN11-AU-000505/) | Security log size ≥ 5,120,000 KB | CAT II | Failed | ✅ Passed |
| 3 | [WN11-AU-000510](WN11-AU-000510/) | System log size ≥ 32,768 KB | CAT II | Failed | ✅ Passed |
| 4 | [WN11-CC-000180](WN11-CC-000180/) | Autoplay off for non-volume devices | CAT I | Failed | ✅ Passed |
| 5 | [WN11-CC-000185](WN11-CC-000185/) | Block autorun commands | CAT I | Failed | ✅ Passed |
| 6 | [WN11-CC-000190](WN11-CC-000190/) | Autoplay off for all drives | CAT I | Failed | ✅ Passed |
| 7 | [WN11-CC-000315](WN11-CC-000315/) | “Always install elevated” disabled | CAT I | Failed | ✅ Passed |
| 8 | [WN11-AC-000035](WN11-AC-000035/) | Minimum password length 14 | CAT II | Failed | ✅ Passed |
| 9 | [WN11-AC-000020](WN11-AC-000020/) | Password history 24 | CAT II | Failed | ✅ Passed |
| 10 | [WN11-AC-000040](WN11-AC-000040/) | Password complexity enabled | CAT II | Failed | ✅ Passed |

**Result:** 10 of 10 remediated: 4 CAT I (high) and 6 CAT II (medium).
