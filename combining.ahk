#SingleInstance Force
#InstallKeybdHook
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
repeat(onoff, fire, antistrafe, hope)
{
	
	GUI, 2:Default
	MsgBox % "onoff: "onoff " fire: " fire " antistrafe: " antistrafe " hope: " hope
	While 1>0
	{
		
		
		GetKeyState, KeyIsDown, %onoff%, T
		if (KeyIsDown = "D")
			{
			
			GuiControl,, MyText, on
			
		   

			PixelSearch, OutputVarX, OutputVarY, 955, 537, 965, 542, %hope%, 30, Fast
			if ErrorLevel

				continue
				
			else
					;0 is off 1 is on
					if (antistrafe = 1)
					{
						Send {w down}
						Send {a down}
						Send {s down}
						Send {d down}
						Sleep 100
							
							
						Send %fire%
						Send {w up}
						Send {a up}
						Send {s up}
						Send {d up}
					}
					else
						Send %fire%
					
			}
				
		else
			
			GuiControl,, MyText, off
			continue
	}
}






Gui, 1:New
Gui, Add, Text,cWhite, Outline Color
Gui, Add, DropDownList,vcolor, Purple|Red|Yellow

Gui, Add, Text,cWhite, On/Off Bind
Gui, Add, Hotkey,vonoff, Right, vChosenHotkey

Gui, Add, Text,cWhite, Fire Bind
Gui, Add, Hotkey,vfire, Right, vChosenHotkey

Gui, Add, Text,cWhite, Anti Strafe
Gui, Add, CheckBox,  vantiStrafe

Gui, Color, Black
Gui, Add, Button,,old
Gui, Add, Button,,Save

Gui, Show,, My Test

Gui, 2:New
CustomColor := "FFFFFF"
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, %CustomColor%
Gui, Font, s32
Gui, Add, Text, vMyText cLime, XX  ; XX & YY serve to auto-size the window.
WinSet, TransColor, %CustomColor% 150
Return



ButtonSave:
Gui, 2:Show, x1800 y540 NoActivate
dict := {"Purple":"0xff6aff", "Red":"0xB82c29", "Yellow":"0xA5A528"}
keyOpposites := {"w":"s", "a":"d", "s":"w", "d":"a"}
Gui, Submit, Nohide

;deletes all the previous stuff
IniDelete, configsettings, color
IniDelete, configsettings, onoff
IniDelete, configsettings, fire
IniDelete, configsettings, antistrafe

;writes the new settings to configsettings
IniWrite, %color% ,configsettings, color
IniWrite, %onoff% ,configsettings, onoff
IniWrite, %fire% ,configsettings, fire
IniWrite, %antistrafe% ,configsettings, antistrafe





SoundBeep, 750, 10
CoordMode, Pixel, Screen
GUI, 2:Default
MsgBox, a %onoff%
repeat(onoff,fire,antistrafe,hope)

Buttonold:
Gui, 2:Show, x1800 y540 NoActivate
IniRead, color, configsettings, color
IniRead, onoff, configsettings, onoff
IniRead, fire, configsettings, fire
IniRead, antistrafe, configsettings, antistrafe
dict := {"Purple":"0xff6aff", "Red":"0xB82c29", "Yellow":"0xA5A528"}
hope := dict[""color]
repeat(onoff,fire,antistrafe,hope)
MsgBox % "onoff: "onoff " fire: " fire " antistrafe: " antistrafe " hope: " hope

	






