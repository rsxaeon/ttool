;templateParse.ahk
;This file currently serves as a testbed for new template format



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