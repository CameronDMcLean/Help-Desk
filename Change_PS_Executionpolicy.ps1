<# Script to switch Powershell executionpolicy between restricted and remotesigned for imaging
 Created by Cameron McLean for Ricoh Canada 

#Any pseudo code if necessary
Reads current execution policy, checks if it's restricted or remotesigned, toggles it if it is

#>
#Declare variables
$CurrentPolicy

#Code
$CurrentPolicy = Get-ExecutionPolicy

if ($CurrentPolicy -eq "Restricted") { #Changes restricted to remotesigned, to use during deployment
    Write-host "Current policy is $CurrentPolicy, changing to RemoteSigned" 
    Set-ExecutionPolicy "RemoteSigned" -Confirm:$false

} elseif ($CurrentPolicy -eq "RemoteSigned") { #Changes remotesigned to restricted, to use in production
    Write-Host "Current Policy is $CurrentPolicy, changing to Restricted"
    Set-ExecutionPolicy "RemoteSigned" -Confirm:$false
} else { # System is not in expected state, manually intervene
    Write-Host "Current policy is $CurrentPolicy, not taking any action"
}

Write-Host "Script complete, policy is" (Get-ExecutionPolicy)
