#!/bin/bash

open -na "Google Chrome" --args --new-window "google.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

osascript <<EOF
tell application "iTerm2"
     create window with default profile
     tell current session of current window
          write text "echo -ne '\\\e]1;jj\\\a'"
      end tell
end tell
EOF
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "http://vit.localhost:5173/login"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "https://github.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1


open -na "Google Chrome" --args --new-window "app.slack.com/client"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "https://claude.ai"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "https://google.com"
open -na "Google Chrome" --args --new-window "app.clickup.com"
open -na "Google Chrome" --args --new-window "https://peopleplus.zoho.in/heycampus/zp#home/dashboard"
open -na "Google Chrome" --args --new-window "gmail.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

osascript <<EOF
tell application "iTerm2"
     create window with default profile
     tell current session of current window
          write text "echo -ne '\\\e]1;jn\\\a'"
      end tell
end tell
EOF
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1
