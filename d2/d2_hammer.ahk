;
; AHK v2 beta3 Script for Diablo 2 Resurrected
; Author : https://github.com/hotrooibos
;

#MaxThreadsPerHotkey 10
; DisplaySplash("AHK Script for HAMMERDIN`n- Auto attack (Middle mouse)`n- Auto select auras`n- Precast sequence (CTA...)`n- Fast stashing (ctrl + < = ctrl + Left click)", 5000)

#HotIf WinActive("Diablo II: Resurrected")
SetTitleMatchMode 3

#Include utils.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; BINDS INFO ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Teleport = F1
; Concentration = F2
; Vigor = F3
; Cleansing = F6
; Prayer (or Defiance, triggered while teleporting) = F8
; Holy Shield = F10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MOUSE SHORTCUTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global toggle := 0
global activeCleansing := 0



;
; Precast
;
MButton:: {
    if (toggle) {
		Sleep 500
		SendInput "{F1 up}"
		Sleep 500
    }
    
    CtaPrecast(500, 160)
	SendInput "{F10}"                ; HOLY SHIELD
    return
}



~F1:: {
    if (!KeyWait("F1", "T2")) {  ; If F1 is pressed more than 2s ("long" press), switch to cleansing to run faster.
        global activeCleansing := 1
    }
    return
}

~F1 up:: {
    global
    if (activeCleansing = 1) {  ; If F1 is pressed more than 2s ("long" press), switch to cleansing to run faster.
        SendInput "{F6}"                ; CLEANSING aura
        activeCleansing := 0
    }
    return
}


;
; LEFT MOUSE BTN
; - Cancel any running autoattack
; - Switch to VIGOR aura if pressed 1s
;
~LButton:: {
    if (toggle) {
        SwitchToggle()                  ; Cancel toggle attacking if activated
    }

    if (!KeyWait("LButton", "T1")) {  ; If LButton is pressed more than 1s ("long" press) (ie. we are running), switch to vigor to run faster.
        SendInput "{F3}"                ; VIGOR aura
    }
    return
}

; - Auto select Concentration aura when attacking (Shift + Left clic)
LShift & ~LButton:: {
	SendInput "{F2}"                    ; CONCENTRATION aura
    return
}



;
; SPECIAL MOUSE BTNS
; - Auto attacking (simulate Shift+Left clic)
;
; Manual
~XButton1:: {
	SendInput "{F2}"                      ; CONCENTRATION aura
    SendInput "{LShift down}"             ; Only if Hammer. Comment if Smite.
    SendInput "{LButton down}"
    return
}

~XButton1 up:: {
    SendInput "{LShift up}"
    SendInput "{LButton up}"
    return
}
    
; Toggle
~XButton2:: {
    SendInput "{F2}"                      ; CONCENTRATION aura
    SwitchToggle()
    
    if (toggle) {
        Attack()
    }
    return
}


;
;   Switch toggle function
;
SwitchToggle() {
    global toggle
    toggle := !toggle
    ; DisplaySplash("Autoattack " . toggle)
}

; Attack function
; Params: 1=attacking, 0=release
Attack() {
    global toggle                   ; Use toggle global variable

    SendInput "{LShift down}"

    while (toggle) {                ; Attacking in a loop in order to resume attacking if interrupted (hit recovery...)
        if (!toggle) {
            break
        }
        
        ; If we are not teleporting
        If (!getkeystate("RButton", "P")) {
            ; Hold Shift+Lclick down to D2 window only
            SendInput "{LShift down}"
            ; SoundPlay *-16
            Sleep 100
        }
    }

    SendInput "{LShift up}"
    SendInput "{LButton up}"
}