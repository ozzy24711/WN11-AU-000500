## STIG #1: WN11-AU-000500

**Rule:** The Application event log must be at least 32,768 KB.

**Severity:** Medium (CAT II)

**What it means:** Windows logs app activity. If the log is too small, old entries get overwritten, and attackers can erase their tracks.

![STIG rule](image1.png)

### Before

Tenable credentialed scan (DISA STIG audit, Windows 11) → **Failed**

![Before - Failed](image2.png)

### Manual Remediation

1. Opened Registry Editor on the VM
2. Went to `HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\`
3. Created the key `Application` (it didn't exist)
4. Created a DWORD value `MaxSize` = `32768` (decimal)
5. Restarted the VM

**After:** rescanned with the same scan → **Passed** ✅

![After manual fix - Passed](image5.png)

### Undo

Deleted the `MaxSize` value → rescanned → **Failed**

![Undo - Failed](image3.png)

### PowerShell Remediation

Ran `WN11-AU-000500.ps1` as Administrator:

```powershell
#Requires -RunAsAdministrator

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'

# Create the key only if it's missing
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Create or overwrite the DWORD value MaxSize = 0x8000 (32768 KB = 32 MB)
New-ItemProperty -Path $path -Name 'MaxSize' -Value 0x8000 -PropertyType DWord -Force | Out-Null

# Check the result
Get-ItemProperty -Path $path -Name 'MaxSize' | Select-Object MaxSize
````

![PowerShell script](image4.png)

**After:** rescanned with the same scan → **Passed** ✅

![After PowerShell - Passed](image6.png)

### Takeaway

A bigger log means evidence sticks around long enough for analysts to investigate.
````

