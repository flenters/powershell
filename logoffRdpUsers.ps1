$date = Get-Date 
$date = $date.ToString("yyyy-MM-dd")

try {
Write-Output "Date $date" >> "d:\Logs\user_$date.txt"
quser | Select-Object -Skip 1 | ForEach-Object {
        $id = ($_ -split ' +')[-6]
        $rdpUser = ($_ -split ' +')[-8]
        #send message to all users
        msg $id "You are about the be logged out of ApplicationsName in 1 minute"
        }

        Start-Sleep -Seconds 60 

quser | Select-Object -Skip 1 | ForEach-Object {
        $ids = ($_ -split ' +')[-6]
       foreach ($id in $ids){
        $username = ($_ -split ' +')[-8]
        #the below is the username you dont want to log of you can add more users in the if
        if ($username -eq "username"){
            write-host "The following users will not be logged off $username and session ID $id"
        }else {
            #Write-Host "$username and $id"
            Write-Output "The following users is going to be logged off $username session id $id" >> "d:\Logs\user_$date.txt"
            logoff $id
        }

    }
}
}catch{
    Write-Output "Somehting did not work" >> "d:\Logs\errors_$date.log"
    exit 1
}
