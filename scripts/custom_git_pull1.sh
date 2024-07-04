
#!/bin/bash

# ALIASES IN BASHRC
# alias nvim="~/nvim.appimage"
# export pc_type="personal"
# alias ntw="python3 ~/.config/nvim/scripts/tmux-py.py ntw"
# alias ntp="python3 ~/.config/nvim/scripts/tmux-py.py ntp"
# alias pg="python3 ~/.config/nvim/scripts/tmux-py.py pg"
# alias pull_config="chmod u+x ~/.config/nvim/scripts/custom_git_pull1.sh ; ~/.config/nvim/scripts/custom_git_pull1.sh"
# alias tnew='python3 ~/.config/nvim/scripts/tmux-py.py -new'
# alias vimconfig='python3 ~/.config/nvim/scripts/tmux-py.py vimconfig'
# alias vimwriterconfig='python3 ~/.config/nvim/scripts/tmux-py.py vimwriterconfig'
# alias pull_config="chmod u+x ~/.config/nvim/scripts/custom_git_pull1.sh ; ~/.config/nvim/scripts/custom_git_pull1.sh"
# alias ljj="/home/maughamc/.config/nvim/scripts/sh-launcher/automate-startup.sh"
# alias autocommit="/home/maughamc/.config/nvim/scripts/auto_commit.sh"
# alias writer_nvim="XDG_CONFIG_HOME=~/Writer/.config/ XDG_DATA_HOME=~/Writer/.local/ XDG_CACHE_HOME=~/Writer/.cache/ nvim"
# export PATH="$HOME/bin:$PATH"
# eval "$(oh-my-posh init bash)"
# eval "$(oh-my-posh init bash --config ~/.config/nvim/scripts/maugham.omp.json)"

#SHORTCUTS FOR KRUNNER 
# bash -c /home/maughamc/.config/nvim/scripts/sh-launcher/kdeBrowserTab.sh

# For switching to desktop 5 and performing search in browser. This is the the search window;
# qdbus org.kde.KWin /KWin setCurrentDesktop 5; krunner;


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

