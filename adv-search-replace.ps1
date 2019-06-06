cls
#Get the dat for logging
$date = Get-Date 
$date = $date.ToString("yyyy-MM-dd")

$string = Read-Host "Type the string you are searching for"
#$path = Read-host "Type in the full path to the folder e.g c:\test"
$word = ("$string" + ";Password=")
$word2 = ("$string" + ";Pwd=")
$before_array = Get-ChildItem -Path C:\test -Include *.config,*.xml -Recurse | Select-String -Pattern $word,$word2 -SimpleMatch

$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path C:\test\log.txt -append


        Write-Host "Changing password on $date for $string"
        Write-Host "Before Password Change"
        
    foreach($item in $before_array){
        Write-Host $item 
        
        (Get-Content $item.Path) |
        ForEach-Object { $_ -replace ("(?<=$word)" +'(.*?)(?=[<|"])'), "sup" } | Set-Content $item.Path    
        }


   foreach($item in $before_array){

        
        (Get-Content $item.Path) |
        ForEach-Object { $_ -replace ("(?<=$word2)" +'(.*?)(?=[<|"])'), "sup" } | Set-Content $item.Path    
        }
Stop-Transcript
