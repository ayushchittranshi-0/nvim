﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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
   ;RESEARCH WORKSTATION
   Run, cmd.exe /C start chrome "dev.to" "medium.com" --start-maximized --new-window --window-name="j1" 
   Run, cmd.exe /C start chrome "chatgpt.peerxp.com" --start-maximized --new-window --window-name="jgpt" 
   Run, cmd.exe /C start chrome "youtube.com" --start-maximized --new-window --window-name="jy" 
   Sleep 4000
   Send !j
   ;PEN WORKSTATION
   Run, cmd.exe /C wt --maximized nt -p "jbuntu"  --title "j2" 
   Run, cmd.exe /C start chrome "peerxp.vegaops.com" --start-maximized --new-window --window-name="jit" 
   Sleep 4000
   Send !j
   ;REFERENCE WORKSTATION
   Run, cmd.exe /C start chrome "google.com" --start-maximized --new-window --window-name="j3" 
   Run, cmd.exe /C start chrome "https://www.notion.so/peerxp/d8a21dc4d75a4eb4ac3991fac56d8dc8?v=dbb336bf51ec4e80b2277f34efcbbfc4" --start-maximized --new-window --window-name="jon"
   Run, cmd.exe /C start chrome "hr.peerxp.com" "gmail.com" --start-maximized --new-window --window-name="jmm"
   Run, cmd.exe /C start chrome "app.clickup.com" --start-maximized --new-window --window-name="jcl"
   Run, C:\Users\ayush.chittranshi_pe\AppData\Local\slack\slack.exe
   Sleep 4000
   Send !j
   ;Run, cmd.exe /C start firefox "http://127.0.0.1:3000/" "http://localhost:6006/" "http://127.0.0.1:8000/api/admin"
   ;VIEW WORKSTATION
   Run, cmd.exe /C start chrome "http://127.0.0.1:3000/" "http://localhost:6006/"  "http://127.0.0.1:8000/api/admin/" --start-maximized --new-window --window-name="j4" 
   Sleep 4000
   Send !j
   ;NOTES
   Run, cmd.exe /C wt --maximized nt -p "jbuntu"  --title "j5" 
   Sleep 4000
   Send !j
   ;PLAYGROUND
   Run, cmd.exe /C wt --maximized nt -p "jbuntu"  --title "j6"
   Sleep 4000
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k

}
else
{
   ;RESEARCH WORKSTATION
   Run, cmd.exe /C start chrome "dev.to" "medium.com" --start-maximized --new-window --window-name="1" 
   Run, cmd.exe /C start chrome "chat.openai.com" --start-maximized --new-window --window-name="gpt" 
   Sleep 4000
   Send !j
   ;PEN WORKSTATION
   Run, cmd.exe /C wt --maximized nt -p "jbuntu"  --title "2" 
   Run, cmd.exe /C start chrome "github.com" --start-maximized --new-window --window-name="it" 
   Sleep 4000
   Send !j
   ;REFERENCE WORKSTATION
   Run, cmd.exe /C start chrome "google.com" --start-maximized --new-window --window-name="3" 
   Run, cmd.exe /C start chrome "outlook.com" "gmail.com" --start-maximized --new-window --window-name="mm"
   Sleep 4000
   Send !j
   ;VIEW WORKSTATION
   Run, cmd.exe /C start chrome "http://127.0.0.1:3000/" "http://localhost:6006/"  "http://127.0.0.1:8000/api/admin/" --start-maximized --new-window --window-name="4" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C wt --maximized nt -p "jbuntu"  --title "5" 
   Sleep 4000
   Send !j
   ;PLAYGROUND
   Run, cmd.exe /C wt --maximized nt -p "jbuntu"  --title "6"
   Sleep 4000
   Run, cmd.exe /C start chrome "youtube.com" --start-maximized --new-window --window-name="y" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C start chrome "chat.openai.com" --start-maximized --new-window --window-name="gpt" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C start chrome "outlook.com" "gmail.com" --start-maximized --new-window --window-name="mm"
   Sleep 4000
   Send !j
   Run, cmd.exe /C wt --maximized nt -p "jbuntu"  --title "perN" 
   Sleep 4000
   Send !j
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k
}
