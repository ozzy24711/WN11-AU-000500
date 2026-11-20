#Requires -RunAsAdministrator

# Password policy isn't a registry key, so use net accounts
net accounts /minpwlen:14

# Check the result
net accounts | Select-String 'Minimum password length'
