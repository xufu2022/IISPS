# IIS 10 configure and Powershell

download  Remote Server Administration Tools
https://www.microsoft.com/en-us/download/confirmation.aspx?id=45520

## Configure IIS

select instance, then click management services, click Enable Remote connections
click start page, connect to a server

click Limit to configure limit

command

    sl ~        from there using graphic user interface  (sl stands for Set-Location)

## Create website using Appcmd

C:\Windows\System32\inetsrv>appcmd.exe add apppool /name: website2