;Phased out.  Integrated into declareVars.ahk
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
}
