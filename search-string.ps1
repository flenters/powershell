$string = Read-Host "Type the string you are searching for"
$path = Read-host "Type in the full path to the folder e.g c:\temp"

Get-ChildItem -Path $path -Recurse | Select-String "$string"