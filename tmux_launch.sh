#!/bin/bash

# Define an array of sessions with their window names and commands
sessions=(
    "Session1:Window1:Command1;Window2:Command2"
    "Session2:Window1:Command1"
    # Add more sessions as needed
)

# Function to create tmux sessions and windows
create_tmux_sessions() {
    for session_info in "${sessions[@]}"; do
        IFS=':' read -r -a session_windows <<< "$session_info"

        # Check if a session with the given name already exists
        # if ! tmux has-session -t "${session_windows[0]}" 2>/dev/null; then
            # Create a new tmux session
            tmux new-session -d -s "${session_windows[0]}"
        # fi

        # Shift to the session and create windows
        # tmux switch-client -t "${session_windows[0]}"
        for ((i = 1; i < ${#session_windows[@]}; i+=2)); do
            window_name="${session_windows[i]}"
            window_command="${session_windows[i+1]}"
            tmux new-window -n "$window_name"
            tmux send-keys "$window_command" C-m
        done
    done
    tmux attach -t "Session1"
}

# Start the tmux sessions
create_tmux_sessions

