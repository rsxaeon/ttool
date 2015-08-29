DeskPhone := ""
UserRef := ""
DeskRef := ""


;initialize variables used for gui items as global
Loop, %A_WorkingDir%\Desks\*, 2
{
	If ( DeskList = "" )
	{
		Desklist = %A_LoopFileName%
		If ( selectedDesk = "" )
			selectedDesk = %A_LoopFileName%
	}
	Else
		Desklist = %DeskList%|%A_LoopFileName%
		
	gTemplate = %A_WorkingDir%\Desks\%A_LoopFileName%\GuiFormat.txt
	Loop, Read, %gTemplate%
	{
		Position := 0
		Loop, Parse, A_LoopReadLine, <>[]{},
		{
			Position += StrLen(A_LoopField) + 1
			Delimiter := SubStr(A_LoopReadLine, Position, 1)
			If ( Delimiter = "]" )
			{
				StringSplit, VarLine, A_LoopField, (),
				%VarLine1% := ""
			}
			If ( Delimiter = "}" )
			{
				StringSplit, VarLine, A_LoopField, (),
				%VarLine1% := ""
			}
		}
	}
}


varsSet(ConfFile) {
	IniRead, DeskPhone, %ConfFile%, DeskVariables, DeskPhone, "000-000-0000"
	IniRead, UserRef, %ConfFile%, DeskVariables, UserRef, "user"
	IniRead, DeskRef, %ConfFile%, DeskVariables, DeskRef, "HD"
}