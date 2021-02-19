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

# Default programs:
if [[ -x "$(command -v nvim)" ]]
then 
    alias vim="nvim" vimdiff="nvim -d"
    export EDITOR="nvim"
    alias vim="nvim"
    alias vi="nvim"
else
    export EDITOR="vi"
fi

export TERMINAL="alacritty"
export BROWSER="brave"

# Clean up ~/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export LESSHISTFILE="-"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"

# Ruby: Use XDG specification
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle 
export BUNDLE_USER_CACHE='"$XDG_CACHE_HOME"/bundle'
export BUNDLE_USER_PLUGIN='"$XDG_DATA_HOME"/bundle'

# Other program settings:
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# Setup Starship
if [[ -x "$(command -v starship)" ]]
then eval "$(starship init bash)"
else
    PS1="\[$(tput setaf 10)\]$PS1\[$(tput sgr0)\]"
fi

# Fzf keybindings
if [[ -f /usr/share/fzf/shell/key-bindings.bash ]]
then 
    source /usr/share/fzf/shell/key-bindings.bash
fi
# User specific aliases and functions

alias v="$EDITOR"
alias e="$EDITOR"
alias oo="xdg-open ."
alias o="xdg-open"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

conf() {
    case $1 in
        alacritty ) $EDITOR ~/.config/alacritty/alacritty.yml ;;
        bash ) $EDITOR ~/.bashrc ;;
        git ) $EDITOR ~/.config/git/config ;;
        i3 ) $EDITOR ~/.config/i3/config ;;
        * ) ranger --cmd='set hidden_filter ^\.git$|^\.gitignore$' ~/dotfiles ;;
    esac
}

# d - shorten and conditionally upgrade privilegs to common dnf commands
# ex: "d in firefox" - same as "sudo dnf -y firefox"
d() {
    case $1 in
        install ) sudo dnf -y install $2 ;;
        remove ) sudo dnf -y remove $2 ;;
        upgrade ) sudo dnf -y upgrade $2 ;;
        search ) dnf search $2 ;;
        in ) sudo dnf -y install $2 ;;
        rm ) sudo dnf -y remove $2 ;;
        up ) sudo dnf -y upgrade $2 ;;
        * ) dnf $2 ;;
    esac
}
