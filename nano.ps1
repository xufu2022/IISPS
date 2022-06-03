$nano="20.231.16.2"
Enter-PSSession -ComputerName $nano -Credential fu
Get-PSSession


Import-Module IISAdministration
Get-Command -Module IISAdministration

Get-IISSite
Stop-IISSite -Name "Default Web Site"
Start-IISSite -Name "Default Web Site"

md C:\inetpub\wwwroot\nanosite

new-IISSite -Name Nanosite.com -bindingInformation "*:8080:" -physicalPath C:\inetpub\wwwroot\nanosite

## Mutliple server process
$Server="core1", "core2"; $Sessions= New-PSSession  $Server  -Credential fu
Get-PSSession
Invoke-Command -Session $Session -ScriptBlock {Install-WindowsFeature Web-Mgmt-Service}
Invoke-Command -Session $Session -ScriptBlock {Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement -Value 1}
Invoke-Command -Session $Session -ScriptBlock {set-Service -name WMSVC -StartupType Automatic}
Invoke-Command -Session $Session -ScriptBlock {start-Service WMSVC}

### Replacing the self-signed certificatge
$servers | ForEach-Object {Copy-Item -Path c:\Remote.company.loc.pfx -Destination "\\$_\c$"}
Invoke-Command -Session $Sessions {certutil | -p P@ssw0rd -importpfx c:\Remote.company.loc.pfx}
$servers | ForEach-Object {Remove-Item -Path "\\$_\c$\Remote.company.loc.pfx"}
Invoke-Command -Session $Sessions {Import-Module webadministration}

Invoke-Command -Session $Session {$Cert=Get-ChildItem -Path Cert:\LocalMachine\My | where {$_.Subject -like "*company*"}} | Select-Object -ExpandProperty Thumbprint
Invoke-Command -Session $Session {Remove-Item -Path "IIS:\SslBindings\0.0.0.0!8172"}

Invoke-Command -Session $Session {Get-Item -Path "cert:\LocalMachine\My\$cert" | New-Item -Path "IIS:\SslBindings\0.0.0.0!8172"}


