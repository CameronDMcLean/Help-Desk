### Script to add user by short name & help desk group to local admin ###
### Created by Cameron McLean for Ricoh Canada ###

#clears $user variable
$user = ""

#Prompts tech to enter user's short username (7 digits of last name & first initial), email address would work as well. 
$user = read-host -Prompt "Enter the user's short username"

#Adds help desk group & $user to Administrators local group
Add-LocalGroupMember -Group "Administrators" -Member "ricohcanada\help desk", $user`

write-host "Added $user and ricohcanada\help desk to local Administrators group."