#Requires -RunAsAdministrator

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security'

# Create the key only if it's missing
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set MaxSize = 0x4E2000 (5120000 KB)
New-ItemProperty -Path $path -Name 'MaxSize' -Value 0x4E2000 -PropertyType DWord -Force | Out-Null

# Check the result
Get-ItemProperty -Path $path -Name 'MaxSize' | Select-Object MaxSize
