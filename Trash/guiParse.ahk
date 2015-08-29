guiParse(GuiTemplate) {
    Loop, Read, %GuiTemplate%
    {
        Position := 0
		PrevDelimiter := ""
		Loop, Parse, A_LoopReadLine, <>[]{},
		{
			Position += StrLen(A_LoopField) + 1
			Delimiter := SubStr(A_LoopReadLine, Position, 1)
			If ( Delimiter = ">" )
			{
				Gui, Add, Text, section xm, %A_LoopField%
			}
			If ( Delimiter = "]" )
			{
				If ( InStr(A_LoopField,"(") )
				{
					StringSplit, VarLine, A_LoopField, (),
					Gui, Add, Edit, v%VarLine1% ys, %VarLine2%
				}
				Else If ( A_LoopField = "Notes" )
				{
					Gui, Add, Edit, vNotes w500 r20
				}
				Else
				{
					Gui, Add, Edit, v%A_LoopField% ys, 
				}
			}
			
			If ( Delimiter = "}" )
			{
				StringSplit, VarLine, A_LoopField, (),
				Gui, Add, DropDownList, v%VarLine1% ys, %VarLine2%
			}
				
		}
	}
}