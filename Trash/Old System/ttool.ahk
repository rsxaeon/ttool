#include templateParse.ahk
DefTemplateFile := "template2.txt"
winX := 100
winY := 100
IniFile := "ttool.ini"

GoSub, LoadIni
Menu, Tray, Tip, Triole Tool

RemakeGui:
	Gui, new
	Gui +HwndMainGui
	
	Gui, Add, Text, section, First and Last name:
	Gui, Add, Edit, ys vFirstName,
	Gui, Add, Edit, ys vLastName,
	
	Gui, Add, Text, section xm, CM or BP:
	Gui, Add, DropDownList, vCMorBP ys, CM||BP
	
	Gui, Add, Text, section xm, Contact Number:
	Gui, Add, Edit, vPhoneNumber ys, 000-000-0000
	
	Gui, Add, Text, section xm, Email Address:
	Gui, Add, Edit, vEmail ys
	
	Gui, Add, Text, section xm, JetBlue UserID:
	Gui, Add, Edit, vUserID ys
	
	Gui, Add, Text, section xm, Crewmember Number:
	Gui, Add, Edit, vCrewmemberNumber ys
	
	Gui, Add, Text, section xm, Requested Resources:
	Gui, Add, Edit, vRequestedResources ys
	
	Gui, Add, Text, section xm, Terminal Session/s:
	Gui, Add, Edit, vTerminalSession ys
	
	Gui, Add, Text, section xm, Intranet / Sharepoint URLs:
	Gui, Add, Edit, vURLs ys
	
	Gui, Add, Text, section xm, Share Drive/s:
	Gui, Add, Edit, vDrivePath ys
	
	Gui, Add, Text, section xm, Knowledge Base Article:
	Gui, Add, Edit, vKBLine ys, "No KB Found"
	
;	Gui, Add, Text, section xm, Knowledge Base Article #:
;	Gui, Add, Edit, vKBNumber ys
	
;	Gui, Add, Text, section xm, Knowledge Base Article Titile:
;	Gui, Add, Edit, vKBTitle ys
	
	Gui, Add, Text, section xm, Notes:
	Gui, Add, Edit, vNotes w500 r20
	
	Gui, Add, Text, section xm, Ticket: 
	Gui, Add, Edit, VTicketNumber ys
	
	Gui, Add, Button, section xm, Clear
	Gui, Add, Button, ys, Status Ticket
	
	Gui, Show, x%winX% y%winY%, Triole Tool
return

ButtonClear:
	WinGetPos, winX, winY,,, Triole Tool
	Gui, Destroy
	Goto RemakeGui
return

ButtonStatusTicket:
	GoSub, SubmitGui
	FileAppend, Ticket: `r`n %TicketNumber% `r`n, StatusTickets.txt
	FileAppend, Desc: `r`n Status of %TicketNumber% `r`n, StatusTickets.txt
	FileAppend, Summ: `r`n %FirstName% %LastName% called to check status `r`n, StatusTickets.txt
	FileAppend, Phone: `r`n %PhoneNumber% `r`n, StatusTickets.txt
return

SubmitGui:
	Gui %MainGui%:Default
	Gui, Submit, NoHide
	Sleep, 200
return

SaveIni:
	IniWrite, %winX%, %IniFile%, position, winX
	IniWrite, %winY%, %IniFile%, position, winY
	IniWrite, %TemplateFile%, %IniFile%, template, file
return

LoadIni:
	IniRead, winX, %IniFile%, position, winX, 100
	IniRead, winY, %IniFile%, position, winY, 100
	IniRead, TemplateFile, %IniFile%, template, file, %DefTemplateFile%
return

GuiClose:
	WinGetPos, winX, winY,,, Triole Tool
	GoSub, SaveIni
	ExitApp
return

;;begin hotsrings

#Include scriptlets.ahk

::@template::
	OldClip := ClipboardAll
	GoSub, SubmitGui
	Sleep, 200
	;old method moved to replacedfunctions.ahk
	Clipboard := templateParse(TemplateFile)
	Sleep, 200
	Send ^v
	Sleep, 200
	Clipboard := OldClip
return

::@ln::
	GoSub, SubmitGui
	Send %LastName%
return

::@ticket::
	GoSub, SubmitGui
	Send %TicketNumber%
return

::@email::
	GoSub, SubmitGui
	Send %Email%
return

::@phone::
	GoSub, SubmitGui
	Send %PhoneNumber%
return

::@name::
	GoSub, SubmitGui
	Send %FirstName% %LastName%
return

::@cmnum::
	GoSub, SubmitGui
	Send %CrewmemberNumber%
return

::@uid::
	GoSub, SubmitGui
	Send %UserID%
return

::@stattick::
	GoSub, SubmitGui
	Send Status of %TicketNumber%{Tab}{tab}
	Sleep, 200
	Send %FirstName% %LastName% called to check status
return