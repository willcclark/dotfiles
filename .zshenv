ZDOTDIR=$HOME/.config/zsh
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/bin" "$HOME/.cargo/bin" "$path[@]")
export PATH
