# Path to your oh-my-zsh installation.
 export ZSH=$HOME/.config/zsh/oh-my-zsh
ZSH_THEME="robbyrussel"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
dnf
ubuntu
archlinux
)

source $ZSH/oh-my-zsh.sh

# Set personal aliases
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
_comp_options+=(globdots)		# Include hidden files.

# miscellaneous options
setopt autocd autopushd pushdignoredups correct

# vi mode
bindkey -v
export KEYTIMEOUT=1

# set EDITOR
EDITOR=vim

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# aliases, functions, keyboard layout
source $ZDOTDIR/aliasrc

## miscellaneous key bindings
# open cwd in ranger
bindkey -s '^o' 'ranger $PWD \n'
bindkey -s '^R' 'source $ZDOTDIR/.zshrc && clear \n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use Alt-h to view manpage while editing command
bindkey -M vicmd '^[h' run-help
bindkey -M viins '^[h' run-help

## syntax highlighting and autosuggestions
# For MacOS
[ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# For Arch Linux
[ -f "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# For Ubuntu/Fedora
[ -f "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
