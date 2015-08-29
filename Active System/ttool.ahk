;Triole Tool v2.0
;ToDo:
;complete scriptlets.ahk
;logging?
;icon?
 

;#include deskParse.ahk ;Phased out
#include declareVars.ahk ;Completed
#include templateParse.ahk ;Completed
#include guiParse.ahk ;Completed

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
		guiParse(gFormatFile) ;Correct, however declareVars.ahk must be completed first.
		TemplateFile = %A_WorkingDir%\Desks\%selectedDesk%\Template.txt
	}
		
	Gui, Add, Button, section xm, Clear
	Gui, Add, Button, ys, Copy
	
	Gui, Show, x%winX% y%winY%, Triole Tool
return

#include functions.ahk
#include hotstrings.ahk
#include scriptlets.ahk ;not completed
