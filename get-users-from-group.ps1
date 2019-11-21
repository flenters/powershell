Get-ADGroupMember -identity "groupname" -Recursive | Get-ADUser -Property DisplayName | Select Name,ObjectClass,DisplayName
