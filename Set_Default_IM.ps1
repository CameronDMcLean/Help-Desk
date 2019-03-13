<#
### Script to set IM program used for Outlook status###
### Created by Cameron McLean for personal use

#To-do:
-Fix registery key testing - can check for container but not value. 
-Probably need to get-item for the whole thing then check the key
-

#Any pseudo code if necessary
Check if HKCU:\Software\IM Providers\DefaultIMApp exists
    If exists & is set to Skype (Lync) then exit with success
    If exists & is not set to Skype (Lync) then change to Lync
    If not exists then create & set to Lync


#Declare variables

#Code
#>
#variable to store key if it exists
$DefaultIMApp = ""
$key = Get-Item "HKCU:\Software\IM Providers"

#Test if key exists
if ($key.Property -ccontains "DefaultIMApp"){
    $DefaultIMApp = Get-ItemProperty -Path "HKCU:\Software\IM Providers\" -Name "DefaultIMApp"
    
    #If key is already set to Skype then close out, otherwise change it
    if ($DefaultIMApp.DefaultIMApp -ccontains "Lync"){
            Write-Output "DefaultIMApp already set to Skype (Lync)."
            
        } else {
            Write-output "DefaultIMApp not set to Skype, changing..."
            Set-ItemProperty -path "HKCU:\Software\IM Providers" -Name "DefaultIMApp" -Value "Lync"
        }
        
} else {
    #Create registry key & set to Lync
    New-ItemProperty -path "HKCU:\Software\IM Providers" -Name "DefaultIMApp" -Value "Lync"
}

Write-output "Script complete, key value is " (get-item -LiteralPath "HKCU:\Software\IM Providers\")