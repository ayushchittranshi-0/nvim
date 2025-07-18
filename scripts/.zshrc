if [ -f ~/.secret_env ]; then 
    echo "Loading secret env file"
    source ~/.secret_env
else
    echo "Secret env file not found"
fi

export pc_type="work"
alias ntw="python3 ~/.config/nvim/scripts/tmux-py.py ntw"
alias ntp="python3 ~/.config/nvim/scripts/tmux-py.py ntp"
alias pull_config="chmod u+x ~/.config/nvim/scripts/custom_git_pull1.sh ; ~/.config/nvim/scripts/custom_git_pull1.sh"
alias pull_config="chmod u+x ~/.config/nvim/scripts/custom_git_pull1.sh ; ~/.config/nvim/scripts/custom_git_pull1.sh"
alias autocommit="/home/maughamc/.config/nvim/scripts/auto_commit.sh"
alias pnvim="XDG_CONFIG_HOME=~/python-nvim/.config/ XDG_DATA_HOME=~/python-nvim/.local/ XDG_CACHE_HOME=~/python-nvim/.cache/ nvim"

# python tmux-py scripts
alias ljj="~/.config/nvim/scripts/automate-mac.sh"
alias fjj="~/.config/nvim/scripts/firefox-automate-mac.sh"
alias jexamx="python3 ~/.config/nvim/scripts/tmux-py.py jexamx"
alias vimconfig='python3 ~/.config/nvim/scripts/tmux-py.py vimconfig'
alias pvimconfig='python3 ~/.config/nvim/scripts/tmux-py.py pvimconfig'
alias tnew='python3 ~/.config/nvim/scripts/tmux-py.py -new'

# configure oh-my-posh
eval "$(oh-my-posh init zsh)"
eval "$(oh-my-posh init bash --config ~/.config/nvim/scripts/maugham.omp.json)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
