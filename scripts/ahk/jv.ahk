#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;to open shortcuts we can use this
;run, %comspec% /c start C:\Users\ayush.chittranshi_pe\qee.lnk,,hide

; Check for the value of the 'pc_type' user variable
EnvGet, PCTypeValue, pc_type
; Check if the 'pc_type' variable is set to a specific value
if (PCTypeValue = "work")
{
;RESEARCH WORKSTATION
   Run, cmd.exe /C start msedge "http://127.0.0.1:3000/" --start-maximized --new-window --window-name="jv" 
}
else{
   Run, cmd.exe /C start msedge "http://127.0.0.1:3000/" --start-maximized --new-window --window-name="jv" 
}
