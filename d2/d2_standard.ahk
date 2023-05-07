;
; AHK v2 beta14 Script for Diablo 2 Resurrected
; Author : https://github.com/hotrooibos
;

#MaxThreadsPerHotkey 10
; DisplaySplash("AHK Script standard/generic for D2", 5000)

#HotIf WinActive("Diablo II: Resurrected")
SetTitleMatchMode 3

#Include utils.ahk

userTime := InputBox("Counter time (in second)")
; MsgBox("Value = " userTime.Value,"Test","OK")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MOUSE SHORTCUTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Precast with Middle mouse btn
;
MButton::
{
    ; if (toggle)
    ; {
	; 	Sleep(500)
	; 	SendInput "{F6 up}"
	; 	Sleep(500)
    ; }

	SendInput("w") 				; Switch weapons
	Sleep 600
	SendInput "{F7}"			; ES
	Sleep 600
	SendInput "{F6}"			; Frozen Armor
	Sleep 600
	SendInput("w")

	; Precast (BO duration, cast speed)

	Precast(userTime.Value, 400)

	return
}

; Bind keys for Quick Cast Skills
XButton1::F3												; XButton1 = Bouton précédent
XButton2::F4												; XButton2 = Bouton précédent