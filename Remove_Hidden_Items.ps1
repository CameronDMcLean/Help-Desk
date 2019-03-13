 <# Script to disable viewing hidden files
 Created by Cameron McLean for personal use

#Any pseudo code if necessary

#>
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 2 /f
