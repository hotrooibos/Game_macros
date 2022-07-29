;
; AHK v2
; Author : https://github.com/hotrooibos
;
; Utility script for Stardew Valley :
; - Press F9 to toggle auto click (used in Casino/Calico spin)
; - Press "t" to pause game (auto type /pause in SDV console, useful for multiplayer)
;


#MaxThreadsPerHotkey 10

#HotIf WinActive("Stardew Valley")
SetTitleMatchMode 1


;
; Auto click toggle
;
global toggle := 0				; init disabled

F9:: {
	global toggle := !toggle	; change toggle position

	while (toggle) {
		SendEvent "{Click}"		; left click (classic way)
		Sleep 1000

		; break if toggle statut changed (F9 pressed again)
		If (!toggle) {
			Click "Up"
			break
		}
	}

	return
}


;
; Pause game
;
~t:: {
    Sleep 100
    Send "/pause"
    Sleep 100
    SendInput "{enter}"
    return
}


;
;	Fast stashing (ctrl clic)
;
^<:: {				            ; On pressing "Ctrl + <"  (" ^ for Ctrl, ^+ for CtrlShift)...
	SendEvent "{Click}"			; left click (classic way)
	Sleep 50
    return
}