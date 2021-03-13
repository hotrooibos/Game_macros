;
;	Auto clic Stardew
;	Lorsque activé, le bouton gauche de la souris est cliqué toutes les secondes
;	Activer/désactiver : touche F9
;

Toggle = 0
#MaxThreadsPerHotkey 10

F9::
{
	Toggle := !Toggle

	If (Toggle and WinActive("ahk_exe Stardew Valley.exe")) then
	{
		SplashTextOn, 150 , 85, AHK Stardew, Toggled On
		WinMove, AHK Stardew, On, 0, 0
		Sleep, 1000
		SplashTextOff

		; Auto mining
		while (Toggle) {
			; Clic souris gauche reste enclenché (leftmousedown)
	    	Click
			Sleep, 1000

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