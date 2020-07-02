ZDOTDIR=$HOME/.config/zsh
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/bin" "$HOME/.cargo/bin" "$path[@]")
export PATH
git init --bare $HOME/.cfg 2> /dev/null
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
clear
