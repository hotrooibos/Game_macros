;
; AHK v2 beta3 Script for Diablo 2 Resurrected
; Author : https://github.com/hotrooibos
;

#MaxThreadsPerHotkey 10
; DisplaySplash("AHK Script standard/generic for D2", 5000)

; #HotIf WinActive("Diablo II: Resurrected")
; SetTitleMatchMode 3

#Include D2_shortcut_utility.ahk


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

	; Precast
	Precast(25, 400)

	SendInput "{F10}"										; HOLY SHIELD, FROZEN ARMOR, BONE ARMOR...
	return
}

; Bind keys for Quick Cast Skills
XButton1::F3												; XButton1 = Bouton précédent
XButton2::F4												; XButton2 = Bouton précédent