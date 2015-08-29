ButtonClear:
	WinGetPos, winX, winY,,, Triole Tool
	Gui, Destroy
	Goto RemakeGui
return

ButtonCopy:
	GoSub, SubmitGui
	Sleep, 200
	Clipboard:= templateParse(TemplateFile)
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
	IniWrite, %selectedDesk%, %IniFile%, variables, selectedDesk
return

LoadIni:
	IniRead, winX, %IniFile%, position, winX, 100
	IniRead, winY, %IniFile%, position, winY, 100
	IniRead, selectedDesk, %IniFile%, variables, selectedDesk, ""
return

SetDesk:
	GuiControlGet, selectedDesk
	TemplateFile = %A_WorkingDir%\Desks\%selectedDesk%\Template.txt
	Goto, ButtonClear
return

GuiClose:
	WinGetPos, winX, winY,,, Triole Tool
	GoSub, SaveIni
	ExitApp
return
