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
            'name': 'chaabi',
            'path': '/home/ayush-work/Developer/chaabi-frontend',
            'windows': [
                {
                    'name': 'backends-server',
                    'commands': [
                        'cd /home/ayush-work/Developer/backend/chaabi-backend/',
                        'git pull',
                        'sudo -S <<< " " service docker start',
                        'sleep 10s',
                        'docker kill $(docker ps -q)',
                        'sudo -S <<< " " docker compose  --env-file .docker.env up',
                    ]
                },
                {
                    'name': 'frontend-server',
                    'commands': [
                        'cd /home/ayush-work/Developer/chaabi-frontend/',
                        'BROWSER=none npm start',
                    ]
                },
                {
                    'name': 'code',
                    'commands': [
                        'cd /home/ayush-work/Developer/chaabi-frontend/',
                        'nvim src',
                    ]
                }
            ]
        },
        {
            'name': 'pg',
            'path': "/home/ayush-work/Developer/playground" if value == 'work' else "/home/ayush-pc/Developer/playground",
            'windows': [
                {
                    'name': 'server',
                    'commands': [
                        'cd /home/ayush-pc/Developer/playground/',
                    ]
                },
                {
                    'name': 'editor',
                    'commands': [
                        'cd /home/ayush-pc/Developer/playground/',
                    ]
                },
            ]
        },
    {
        'name': 'ff',
        'windows': [
            {
                'name': 'backends-server',
                    'commands': [
                        'cd /home/ayush-work/Developer/ff/backend',
                        'git pull',
                        'docker kill $(docker ps -q)',
                        'sudo -S <<< " " docker-compose  --env-file .docker.env up',
                    ]
            },
            {
                'name': 'frontend-server',
                'commands': [
                    'cd /home/ayush-work/Developer/ff/react',
                    'npm start',
                ]
            },
            {
                'name': 'code',
                'commands': [
                    'cd /home/ayush-work/Developer/ff/react',
                    'nvim .',
                ]
            }
        ]
    },
    {
        'name': 'avl',
        'windows': [
            {
                'name': 'backends-server',
                'commands': [
                    'cd /home/ayush-work/Developer/almff/backend',
                    'git pull',
                    'docker kill $(docker ps -q)',
                    'sudo -S <<< " " docker-compose  --env-file .docker.env up',
                ]
            },
            {
                'name': 'frontend-server',
                'commands': [
                    'cd /home/ayush-work/Developer/almff/react',
                    'npm start',
                ]
            },
            {
                'name': 'code',
                'commands': [
                    'cd /home/ayush-work/Developer/almff/react',
                    'nvim .',
                ]
            }
        ]
    },
        {
            'name': 'rcl',
            'path': '/home/ayush-work/Developer/react-component-library',
            'windows': [
                {
                    'name': 'storybook-server',
                    'commands': [
                        'cd /home/ayush-work/Developer/react-component-library',
                        'npm run storybook',
                    ]
                },
                {
                    'name': 'code',
                    'commands': [
                        'cd /home/ayush-work/Developer/react-component-library',
                        'nvim src',
                    ]
                }
            ]
        },
        {
            'name': 'ntw',
            'path': "/mnt/c/Users/ayush.chittranshi_pe/Dropbox/Notes Work" if value == 'work' else "/mnt/c/Users/Ayush/Dropbox/Notes Work",
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
            'path': "/mnt/c/Users/Ayush/Notes Personal",
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
            'name': 'vimconfig',
            'path': "/home/ayush-work/.config/nvim" if value == 'work' else "/home/ayush-pc/.config/nvim",
            'windows': [
                {
                    'name': 'nvim',
                    'commands': [
                        'nvim',
                    ]
                },
            ]
        }
    ]

    # Create an instance of the TmuxSessionManager
    manager = TmuxSessionManager()

    # Parse the command-line argument
    if len(sys.argv) > 1:
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
