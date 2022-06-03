$nano="20.231.16.2"
Enter-PSSession -ComputerName $nano -Credential fu

Import-Module IISAdministration
Get-Command -Module IISAdministration