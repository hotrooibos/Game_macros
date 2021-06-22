;
; AHK Script for PoE
;

; Hotkeys reminder :
; 	SC002		-> touche & (1)
; 	SC003		-> touche é (2)
; 	SC004		-> touche " (3)
; 	SC005		-> touche ' (4)
; 	SC006		-> touche ' (5)
; 	LButton 	-> left clic
; 	RButton 	-> right clic
; 	MButton 	-> middle/wheel clic
; 	XButton1 	-> special mouse btn 1
; 	XButton2 	-> etc.
;   + 			-> Shift
;   ! 			-> Alt
;   ^ 			-> Ctrl


MsgBox,64 ,Script raccourcis POE,
(LTrim
	1- Fast stashing (Ctrl + <)
	2- Chicken (Mouse4)
	3- Auto flask trigger (Mouse middle btn)
)
, 20



;
;	Fast stashing (ctrl clic)
;
^<::				; On pressing "Ctrl + <"  (" ^ for Ctrl, ^+ for CtrlShift)...
	click			; ...simulate a mouse left clic
	Sleep, 50
return



;
;	Chicken : on Mbutton clic, send alt+F4
;
#IfWinActive, Path of Exile
XButton1::
	Send !{F4}
return




;
;	Auto flask triggers
;

; Key 1 shortcut
#IfWinActive, Path of Exile
SC002::
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

; Key 2 shortcut
#IfWinActive, Path of Exile
SC003::
	Send {a}
	Sleep, 30
	Send {z}
	Sleep, 120
return




;
; Auto triggers while doing main attack
;

#IfWinActive, Path of Exile

~SHIFT::
	; Send {a} ; Send this key once

	if GetKeyState("LButton", "P") {
		SendInput {t down} 	; Keep spamming General's cry
		Sleep, 1000
		
		Send {r}			; Activate Berserk (2s later, in order to gain Rage with General's)
		; Sleep, 100
		; Send (e)			; Activate Blood Rage
	}
return

~LButton up::
	SendInput {t up}
return

