 <# Script to query AD for Windows 7 computer objects last used in 3 months
 Created by Cameron McLean for personal use

#Any pseudo code if necessary
Get computer objects from last 3 months

#>

<# https://social.technet.microsoft.com/Forums/en-US/e8e88120-0f70-434e-8556-d028b4c2bfe9/search-for-active-computers-with-last-90-days?forum=ITCG

$cutoff = (Get-Date).AddDays(-90)

$filter = "LastLogonDate -gt '$cutoff' -and (OperatingSystem -eq 'Windows 7 Professional' -or OperatingSystem -eq 'Windows XP Professional')"

Get-ADComputer -Filter $filter -Properties OperatingSystem,Description,LastLogonDate |
    Select Name,OperatingSystem,Description,LastLogonDate |
        Sort Name |
            Export-Csv .\CurrentMachines.csv -NoTypeInformation
            
#>

Get-ADComputer -Filter {OperatingSystem -Like “Windows 7 Enterprise”} -Property * | Format-Table Name,OperatingSystem,OperatingSystemServicePack -Wrap -Auto | Export-CSV Win7.csv -NoTypeInformation -Encoding UTF8