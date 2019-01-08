 <# Script to copy BaaN shortcut to current user's desktop
 Created by Cameron McLean for Ricoh Canada 

#Any pseudo code if necessary
#>

#Ref https://dotnet-helpers.com/powershell/create-shortcuts-on-desktops-using-powershell/
$SourceFileLocation = "C:\Program Files (x86)\Baan\lib\Baan.bwc"
$ShortcutLocation = "$env:USERPROFILE\Desktop\BaaN.lnk"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutLocation)
$Shortcut.TargetPath = $SourceFileLocation
$Shortcut.Save()