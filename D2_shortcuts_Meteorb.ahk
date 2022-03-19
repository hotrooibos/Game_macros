;
; AHK v2 beta3 Script for Diablo 2 Resurrected
; Author : https://github.com/hotrooibos
;

#MaxThreadsPerHotkey 10
; DisplaySplash("AHK Script METEORB for D2", 5000)

#HotIf WinActive("Diablo II: Resurrected")
SetTitleMatchMode 3

#Include D2_shortcut_utility.ahk


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MOUSE SHORTCUTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Bind keys for Quick Cast Skills
XButton1::F3				; XButton1 = Bouton précédent
XButton2::F4				; XButton2 = Bouton précédent



; Precast
MButton:: {
	CtaPrecast(500, 160)
	SendInput "{F10}"		; FROZEN ARMOR
	return
}


;
; Auto cast untimed skill while casting a timed one with Shift pressed
; Ex : spamming Static Field while casting Frozen Orb
;
~Shift:: {
	; F1 = untimed skill
	while GetKeyState("LButton", "P") {
		SendInput "{F1}"
		Sleep(600)
	}
	return
}