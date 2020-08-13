typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.gem/ruby/2.7.0/bin"  "$path[@]")
export PATH

export EDITOR="nvim"
export BROWSER="brave"
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

ZDOTDIR=$HOME/.config/zsh

