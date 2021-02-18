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

eval "$(starship init bash)"

# Clean up ~/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Use NeoVim as a $MANPAGER
export MANPAGER='nvim +Man!'

# Ruby: Use XDG specification
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem

export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle 
export BUNDLE_USER_CACHE='"$XDG_CACHE_HOME"/bundle'
export BUNDLE_USER_PLUGIN='"$XDG_DATA_HOME"/bundle'

# User specific aliases and functions
PS1="\[$(tput setaf 10)\]$PS1\[$(tput sgr0)\]"

alias oo="xdg-open ."
alias o="xdg-open"
alias suod="sudo" # typos...
alias vim="nvim"
alias vi="nvim"
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
