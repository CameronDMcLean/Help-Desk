 <# Script to disable fast boot on startup 
 Created by Cameron McLean for Ricoh Canada 

#Any pseudo code if necessary
#>

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t reg_dword /d 0 /f


<#
Use this:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power

HiberbootEnabled DWORD

0 = Turn off fast startup
1 = Turn on fast startup
#>