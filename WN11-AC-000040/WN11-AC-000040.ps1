#Requires -RunAsAdministrator

# Export current security policy
secedit /export /cfg C:\secpol.cfg | Out-Null

# Turn complexity on
(Get-Content C:\secpol.cfg) -replace 'PasswordComplexity = 0', 'PasswordComplexity = 1' | Set-Content C:\secpol.cfg

# Apply it
secedit /configure /db C:\Windows\security\local.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY | Out-Null
Remove-Item C:\secpol.cfg

# Check the result
secedit /export /cfg C:\check.cfg | Out-Null
Select-String -Path C:\check.cfg -Pattern 'PasswordComplexity'
Remove-Item C:\check.cfg
