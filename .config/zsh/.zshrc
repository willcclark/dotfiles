# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/zsh/oh-my-zsh

ZSH_THEME="robbyrussell"

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
zsh-autosuggestions
zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() {
echo -ne '\e[5 q'
}

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
_comp_options+=(globdots)		# Include hidden files.

# miscellaneous options
setopt autocd autopushd pushdignoredups correct

# set EDITOR
EDITOR=vim

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

## miscellaneous key bindings
# Emacs mode
bindkey -e
# open cwd in ranger
bindkey -s '^o' 'ranger $PWD \n'
# reload zsh
bindkey -s '^r' 'exec zsh \n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use Alt-h to view manpage while editing command
bindkey -M vicmd '^[h' run-help
bindkey -M viins '^[h' run-help

## My Personal aliases & Functions
## Aliases
# vim
alias -s {yml,yaml,txt,md,bash}=vim
alias vi='vim'
# ls
alias ls="exa -la --group-directories-first"
alias l.="exa -lad --group-directories-first .*"
# rm 
alias rm='rm -iv'
alias rr='rm -rf'
# Zsh
alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

## Funtions
# conf - a simple function by Paul Ouellette to easily open/edit config files
conf() {
  typeset -A progs
  progs=(
    vim ~/.vimrc
    ranger ~/.config/ranger/rc.conf
    zsh $ZDOTDIR/
    tmux ~/.tmux.conf
    alacritty ~/.config/alacritty/alacritty.yml
    # and so on
  )
  $EDITOR ${progs[$1]}
}
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi
