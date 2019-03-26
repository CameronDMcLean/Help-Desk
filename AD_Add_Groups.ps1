 <# Script to add new users to appropriate groups
 Created by Cameron McLean for personal use

# To-do:
-Add support for moving users in-script?
-Add confirmation from tech & read-host
-Add input validation stuff - wildcard, already existing, list of blocked accounts, if account exists, etc

#Any pseudo code if necessary
#>

#Declare variables
$newuser = $null
$ADUsers = @()
$ADGroups = @("Your_Groups")
$ADComputers = @()
$ADComputerMoveOU = "Your_Computer_OU"
$ADUserMoveOU = "Your_User_OU"

do  {
    Write-Host "Current users adding: 
    $adusers"
    $newuser = Read-Host "Enter user's username, or leave blank to exit"

    #Add input validation stuff here - wildcard, already existing, list of blocked accounts etc
    $ADUsers += $newuser
} while ($newuser)

#Get input from tech on computers to move
do  {
    Write-Host "Current computers moving: 
    $ADComputers"
    $NewComputer = Read-Host "Enter computer's hostname, or leave blank to exit"

    $ADComputers += $NewComputer
} while ($NewComputer) #Loop will run at least once, then close when $NewComputer is false (left blank)


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
