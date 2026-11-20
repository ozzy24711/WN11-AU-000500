#Requires -RunAsAdministrator

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'

# Create the key only if it's missing
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set AlwaysInstallElevated = 0
New-ItemProperty -Path $path -Name 'AlwaysInstallElevated' -Value 0 -PropertyType DWord -Force | Out-Null

# Check the result
Get-ItemProperty -Path $path -Name 'AlwaysInstallElevated' | Select-Object AlwaysInstallElevated
