 rem Script to change homepage to myportal
 rem Created by Cameron McLean for Ricoh Canada 

rem Any pseudo code if necessary

rem

Const IE_START_PAGE = "HKCU\Software\Microsoft\Internet Explorer\Main\Start Page"
Set Shell = CreateObject("WScript.shell")
Shell.RegWrite IE_START_PAGE, "http://myportal.ricohcanada.ca/EN/Pages/RicohNews.aspx", "REG_SZ"
