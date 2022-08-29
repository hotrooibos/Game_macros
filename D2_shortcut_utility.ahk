;
; AHK v2 beta3 Script for Diablo 2 Resurrected
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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DISPLAY INFOS WINDOW ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MyGui := Gui()
MyGui.SetFont("s20", "Impact")
MyGui.BackColor := "000"
WinSetTransColor("000", MyGui)
MyGui.opt("-Caption +AlwaysOnTop +ToolWindow")
vararr := Map("P", "0", "BO", "120") ; Array contains the gui controls variables names and it values as 0.
For key, val in vararr                                             ; Loop throw vararr array keys and values.
    ; Gui, Add, Text, v%key%, %key% %val%                        ; Add the variable name and it value to the gui.
	MyGui.Add("Text", "cc9d42e", key . ":" . val)
MyGui.Show("NoActivate X420 Y180")  ; NoActivate avoids deactivating the currently active window.

global visibleGui := 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; UTILITY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;	Fast stashing (ctrl clic)
;
^<:: {				            ; On pressing "Ctrl + <"  (" ^ for Ctrl, ^+ for CtrlShift)...
	click			            ; ...simulate a mouse left clic
	Sleep 50
    return
}

;
;	Suspend hotkeys with button ² (under Esc)
;
#SuspendExempt
SC29:: {
	global
	Suspend
    ; Pause

	if (visibleGui = 1) {
		MyGui.Hide()
		visibleGui := 0
	} else {
		MyGui.Show()
		visibleGui := 1
	}
    return
}
#SuspendExempt False


;
;	Switch /players X with Numpad0 + Numpad1/3/5/7/8
;

Numpad0 & Numpad1:: {
	SendInput "{enter}"
	Sleep 50
	SendInput "/players 1"
	Sleep 50
	SendInput "{enter}"
	; GuiControl,, P, P 1
	; GuiCtrl.Value := P
	vararr["P"] := 1
	return
}

Numpad0 & Numpad3:: {
	SendInput "{enter}"
	Sleep 50
	SendInput "/players 3"
	Sleep 50
	SendInput "{enter}"
	players := 3
	; GuiControl,, P, P 3
	vararr["P"] := 3
	return
}

Numpad0 & Numpad5:: {
	SendInput "{enter}"
	Sleep 50
	SendInput "/players 5"
	Sleep 50
	SendInput "{enter}"
	players := 5
	; GuiControl,, P, P 5
	vararr["P"] := 5
	return
}

Numpad0 & Numpad7:: {
	SendInput "{enter}"
	Sleep 50
	SendInput "/players 7"
	Sleep 50
	SendInput "{enter}"
	players := 7
	; GuiControl,, P, P 7
	vararr["P"] := 7
	return
}

Numpad0 & Numpad8:: {
	SendInput "{enter}"
	Sleep 50
	SendInput "/players 8"
	Sleep 50
	SendInput "{enter}"
	players := 8
	; GuiControl,, P, P 8
	MyGui.Value := "lol"
	vararr["P"] := 8
	return
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; CTA precast
global cnt

CtaPrecast(fcr, BoDuration) {
	SendInput("w")                ; Switch weapons
	Sleep 300
	SendInput "{F11}"            ; BATTLE COMMAND
	Sleep fcr
	SendInput "{F11}"            ; BATTLE COMMAND
	Sleep fcr
	SendInput "{F12}"            ; BATTLE ORDER
	Sleep fcr
	SendInput "w"                ; Switch weapons
	Sleep 300
	global cnt := BoDuration
	SetTimer BoTimer, 1000
}

BoTimer() {
	global
	If (cnt = 10) {
		SoundPlay A_WorkingDir . "\beep.mp3"
	}

	; GuiControl,, BO, BO %cnt%

	If (--cnt < 0) {
		SetTimer BoTimer, 0
	}
	return
}

;
;   Status splash screen function
;
; DisplaySplash(msg, duration=1000) {
;     Gui, +AlwaysOnTop -Caption
;     Gui, Font, s20, Verdana
;     Gui, Add, Text,, %msg%
;     Gui, Show, NoActivate Y0
;     Sleep %duration%
;     Gui, Destroy
; }