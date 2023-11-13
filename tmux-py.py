import subprocess
import sys

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

    def create_session(self, session_name, windows):
        # Check if the session already exists and switch to it i.e. dont make new one
        if self.is_session_open(session_name):
            self.switch_to_session(session_name)

        else:
            # if self.is_inside_tmux():
                # print("cant create new inside tmux")
                # sys.exit(1)
            # Create a new session
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
    # Define your sessions and windows here
    sessions = [
        {
            'name': 'ch',
            'windows': [
                {
                    'name': 'frontend',
                    'commands': [
                        'cd /home/peerxp/Developer/chaabi-frontend/',
                        'npm start',
                    ]
                },
                {
                    'name': 'backend',
                    'commands': [
                        'cd /home/peerxp/Developer/chaabi-backend/',
                        'sudo -S <<< " " docker-compose  --env-file .docker.env up',
                    ]
                },
                {
                    'name': 'code',
                    'commands': [
                        'cd /home/peerxp/Developer/DualPackage',
                        'nvim src',
                    ]
                }
            ]
        },
        {
            'name': 'st',
            'windows': [
                {
                    'name': 'storybook',
                    'commands': [
                        'cd /home/peerxp/Developer/DualPackage',
                        'npm run storybook',
                    ]
                },
                {
                    'name': 'code',
                    'commands': [
                        'cd /home/peerxp/Developer/DualPackage',
                        'nvim src',
                    ]
                }
            ]
        }
    ]

    # Create an instance of the TmuxSessionManager
    manager = TmuxSessionManager()

    # Parse the command-line argument
    if len(sys.argv) > 1:
        session_name = sys.argv[1]
        for session in sessions:
            if session['name'] == session_name:
                manager.create_session(session_name, session['windows'])
                break
    else:
        print('Please provide a session name as an argument.')
