#!/bin/bash

# Array of directories
directories=(
    "~/.config/nvim"
    "~/Writer"
    # Add more directories as needed
)

# Array of shutdown directories
shutdown_directories=(
    "/home/maughamc/Developer/learn-topics"
    # Add more shutdown directories as needed
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
# Function to get non-hidden directories 1 level deep
get_children_directories() {
    local parent_dir="$1"
    find "$parent_dir" -maxdepth 1 -mindepth 1 -type d ! -name ".*"
}

# Check if the script was run with the "." or "sd" parameter
if [[ "$1" == "." ]]; then
    directories=(".")
elif [[ "$1" == "sd" ]]; then
    directories=()
    for shutdown_dir in "${shutdown_directories[@]}"; do
        # Expand the ~ to the full home directory path
        if [[ $shutdown_dir == ~* ]]; then
            expanded_shutdown_dir="${shutdown_dir/#\~/$HOME}"
        else
            expanded_shutdown_dir="$shutdown_dir"
        fi
        # Get children directories and add them to directories array
        mapfile -t children_dirs < <(get_children_directories "$expanded_shutdown_dir")
        directories+=("${children_dirs[@]}")
    done
fi

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

    # Run git status and capture the output
    git_status_output=$(git status 2>&1)

    # Check if the directory is not a git repository
    if echo "$git_status_output" | grep -q "not a git repository"; then
        echo -e "\e[1;31m$dir is not a git repository.\e[0m"
        read -p "Do you want to exit the script? (y/n): " exit_input
        if [[ "$exit_input" == "y" ]]; then
            echo "Copying directory path to clipboard and exiting..."
            wl-copy "$dir"
            exit
        else
            echo "Continuing to the next directory..."
            continue
        fi
    fi

    # Check if the branch is up to date and there are no changes
    if echo "$git_status_output" | grep -q "Your branch is up to date" && ! echo "$git_status_output" | grep -q "Changes not staged for commit"; then
        echo -e "\e[1;32mSkipping directory:\e[0m $dir (branch is up to date and no unstaged changes)"
        continue
    fi
    echo "$git_status_output"
    
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
                wl-copy "$expanded_dir"
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

