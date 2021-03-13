MsgBox,64 ,Script raccourcis POE,
(LTrim
	1- Fast stashing (Ctrl + <)
	2- Chicken (Mouse4)
	3- Auto flask trigger (touche é/1)
)
, 20



;
;	Fast stashing (ctrl clic)
;
^<::			; On pressing "Ctrl + <"  (" ^ for Ctrl, ^+ for CtrlShift)...
	click			; ...simulate a mouse left clic
	Sleep, 50
return

;
;	Chicken
;
#IfWinActive, Path of Exile
XButton1::		; On Mouse4 button clic (aka "back" button)...
	Send !{F4}		; ...simulate Alt+F4
return

;
;	Auto flask trigger
;
#IfWinActive, Path of Exile
MButton::
	Send {e}		; touche e
	Send {r}		; touche r
	Send {t}		; touche t

	Send {SC002}	; touche & (1)
	Sleep, 210
	Send {SC003}	; touche é (2)
	Sleep, 150
	Send {SC004}	; touche " (3)
	Sleep, 120
	Send {SC005}	; touche ' (4)
	Sleep, 120
	Send {SC006}	; touche ' (5)
return