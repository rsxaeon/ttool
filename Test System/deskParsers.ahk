;contains parsers for output templates and gui templates



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
					Gui, Add, Edit, v%VarLine1% ys gLogChange, %VarLine2%
				}
				Else If ( A_LoopField = "Notes" )
				{
					Gui, Add, Edit, vNotes w500 r20 gLogChange
				}
				Else
				{
					Gui, Add, Edit, v%A_LoopField% ys gLogChange, 
				}
			}
			
			If ( Delimiter = "}" )
			{
				StringSplit, VarLine, A_LoopField, (),
				Gui, Add, DropDownList, v%VarLine1% ys gLogChange, %VarLine2%
			}
				
		}
	}
}


templateParse(Template) {
	OutputText := ""
	Loop, Read, %Template%
	{
		StringTrimLeft, ParseLine, A_LoopReadLine, 1
		If RegExMatch(A_LoopReadLine, "^\!") 
		{
			Position := 0
			OutLine := ""
			Loop, Parse, ParseLine, [],
			{
				Position += StrLen(A_LoopField) + 1
				Delimiter := SubStr(ParseLine, Position, 1)	
				If ( Delimiter = "]" ) 
					OutLine .= %A_LoopField%
				Else
					OutLine .= A_LoopField
			}
			OutLine .= "`r`n"
			OutputText .= OutLine
		}
		If RegExMatch(A_LoopReadLine, "^\?")
		{
			Position := 0
			OutLine := ""
			TestField := ""
			LinePassed := true
			Loop, Parse, ParseLine, [],
			{
				Position += StrLen(A_LoopField) + 1
				Delimiter := SubStr(ParseLine, Position, 1)
				If ( Delimiter = "]" ) {
					OutLine .= %A_LoopField%
					if ( %A_LoopField% = "" ){
						LinePassed := false
					}
				}
				Else
					OutLine .= A_LoopField
			}
			OutLine .= "`r`n"
			if ( LinePassed )
				OutputText .= OutLine
		}
	}
	StringReplace, OutputText, OutputText, {NL}, `r`n, All
	return OutputText
}