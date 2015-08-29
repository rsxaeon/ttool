;Triole Tool v2.0
;ToDo:
;complete scriptlets.ahk
;logging?
;icon?

;Begin global variable declaration
winX := 100
winY := 100
IniFile := "ttool.ini"
LogDir := A_WorkingDir."\Logs\"
DeskList := ""
gFormatFile = ""
TemplateFile := ""
ConfigFile := ""
GoSub, LoadIni ;Sets variable initial values

;begin included files with code execution.
#include deskVars.ahk 
#include deskParsers.ahk


Menu, Tray, Tip, Triole Tool
if ( A_IsCompiled )
	Menu, Tray, NoIcon

RemakeGui:
	Gui, new
	Gui +HwndMainGui
	
	Gui, Add, Text, section, Desk: 
	Gui, Add, DropDownList, ys vselectedDesk HwndSDeskId gSetDesk, %DeskList%
	
	if ( selectedDesk != "" )
	{
		GuiControl, ChooseString, selectedDesk, %selectedDesk%
		
		gFormatFile = %A_WorkingDir%\Desks\%selectedDesk%\GuiFormat.txt
		TemplateFile = %A_WorkingDir%\Desks\%selectedDesk%\Template.txt
		ConfigFile = %A_WorkingDir%\Desks\%selectedDesk%\Configuration.ini
		varSet(ConfigFile)
		guiParse(gFormatFile) 
		
	}
		
	Gui, Add, Button, section xm, Clear
	Gui, Add, Button, ys, Copy
	
	Gui, Show, x%winX% y%winY%, Triole Tool
return

#include logging.ahk
#include functions.ahk
#include hotstrings.ahk
#include scriptlets.ahk ;not completed
