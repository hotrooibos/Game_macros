;
; AHK v2 script for Path of Exile
; Author : https://github.com/hotrooibos
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


#MaxThreadsPerHotkey 10

#HotIf WinActive("Path of Exile")
SetTitleMatchMode 3


;
;	Suspend hotkeys with button ² (under Esc)
;
#SuspendExempt
SC29::
{
	Suspend
    return
}
#SuspendExempt False


;
;	Fast stashing (ctrl clic)
;
; On pressing "Ctrl + <"  (" ^ for Ctrl, ^+ for CtrlShift)...
; ...simulate a mouse left clic
^<:: {
	; SoundPlay A_WorkingDir . "\beep.mp3"
	Click
	Sleep 50
	return
}


;
;	CHICKEN : on Mbutton clic, send alt+F4
;
XButton1:: {
	; SoundPlay A_WorkingDir . "\beep.mp3"
	SendInput "!{F4}"
	return
}


;
;	FLASKS trigger
;

; Key 1 shortcuts
; SC002:: {
; 	SendInput "{SC002}"	; touche & (1)
; 	Sleep 150

; 	SendInput "{SC003}"	; touche é (2)
; 	Sleep 210

; 	SendInput "{SC004}"	; touche " (3)
; 	Sleep 120

; 	SendInput "{SC005}"	; touche ' (4)
; 	Sleep 120

; 	SendInput "{SC006}"	; touche ' (5)
; 	return
; }

; Key 2 shortcut
; SC003:: {
; 	SendInput "{a}"
; 	Sleep 30
; 	SendInput "{z}"
; 	Sleep 120
; 	return
; }






;
; 3.20-21
;

;
; Pathfinder auto life flask every 5.20s
;
; global FireLifeFlask := false

; SC002:: {
; 	global
; 	FireLifeFlask := !FireLifeFlask

; 	While (FireLifeFlask == true) {
; 		ControlSend "{SC002}",, "Path of Exile"
; 		Sleep 5200
; 	}

; return
; }

;
; Auto trigger Guard skill (Molten Shell, IC, Steelskin...) when firing another skill 
;
~z::
~a:: {
		While (GetKeyState("a", "P")) or (GetKeyState("z", "P")) {		; 
		SendInput "{r down}"			; Fire the guard skill
		; Sleep 500
		SendInput "{t down}"			; Fire the guard skill
		; Sleep 1000
	}
	
	SendInput "{r up}"					; Release EC key
	SendInput "{t up}"					; Release EC key
return
}





;
; 3.19 KALANDRA
;


;
; RF build - auto trigger Enduring Cry (EC) while moving
;
; ~LButton:: {
; 	While (GetKeyState("LButton", "P")) {
; 		if (!KeyWait("LButton", "T0.5")) {  ; If LButton is pressed more than 0.5s ("long" press)
; 			SendInput "{r down}"			; Keep spamming EC
; 			Sleep 1000
; 		}
; 	}
; 	SendInput "{r up}"						; Release EC key
; return
; }


;
; Auto triggers General's Cry (GC) while doing main attack (Shift + left clic)
;
; ~SHIFT::
; 	; SendInput "{a} 						; Send this key once

; 	if GetKeyState("LButton", "P") { 		; If maintaining Shift + left clic pressed
; 		SendInput {t down} 					; Keep spamming GC
; 		Sleep 1000
		
; 		SendInput "{r}						; Activate Berserk (2s later, in order to gain Rage with GC)
; 		; Sleep 100
; 		; Send (e)							; Activate Blood Rage
; 	}
; return

; ~LButton up::
; 	SendInput {t up}
; return