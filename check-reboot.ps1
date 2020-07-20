#Run the below command to check why the server has been rebooted
Get-EventLog -Logname System -Newest 1 -Source “USER32” | Format-List 

