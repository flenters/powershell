$user = Read-Host "Please type in the username"
Get-ADUser $user -Properties lockedout | Select-Object LockedOut
