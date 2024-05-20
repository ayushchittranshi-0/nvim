#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;to open shortcuts we can use this
;run, %comspec% /c start C:\Users\ayush.chittranshi_pe\qee.lnk,,hide

Send !k
Send !k
Send !k
Send !k
Send !k
Send !k
Send !k

; Check for the value of the 'pc_type' user variable
EnvGet, PCTypeValue, pc_type
; Check if the 'pc_type' variable is set to a specific value
if (PCTypeValue = "work")
{
Send !j
Send !j
Send !j
;RESEARCH WORKSTATION
   Run, cmd.exe /C start chrome "http://127.0.0.1:3000/" "http://127.0.0.1:8000/api/admin/" "http://localhost:6006/"  --start-maximized --new-window --window-name="jv" 
}
else{
Send !j
Send !j
Send !j
   Run, cmd.exe /C start chrome "http://127.0.0.1:3000/" --start-maximized --new-window --window-name="jv" 
}
