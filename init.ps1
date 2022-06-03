
Import-Module ServerManager  -Force;
Get-WindowsFeature | more
Get-WindowsFeature *web* | Where-Object {$_.installState -eq 'Installed'}
Remove-WindowsFeature -WhatIf