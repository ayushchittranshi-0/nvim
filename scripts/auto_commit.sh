#!/bin/bash

# Array of directories
directories=(
    "~/Desktop"
    "~/.config/nvim"
    # Add more directories as needed
)

# Function to run commands if user inputs "yes"
run_commands() {
    echo "Running commands..."
    # Add your commands here
    # Example:
    git pull
    git add .
    current_date_time=$(date +"%Y-%m-%d %I:%M %p")
    git commit -m "Auto commit on $current_date_time"
    git push
}

# Loop through each directory
for dir in "${directories[@]}"; do
    # Expand the ~ to the full home directory path
    if [[ $dir == ~* ]]; then
        expanded_dir="${dir/#\~/$HOME}"
    else
        expanded_dir="$dir"
    fi

    echo "Checking directory: $expanded_dir"
    cd "$expanded_dir" || { echo "Failed to change directory to $expanded_dir"; continue; }

    # Run git status
    git status
    
    # Ask for user input
    read -p "Do you want to run the commands for this directory? (y/n): " user_input
    
    if [[ "$user_input" == "y" ]]; then
        run_commands
    else
        # Ask for further action if user inputs "no"
        read -p "Do you want to continue to the next directory (c), exit to this directory (e), or just exit (x)? (c/e/x): " action_input
        action_input=${action_input:-c}  # Default to "c" if input is empty
        case "$action_input" in
            c|C)
                echo "Continuing to next directory..."
                continue
                ;;
            e|E)
                echo "Exiting to directory: $expanded_dir"
                exit
                ;;
            x|X)
                echo "Exiting script..."
                exit
                ;;
            *)
                echo "Invalid input. Exiting script..."
                exit
                ;;
        esac
    fi
done

echo "Auto commit completed."

