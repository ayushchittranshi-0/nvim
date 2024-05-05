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
   Run, cmd.exe /C start firefox "http://127.0.0.1:3000/" "http://localhost:6006/" "http://127.0.0.1:8000/api/admin"
   Run, cmd.exe /C start chrome "http://127.0.0.1:3000/" "http://localhost:6006/"  "http://127.0.0.1:8000/api/admin/" --new-window --window-name="fvw1" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jww2" 
   Run, cmd.exe /C start chrome "peerxp.vegaops.com" --new-window --window-name="fg" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C start chrome "dev.to" "medium.com" --new-window --window-name="frw3" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C start chrome "google.com" --new-window --window-name="frw4" 
   Run, cmd.exe /C start chrome "chatgpt.peerxp.com" --new-window --window-name="fc" 
   Sleep 4000
   Send !j
   Run, C:\Users\ayush.chittranshi_pe\AppData\Local\slack\slack.exe
   Run, cmd.exe /C start chrome "https://www.notion.so/peerxp/d8a21dc4d75a4eb4ac3991fac56d8dc8?v=dbb336bf51ec4e80b2277f34efcbbfc4" --new-window --window-name="fno5"
   Run, cmd.exe /C start chrome "hr.peerxp.com" "gmail.com" --new-window --window-name="fhr fgmail"
   Run, cmd.exe /C start chrome "app.clickup.com" --new-window --window-name="fck"
   Sleep 4000
   Send !j
   Run, cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jntww6" 
   Sleep 2000
   Send !j
   Run, cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jpgw7"
   Sleep 2000
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k

}
else
{
   ;Run, cmd.exe /C start firefox "http://127.0.0.1:3000/" "http://localhost:6006/" "http://127.0.0.1:8000/api/admin"
   Run, cmd.exe /C start chrome "http://127.0.0.1:3000/" --new-window --window-name="fvw1" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C wt --maximized nt -p "Ubuntu"  --title "jpgw2"
   Run, cmd.exe /C start chrome "github.com" --new-window --window-name="fg" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C start chrome "dev.to" "medium.com" --new-window --window-name="frw3" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C start chrome "google.com" --new-window --window-name="frw4" 
   Run, cmd.exe /C start chrome "chat.openai.com" --new-window --window-name="fc" 
   Run, cmd.exe /C start chrome "youtube.com" --new-window --window-name="fy" 
   Sleep 4000
   Send !j
   Run, cmd.exe /C start chrome "gmail.com" "outlook.com" --new-window --window-name="fmw5"
   Sleep 4000
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k
   Send !k

}
