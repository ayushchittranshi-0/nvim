
#!/bin/bash

# ALIASES IN BASHRC
# export pc_type="personal"
# alias ntw="python3 ~/.config/nvim/scripts/tmux-py.py ntw"
# alias ntp="python3 ~/.config/nvim/scripts/tmux-py.py ntp"
# alias pg="python3 ~/.config/nvim/scripts/tmux-py.py pg"
# alias pull_config="chmod u+x ~/.config/nvim/scripts/custom_git_pull1.sh ; ~/.config/nvim/scripts/custom_git_pull1.sh"


if [ "$pc_type" == "work" ]; then  
    cd ~/.config/nvim
    git pull
    cp scripts/.tmux.conf ~
    cp scripts/toggle_customizations.bat /mnt/c/Users/ayush.chittranshi_pe/
    cp -r scripts/ahk /mnt/c/Users/ayush.chittranshi_pe/
else 
    cd ~/.config/nvim
    git pull
    cp scripts/.tmux.conf ~
    cp scripts/toggle_customizations.bat /mnt/c/Users/Ayush/
    cp -r scripts/ahk /mnt/c/Users/Ayush/
fi

