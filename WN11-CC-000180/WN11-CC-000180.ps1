#Requires -RunAsAdministrator

$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer'

# Create the key only if it's missing
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set NoAutoplayfornonVolume = 1
New-ItemProperty -Path $path -Name 'NoAutoplayfornonVolume' -Value 1 -PropertyType DWord -Force | Out-Null

# Check the result
Get-ItemProperty -Path $path -Name 'NoAutoplayfornonVolume' | Select-Object NoAutoplayfornonVolume
