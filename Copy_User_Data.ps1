 <#Script to transfer user data to OneDrive for PC replacement 
 Created by Cameron McLean for Ricoh Canada 
 #>

#Any pseudo code if necessary
# Robocopy data from %userprofile$/desktop, documents, favourites to %userprofile%/OneDrive - Ricoh Americas Corporation, removing duplicates etc. 
# Robocopy archives etc. 
# To do: 
# -Add support for checking if names etc. is newer than version to overwrite
# -Copy wallpaper & other items from reddit post
# -Copy C:\My Documents

#Declare variables

#Code

#Transfer items from user profile
Write-Output "Copying items from $env:USERPROFILE's Desktop, Documents, and Favourites..."
Copy-Item "$env:USERPROFILE/desktop" -destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Desktop" -Recurse -Force
Copy-Item "$env:USERPROFILE/favourites" -destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Favourites" -Recurse -Force
Copy-Item "$env:USERPROFILE/documents" -destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Documents" -Recurse -Force
Write-Output "Document copy completed."

#Transfer Notes archives, if they exist 
#Do C:/lotus, c:/lotus2, c:/program files x86/c:/lotus1 etc.
Write-Output "Copying Notes system files..."
if (Test-Path -path "C:/Lotus/Notes/data") {
    Copy-Item "C:/Lotus/Notes/data/names.nsf", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/names.nsf" 
    Copy-Item "C:/Lotus/Notes/data/archive", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/archive" -Recurse
    Copy-Item "C:/Lotus/Notes/data/desktop8.ndk", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/desktop8.ndk" 
    Copy-Item "C:/Lotus/Notes/notes.ini", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/notes.ini" 
}

if (Test-Path -path "C:/Lotus1/Notes/data") {
    Copy-Item "C:/Lotus1/Notes/data/names.nsf", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/names.nsf" 
    Copy-Item "C:/Lotus1/Notes/data/archive", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/archive"
    Copy-Item "C:/Lotus1/Notes/data/desktop8.ndk", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/desktop8.ndk" 
    Copy-Item "C:/Lotus1/Notes/notes.ini", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/notes.ini" 
}

if (Test-Path -path "C:/Lotus2/Notes/data") {
    Copy-Item "C:/Lotus2/Notes/data/names.nsf", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/names.nsf" 
    Copy-Item "C:/Lotus2/Notes/data/archive", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/archive"
    Copy-Item "C:/Lotus2/Notes/data/desktop8.ndk", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/desktop8.ndk" 
    Copy-Item "C:/Lotus2/Notes/notes.ini", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/notes.ini" 
}

if (Test-Path -path "C:/LotusBackup/Notes/data") {
    Copy-Item "C:/LotusBackup/Notes/data/names.nsf", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/names.nsf" 
    Copy-Item "C:/LotusBackup/Notes/data/archive", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/archive"
    Copy-Item "C:/LotusBackup/Notes/data/desktop8.ndk", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/desktop8.ndk" 
    Copy-Item "C:/LotusBackup/Notes/notes.ini", -Destination "$env:OneDriveCommercial/$env:username/PC_Upgrade/Notes/notes.ini" 
}

Write-Output "Notes system file copy completed."