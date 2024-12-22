import subprocess
import sys
import os

class TmuxSessionManager:
    def __init__(self):
        self.sessions = []

    def kill_window(self,session_name):
        # Execute tmux command to move the first window to the last position
        command = f"pwd"

        # Execute the command using subprocess
        subprocess.run(command, shell=True)

    def is_inside_tmux(self):
        # Check if running inside a tmux client
        result = subprocess.run(['bash', '-c', '[ -z "${TMUX}" ] && echo "not in tmux"'], capture_output=True)
        if result.returncode == 0 and result.stdout.strip() == b'not in tmux':
            print('Script is not running inside a tmux session.')
            return False
        else:
            print('Script is running inside a tmux session')
            return True

    def create_session(self, session_name, windows,path):
        # change directory to path variable
        print("path is"+path)
        os.chdir(path)
        # Check if the session already exists and switch to it i.e. dont make new one
        if self.is_session_open(session_name):
            self.switch_to_session(session_name)

        else:


            subprocess.run(['tmux', 'new-session', '-d', '-s', session_name])

            # Create windows and run commands
            for window in windows:
                window_name = window['name']
                commands = window['commands']

                # Create a new window
                command = ["tmux", "list-windows", "-t", session_name]
                output = subprocess.check_output(command).decode("utf-8")
                subprocess.run(['tmux', 'new-window', '-a', '-t', session_name, '-n', window_name])

                # Run commands in the window
                for command in commands:
                    subprocess.run(['tmux', 'send-keys', '-t', f'{session_name}:{window_name}', command, 'Enter'])

            #closing first window
            command1 = f"tmux rename-window -t {session_name}:1 'default'"
            subprocess.run(command1, shell=True)

            command3 = f"tmux kill-window -t {session_name}:default"
            subprocess.run(command3, shell=True)

            # self.move_first_window_to_last(session_name)

            # self.kill_window(session_name)
            self.switch_to_session(session_name)

    def is_session_open(self, session_name):
        # Check if the session exists
        result = subprocess.run(['tmux', 'has-session', '-t', session_name], capture_output=True)
        return result.returncode == 0

    def switch_to_session(self, session_name):
        # Switch to the specified session
        if self.is_inside_tmux():
            subprocess.run(['tmux', 'switch-client', '-t', session_name])
        else:
            subprocess.run(['tmux', 'attach', '-t', session_name])

if __name__ == '__main__':

    variable_name = "pc_type"

    # Attempt to read the environment variable
    value = os.environ.get(variable_name)
    # Define your sessions and windows here
    sessions = [
            {
                'name': 'jexamx',
                'path': '/Users/ayushchittranshi/Developer/jExamx',
                'windows': [
                    {
                        'name': 'nvim',
                        'commands': [
                            'cd /Users/ayushchittranshi/Developer/jExamx',
                            'nvim src',
                        ]
                    },
                    {
                        'name': 'git',
                        'commands': [
                        ]
                    },
                    {
                        'name': 'frontend-server',
                        'commands': [
                            'cd /Users/ayushchittranshi/Developer/jExamx',
                            'npm run dev',
                        ]
                    },
                ]
            },
        {
            'name': 'ntw',
            'path': ("/Users/ayushchittranshi/Dropbox/DropsyncFiles/Notes Work" if value == 'work' else "/home/maughamc/Notes Work" if value == 'personal-ubuntu' else ""),
            'windows': [
                {
                    'name': 'wiki',
                    'commands': [
                        'nvim index.md',
                    ]
                },
            ]
        },
        {
            'name': 'ntp',
            'path': ("/home/maughamc/Notes Personal" if value == 'personal-ubuntu' else ""),
            'windows': [
                {
                    'name': 'wiki',
                    'commands': [
                        ('XDG_CONFIG_HOME=~/Writer/.config/ XDG_DATA_HOME=~/Writer/.local/ XDG_CACHE_HOME=~/Writer/.cache/ nvim index.md' if value == 'personal-ubuntu' else "nvim index.md"),
                    ]
                },
            ]
        },
        {
            'name': 'vimconfig',
            'path': ("/Users/ayushchittranshi/.config/nvim" if value == 'work' else  "/home/maughamc/.config/nvim" if value == 'personal-ubuntu' else  ""),
            'windows': [
                {
                    'name': 'nvim',
                    'commands': [
                        'nvim',
                    ]
                },
                {
                    'name': 'git',
                    'commands': [
                    ]
                },
            ]
        },
        {
            'name': 'vimwriterconfig',
            'path': ("" if value == 'work' else  "/home/maughamc/Writer/.config/nvim" if value == 'personal-ubuntu' else  ""),
            'windows': [
                {
                    'name': 'nvim',
                    'commands': [
                        'nvim',
                    ]
                },
                {
                    'name': 'git',
                    'commands': [
                    ]
                },
            ]
        },
        {
            'name': 'new',
            'path': ".",
            'windows': [
                {
                    'name': 'nvim',
                    'commands': [
                        'nvim'
                    ]
                },
                {
                    'name': 'git',
                    'commands': [
                    ]
                },
                {
                    'name': 'frontend-server',
                    'commands': [
                    ]
                },
            ]
        }
    ]

    # Create an instance of the TmuxSessionManager
    manager = TmuxSessionManager()

    # Parse the command-line argument
    if len(sys.argv) == 2 or len(sys.argv) == 3:
        if len(sys.argv) == 3:
            command = sys.argv[1]
        # If command is 'new' but no additional name is provided or improperly used
            if command == '-new':
                if len(sys.argv) == 3:

                    new_session_name = None
                    if sys.argv[2] == ".":
                        current_folder_name = os.path.basename(os.getcwd())
                        new_session_name = current_folder_name
                    else:
                        new_session_name = sys.argv[2]  
                    manager = TmuxSessionManager()

                    
                    # Prompt the user for confirmation
                    confirm = input(f"Are you sure you want to create a new session with the current path? (Press Enter to confirm): ")
                    if confirm == '':
                        for session in sessions:
                            if session['name'] == new_session_name:
                                print('Cannot have the same name with preprepared config')
                                sys.exit(1)  # Abort execution
                        for session in sessions:
                            if session['name'] == "new":
                                manager.create_session(new_session_name ,session['windows'],session['path'])
                                break
                    else:
                        print('Aborting script.')
                        sys.exit(1)  # Abort execution
                else:
                    print('Error: Incorrect usage of "-new". To create a new session, use "python3 tmux-py.py -new <sessionName>".')
                    sys.exit(1)  # Abort execution
            else:
                print("Invalid arguments")
                sys.exit(1)  # Abort execution

        command = sys.argv[1]
        if command == 'new':
            print("Invalid session name")
        # Specify the name of the environment variable you want to read
        variable_name = "pc_type"

        # Attempt to read the environment variable
        value = os.environ.get(variable_name)

        # Check if the environment variable exists
        if value is not None:
            print(f"The value of {variable_name} is: {value}")
        else:
            print(f"The environment variable {variable_name} is not set.")
        session_name = sys.argv[1]
        for session in sessions:
            if session['name'] == session_name:
                manager.create_session(session_name ,session['windows'],session['path'])
                break
    else:
        print('Please provide a session name as an argument.')
