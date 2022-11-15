;
; AHK v2 beta3 Script for Diablo 2 Resurrected
; Author : https://github.com/hotrooibos
;

#MaxThreadsPerHotkey 10
; DisplaySplash("AHK Script POISONMANCER for D2", 5000)

#HotIf WinActive("Diablo II: Resurrected")
SetTitleMatchMode 3

#Include utils.ahk


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MOUSE SHORTCUTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Precast
;
; Precast
MButton:: {
	CtaPrecast(500, 160)
	SendInput "{F10}"		; BONE ARMOR
	return
}

~F1 up:: {
	SendInput "{F8}"		; LOWER RESIST
	return
}