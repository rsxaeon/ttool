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

::@fn::
	GoSub, SubmitGui
	Send %FirstName%
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

::@stattick::
	GoSub, SubmitGui
	Send Status of %TicketNumber%{Tab}{tab}
	Sleep, 200
	Send %FirstName% %LastName% called to check status
return