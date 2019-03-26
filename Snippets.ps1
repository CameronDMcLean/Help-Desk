#
# Script Name: Snippets.ps1
# Created by Cameron McLean for personal use
#
# Script to store snippets of code for use in Visual Studio
#
# To-Do: 
# -Copy stuff 


#Create credential variable & fill
$Credential = Get-Credential 

#Enabled DHCP on $interface
Set-NetIPInterface -Interfacealias $interface -DHCP Enabled 

#AD User creation
New-ADUser -Name "xyz Admin" -GivenName "xyz" -Surname "Admin" -SamAccountName "xyzAdmin" -UserPrincipalName "xyzAdmin@yourdomain.com" -Path "OU=Accounts,DC=domain,DC=com" -AccountPassword(Read-Host -AsSecureString "Type Password for User") -Enabled $true -ChangePasswordAtLogon $false

#DHCP reservation creation
Add-DhcpServerv4Reservation -ScopeId 192.168.1.0 -IPAddress 192.168.1.x -ClientId "xx-xx-xx-xx-xx-xx" -Description "Reservation for xyz" -Name "LabSrvxyz"

#Add local DHCP server to AD
Add-DhcpServerInDC

#Add Check ADUsers length
$ADUsers = @()

if ($adusers.length -gt 10){
    Write-host "ADUsers is greater than 10, reduce to maximum 10 or edit script."
    exit-pssession

}
elseif ($adusers.Contains("*")){
    Write-host "ADUsers contains asterisk."
    Exit-PSSession
}
else {
    $adusers.Length
}

#Renames all child items, removing some string
get-childitem *.pdf | foreach {rename-item $_ $_.name.replace("string_to_replace", "")}

#Fixes domain join issues if computer object is still active
Test-ComputerSecureChannel -Repair
Reset-ComputerMachinePassword

#Install VS Code from local folder. Starts *vscode* with install arguments, meant for use in mdt. Starts with code open, need to adjust
Start-Process VSCodeSetup-x64-1.31.1.exe /verysilent /mergetasks='!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath' -Wait

#Installs GitHub Desktop - note install runs on every user login
start GitHubDesktopSetup.msi

#Installs RSAT
Install-WindowsFeature -IncludeAllSubFeature RSAT