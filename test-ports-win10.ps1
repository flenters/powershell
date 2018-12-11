#Type in the hostname you would like to check
$computerName = @("www.google.co.za","www.github.com")
#type in the ports you want to check
$ports = @("80","443")

foreach ($computer in $computerName){
    foreach($port in $ports){
        $test = Test-NetConnection -ComputerName "$computer" -Port "$port" -InformationLevel Quiet -WarningAction SilentlyContinue
    if($test -eq $true){
            Write-Host "$computer" Port "$port" is open -ForegroundColor Green
        }
        else{
            Write-Host "$computer" Port "$port" is close -ForegroundColor Red
        }
       }
      }