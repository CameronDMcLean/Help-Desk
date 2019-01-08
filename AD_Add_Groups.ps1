 <# Script to add new users to appropriate groups
 Created by Cameron McLean for Ricoh Canada 

# To-do:
-Add support for moving users in-script?
-Add confirmation from tech & read-host

#Any pseudo code if necessary


#>

#Declare variables
$ADUsers = @("wizereK","trivisoD","ruizM")
$ADGroups = @("RCI-Office365-Users","Ricoh Remote Users","TrackIt Users","Wireless Certificate Auto-Enroll")
$ADComputers = @("16cn7s2","cvjn7s2","4bqn7s2")
$ADComputerMoveOU = "OU=Laptops,OU=Resources,OU=Explorer,OU=Ontario,DC=ricohcanada,DC=ca"
$ADUserMoveOU = "OU=Customer Service,OU=Explorer,OU=Ontario,DC=ricohcanada,DC=ca"
# not needed #$ADCurrentOU = "OU=Employees,OU=Users,OU=Accounts,OU=RCI-IOC,DC=ricohcanada,DC=ca"

foreach ($ADUser in $ADUsers){

    ForEach ($ADGroup in $ADGroups) {

      Add-ADGroupMember -Identity $ADGroup -Members $ADUser

    }
   
    Set-ADUser -Identity $ADUser -ChangePasswordAtLogon $false
    Write-host "$ADUser added to groups & password on login set to false"
}
Write-host "All users added"

foreach ($ADUser in $ADUsers){
    get-aduser $ADUser | Move-ADObject -TargetPath $ADUserMoveOU
    Write-host "$ADUser moved to $ADUserMoveOU"

}

foreach ($ADComputer in $ADComputers){
    Get-ADComputer $ADComputer | Move-ADObject -TargetPath $ADComputerMoveOU
    Write-host "$ADComputer moved to $ADComputerMoveOU"

}