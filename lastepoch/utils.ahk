;
; AHK v2 beta14 Script for LAST EPOCH
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
<::click

+<::
{
	SendInput "{Shift down}{RButton}"
	Sleep(100)
	SendInput "{Shift up}"

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