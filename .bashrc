# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

EDITOR=vim

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias config='/usr/bin/git --git-dir=/home/will/.cfg/ --work-tree=/home/will'
conf () {
declare -A conf
conf[bash]=.bashrc
conf[vim]=.vimrc
conf[zsh]=.config/zsh
conf[tmux]=.tmux.conf
conf[alacritty]=.config/alacritty/alacritty.yml
$EDITOR "${conf[$1]}"
}
