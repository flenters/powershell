#This will list all the AD users groups
#Read user name
$member = Read-Host "Please type in the AD username"
$user = get-aduser -Identity $member -Properties MemberOf | select MemberOf
	(($user.memberof).split(",") | where-object {$_.contains("CN=")}).replace("CN=","")
