Get-Process -Id $PID | Select-Object Name,Id,Path | ConvertTo-Json

@{ Today = (Get-Date).DayOfWeek } | ConvertTo-Json

Get-Process -ID $PID | Select-Object Name, ID | ConvertTo-Json -AsArray

$string = "first value"
$scriptBlock = { $string }
& $scriptBlock