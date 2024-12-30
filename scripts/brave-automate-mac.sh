
#!/bin/bash

open -na "Brave Browser" --args --new-window "google.com"
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

open -na "Brave Browser" --args --new-window "http://localhost:3000/"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

open -na "Brave Browser" --args --new-window "https://github.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1


open -na "Brave Browser" --args --new-window "https://discord.com/channels/@me"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

open -na "Brave Browser" --args --new-window "https://chatgpt.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "j" using option down'
sleep 1

open -na "Brave Browser" --args --new-window "https://google.com"
open -na "Brave Browser" --args --new-window "outlook.com"
open -na "Brave Browser" --args --new-window "gmail.com"
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
