Get-ChildItem

Get-Command -Module PowerShellGet -Verb find
Get-Help Find-Module -Examples

# Alias
Get-Alias -Definition Where-Object

#Create web site
Import-Module webadministration
New-Item iis:\sites\website1 `
-bindings @{protocol="http";bindingInformation=":80:www.website1.com"} `
-physicalPath %systemdrive%\inetpub\wwwroot\website1 `
-applicationPool "DefaultAppPool" `
-WhatIf

## window server

Get-WindowsFeature web-server
Install-WindowsFeature -Name web-server -IncludeManagementTools

Remove-WindowsFeature 
Get-Help Install-WindowsFeature

Get-eventlog -logName System -Source IIS* -EntryType Error
Get-eventlog -logName System -Source IIS* -EntryType Error Export-SCV c:\iiserr.csv

Get-Content c:\iiserr.csv




