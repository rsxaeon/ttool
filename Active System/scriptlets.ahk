;list of sciptlet hotstrings


;BEGIN STRIKE NOTES ; -INCOMPLETE-
::1@everify::
	SendInput 1st attempt - Emailed %UserRef% to verify resolution
Return
::2@everify::
	SendInput 2nd attempt - Emailed %UserRef% to verify resolution
Return
::3@everify::
	SendInput 3rd attempt - Emailed %UserRef% to verify resolution
Return

::1@pverify::
	SendInput 1st attempt - Left VM for %UserRef% to verify resolution
Return
::2@pverify::
	SendInput 2nd attempt - Left VM for %UserRef% to verify resolution
Return
::3@pverify::
	SendInput 3rd attempt - Left VM for %UserRef% to verify resolution
Return

::1@ets::
	SendInput 1st attempt - Emailed %UserRef% to call %DeskRef% for troubleshooting.
Return
::2@ets::
	SendInput 2nd attempt - Emailed %UserRef% to call %DeskRef% for troubleshooting.
Return
::3@ets::
	SendInput 3rd attempt - Emailed %UserRef% to call %DeskRef% for troubleshooting.
Return

::1@pts::
	SendInput 1st attempt - Left VM for %UserRef% to call %DeskRef% for troubleshooting.
Return
::2@pts::
	SendInput 2nd attempt - Left VM for %UserRef% to call %DeskRef% for troubleshooting.
Return
::3@pts::
	SendInput 3rd attempt - Left VM for %UserRef% to call %DeskRef% for troubleshooting.
Return
;END STRIKE NOTES

;BEGIN GENERICS
::@verres::
::@veres::
::@resver::
	SendInput Please reply to this email or contact us at %DeskPhone% to let us know if your issue still persists or if it has been resolved.
Return

::@ct::Closing ticket.

::@ts::
	SendInput Please call us at %DeskPhone% to conduct troubleshooting on this issue.
Return
::@resolved::
	SendInput We have received notification that this issue is resolved.  Please reply to this email or contact us at %DeskPhone% to let us know if your issue still persists or if it has been resolved.
Return
;END GENERICS



