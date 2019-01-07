$user = "username"
$pass = ConvertTo-SecureString -String "password" -AsPlainText -Force
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "$user", $pass
Start-Sleep -s 2
#Create new SSH Session
New-SSHSession -ComputerName "hostname" -Credential $cred
Start-Sleep -s 2
#Run remote SSH command
Invoke-SSHCommand -Index 0 -Command 'ls -l ~/'
#Remove the ssh session
Remove-SSHSession -Index 0 -Verbose
