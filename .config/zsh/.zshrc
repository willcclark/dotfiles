# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# miscellaneous options
setopt autocd autopushd pushdignoredups correct

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Prompt config
PROMPT='%F{green}%1~%f %# '
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT+=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

# set PATH
export PATH=$PATH:$HOME/bin

# set EDITOR
EDITOR=vim

#  set vim as man pager
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

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
source $ZDOTDIR/zkbdrc

## miscellaneous key bindings
# open cwd in ranger
bindkey -s '^o' 'ranger $PWD \n'
bindkey -s '^R' 'source $ZDOTDIR/.zshrc && clear \n'
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# syntax highlighting and autosuggestions
source /Users/will/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~will/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
