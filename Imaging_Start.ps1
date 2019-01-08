 <# Main script to run other imaging scripts from
 Created by Cameron McLean for Ricoh Canada 

#Any pseudo code if necessary
#Launches PS window set to bypass executionpolicy
#Calls local admin script
#Calls SLNX Mapping Script
#
#Runs gpupdate & declines reboot
#Displays "GPO Start complete, ready for reboot"
#>

#Declare variables

#Run bypass execution policy #This doesn't work with both switches?
powershell -executionpolicy bypass -Credential ""