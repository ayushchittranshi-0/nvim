
#!/bin/bash
source ~/.zshrc

open -na "Google Chrome" --args --new-window "google.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

# Fixed iTerm opening - removed the incorrect heredoc and simplified
osascript -e '
    tell application "iTerm"
        create window with default profile
    end tell'
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "http://vit.localhost:5173/login"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "https://github.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "app.slack.com/client"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "https://claude.ai"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome" --args --new-window "https://google.com"
open -na "Google Chrome" --args --new-window "app.clickup.com"
open -na "Google Chrome" --args --new-window "https://peopleplus.zoho.in/heycampus/zp#home/dashboard"
open -na "Google Chrome" --args --new-window "gmail.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

# Fixed iTerm command with proper AppleScript syntax
osascript -e '
tell application "iTerm"
    activate
    tell current window
        create tab with default profile
        tell current session
            write text "echo -ne \"\033]1;jn\007\""
        end tell
    end tell
end tell'
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1
