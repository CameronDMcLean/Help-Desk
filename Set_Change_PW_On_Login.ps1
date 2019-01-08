 <# Script to re-enable "Change password at logon" value for new users after resetting PC
 Created by Cameron McLean for Ricoh Canada 

#Any pseudo code if necessary
#>
$userreset = Read-Host "Enter user's short username"
Set-ADUser -Identity $userreset -ChangePasswordAtLogon $true

Write-host "$userreset's change PW on login attribute has been reset"