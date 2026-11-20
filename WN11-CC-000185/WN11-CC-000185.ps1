#Requires -RunAsAdministrator

$path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'

# Create the key only if it's missing
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set NoAutorun = 1
New-ItemProperty -Path $path -Name 'NoAutorun' -Value 1 -PropertyType DWord -Force | Out-Null

# Check the result
Get-ItemProperty -Path $path -Name 'NoAutorun' | Select-Object NoAutorun
