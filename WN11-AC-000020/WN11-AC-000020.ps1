#Requires -RunAsAdministrator

# Remember the last 24 passwords
net accounts /uniquepw:24

# Check the result
net accounts | Select-String 'Length of password history'
