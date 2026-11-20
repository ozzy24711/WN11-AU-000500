#Requires -RunAsAdministrator

$path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'

# Create the key only if it's missing
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set NoDriveTypeAutoRun = 0xFF (255)
New-ItemProperty -Path $path -Name 'NoDriveTypeAutoRun' -Value 0xFF -PropertyType DWord -Force | Out-Null

# Check the result
Get-ItemProperty -Path $path -Name 'NoDriveTypeAutoRun' | Select-Object NoDriveTypeAutoRun
