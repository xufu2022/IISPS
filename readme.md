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

C:\Windows\System32\inetsrv>appcmd.exe add apppool /name:website2
for /l %l in (4,1,50) do mkdir c:\....

dir iis:

## window .net core 6 hosting
https://dotnet.microsoft.com/en-us/download/dotnet/current/runtime (window hosting bundle)

## The CmdletBinding attribute

The CmdletBinding attribute is used to turn a function into an advanced function and is placed immediately above a param block. The attribute is used to add extra functionality, such as access to common parameters, control over the impact level, and so on. Scripts are not referred to as advanced scripts, but the same principle applies.

## Common parameters
With CmdletBinding in place, a script or function may use common parameters. The common 
parameters are listed here:

-   • Debug
-   • ErrorAction
-   • ErrorVariable
-   • InformationAction
-   • InformationVariable
-   • OutVariable
-   • OutBuffer
-   • PipelineVariable
-   • Verbose
-   • WarningAction
-   • WarningVariable
