;
; AHK v1 script for Terraria
; Author : https://github.com/hotrooibos
;
; Auto mining
; Lorsque activé, le bouton gauche de la souris est enclenché, et avance lentement vers la droite
; Activer/désactiver : touche F9
;

Toggle = 0
#MaxThreadsPerHotkey 10

F9::
{
	Toggle := !Toggle

	If (Toggle and WinActive("ahk_exe Terraria.exe")) then
	{
		SplashTextOn, 150 , 85, AHK Terraria, Toggled On
		WinMove, AHK Terraria, On, 0, 0
		Sleep, 1000
		SplashTextOff

		; Auto mining
		while (Toggle) {
			; Clic souris gauche reste enclenché (leftmousedown)
	    	Click down
			    ; Laisse appuyé la touche "d" par à-coups (avancer vers la droite)
				; Sendinput, {d down}
			 ;    Sleep, 70
				; Sendinput, {d up}
				; Sleep, 200

			; Lorsque le toggle est désactivé
			If (!Toggle) {
		   		; Replace les keys dans leur position normale/par défaut
		    	Click up
	        	Break ; sort de l'auto mining
			}
		}




	} Else {
		SplashTextOn, 150 , 85, AHK Terraria, Toggled Off
		WinMove, AHK Terraria, Off, 0, 0
		Sleep, 1000
		SplashTextOff
	}
}



Return