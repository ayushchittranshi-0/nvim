#!/bin/bash

# Array of directories
directories=(
    "~/.config/nvim"
    # Add more directories as needed
)

# Function to copy text to clipboard using xclip
copy_to_clipboard() {
    local text="$1"
    if command -v xclip &> /dev/null; then
        echo "$text" | xclip -selection clipboard
    else
        echo "Error: xclip is not installed. Please install xclip to use this feature."
    fi
}
# Function to run commands if user inputs "yes"
run_commands() {
    echo "Running commands..."
    # Add your commands here
    # Example:
    git pull
    git add .
    read -p "Enter commit message (press Enter to use default): " custom_message
    current_date_time=$(date +"%Y-%m-%d %I:%M %p")
    system_name=$(hostname)
    commit_message=${custom_message:-"Auto commit on $current_date_time from $system_name"}
    echo -e "\e[1;33mCommitting with message:\e[0m $commit_message"
    git commit -m "$commit_message"
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

    echo -e "\e[1;34mChecking directory:\e[0m $expanded_dir"
    cd "$expanded_dir" || { echo "Failed to change directory to $expanded_dir"; continue; }

    # Run git status
    git status
    
    # Ask for user input
    read -p "Do you want to run the commands for this directory? (y/n): " user_input
    
    if [[ "$user_input" == "y" ]]; then
        run_commands
    else
        # Ask for further action if user inputs "no"
        read -p "Do you want to continue to the next directory (c), copy path to clipboard (e), or just exit (x)? (c/e/x, press Enter to continue): " action_input
        action_input=${action_input:-c}  # Default to "c" if input is empty
        case "$action_input" in
            c|C)
                echo "Continuing to next directory..."
                continue
                ;;
            e|E)
                echo "Copying directory path to clipboard: $expanded_dir"
                copy_to_clipboard "$expanded_dir"
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

