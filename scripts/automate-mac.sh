
#!/bin/bash
source ~/.zshrc

open -na "Google Chrome Beta" --args --new-window "google.com"
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

open -na "Google Chrome Beta" --args --new-window "http://vit.localhost:5173/login"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome Beta" --args --new-window "https://github.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Slack"
sleep 5
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome Beta" --args --new-window "https://claude.ai"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1

open -na "Google Chrome Beta" --args --new-window "app.clickup.com"
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 2

# Fixed iTerm command with proper AppleScript syntax
osascript -e '
    tell application "iTerm"
        create window with default profile
    end tell'
sleep 2
osascript -e 'tell application "System Events" to keystroke "n" using option down'
sleep 1
