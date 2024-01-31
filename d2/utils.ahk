;
; AHK v2 beta14 Script for Diablo 2 Resurrected
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


MyGui := Gui()
MyGui.SetFont("s20", "Consolas")
MyGui.BackColor := "000"
WinSetTransColor("000 200", MyGui)
MyGui.Opt("-Caption +AlwaysOnTop +ToolWindow")

global visibleGui := 0



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; UTILITY ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
;	Fast stashing (ctrl clic)
;
<::
^<::
{
	click
	Sleep 100
    return
}


;
;	Suspend hotkeys with button ² (under Esc)
;
#SuspendExempt
SC29::
{
	global
	Suspend
    ; Pause

	if (visibleGui = 1)
	{
		MyGui.Hide()
		visibleGui := 0
	}
	else
	{
		MyGui.Show()
		visibleGui := 1
	}
    return
}
#SuspendExempt False



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; FUNCTIONS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; CTA precast
global cnt
; Warning : 
global guiTexts := MyGui.Add("Text", "cc9d42e w500", "BO -")

Precast(BoDuration, CastSpeed)
{
	global

	MyGui.Show("NoActivate X80 Y30")	; NoActivate avoids deactivating the currently active window		

	; SendInput("w")                ; Switch weapons
	; Sleep 300
	; SendInput "{F11}"            ; BATTLE COMMAND
	; Sleep fcr
	; SendInput "{F11}"            ; BATTLE COMMAND
	; Sleep fcr
	; SendInput "{F12}"            ; BATTLE ORDER
	; Sleep fcr
	; SendInput "w"                ; Switch weapons
	; Sleep 300
	
	cnt := BoDuration
	SetTimer BoTimer, 1000
}

BoTimer()
{
	global

	guiTexts.Value := "BO " . cnt

	if (cnt = 20 or cnt < 4)
	{
		SoundPlay A_WorkingDir . "\beep.mp3"
	}

	; if (cnt = 10)
	; {
	; 	splash := Gui()
	; 	splash.BackColor := "fefefe"
	; 	WinSetTransColor("ffffff 100", splash)
	; 	splash.Opt("-Caption +AlwaysOnTop +ToolWindow")
	; 	splash.Show("NoActivate w500 h500")	; NoActivate avoids deactivating the currently active window		
	; }

	if (--cnt < 1)
	{
		SetTimer BoTimer, 0
		MyGui.Hide()
	}

	; DllCall("FlashWindow",MyGui)

	return
}



; ShowHideGui()
; {
; 	global

; 	if (visibleGui = 1)
; 	{
; 		MyGui.Hide()
; 		visibleGui := 0
; 	}
; 	else
; 	{
; 		global guiTexts := MyGui.Add("Text", "cc9d42e", "BO " . cnt)
; 		MyGui.Show("NoActivate X80 Y30")	; NoActivate avoids deactivating the currently active window		
; 		visibleGui := 1
; 	}
;     return
; }




;
;	OFFLINE MODE
;	Switch /players X with Numpad0 + Numpad1/3/5/7/8
;
; Numpad0 & Numpad1:: {
; 	SendInput "{enter}"
; 	Sleep 50
; 	SendInput "/players 1"
; 	Sleep 50
; 	SendInput "{enter}"
; 	; GuiControl,, P, P 1
; 	; GuiCtrl.Value := P
; 	vararr["P"] := 1
; 	return
; }

; Numpad0 & Numpad3:: {
; 	SendInput "{enter}"
; 	Sleep 50
; 	SendInput "/players 3"
; 	Sleep 50
; 	SendInput "{enter}"
; 	players := 3
; 	; GuiControl,, P, P 3
; 	vararr["P"] := 3
; 	return
; }

; Numpad0 & Numpad5:: {
; 	SendInput "{enter}"
; 	Sleep 50
; 	SendInput "/players 5"
; 	Sleep 50
; 	SendInput "{enter}"
; 	players := 5
; 	; GuiControl,, P, P 5
; 	vararr["P"] := 5
; 	return
; }

; Numpad0 & Numpad7:: {
; 	SendInput "{enter}"
; 	Sleep 50
; 	SendInput "/players 7"
; 	Sleep 50
; 	SendInput "{enter}"
; 	players := 7
; 	; GuiControl,, P, P 7
; 	vararr["P"] := 7
; 	return
; }

; Numpad0 & Numpad8:: {
; 	SendInput "{enter}"
; 	Sleep 50
; 	SendInput "/players 8"
; 	Sleep 50
; 	SendInput "{enter}"
; 	players := 8
; 	; GuiControl,, P, P 8
; 	MyGui.Value := "lol"
; 	vararr["P"] := 8
; 	return
; }