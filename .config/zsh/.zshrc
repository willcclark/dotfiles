# {{{Settings
# zmodload zsh/zprof
# {{{env
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/bin" "$HOME/.gem/ruby/2.7.0/bin" "/var/lib/flatpak/exports/bin" "$path[@]")
export PATH


export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
export EDITOR=nvim
export BROWSER="firefox"
export MANPAGER='nvim +Man!'
export TERM="xterm-256color"
export FuzzyFinder="fzf"
# }}}

# {{{general
# umask 077
setopt hist_save_no_dups hist_ignore_dups       # eliminate duplicate entries in history
setopt correctall                               # enable auto correction
setopt autopushd pushdignoredups                # auto push dir into stack and and don’t duplicate them
setopt autocd									# type the name of a directory, and it will become the current directory. 
# }}}

# {{{prompt
autoload -U promptinit
promptinit
printf "\e[5 q" > $TTY
# }}

# {{{completion
	# Auto load
	autoload -U +X compinit && compinit
	autoload -U +X bashcompinit && bashcompinit
	zmodload zsh/complist
	_comp_options+=(globdots)		# Include hidden files.

	# Set options
	setopt MENU_COMPLETE       # press <Tab> one time to select item
	setopt COMPLETEALIASES     # complete alias
	setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
	setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
	setopt PATH_DIRS           # Perform path search even on command names with slashes.
	setopt AUTO_MENU           # Show completion menu on a successive tab press.
	setopt AUTO_LIST           # Automatically list choices on ambiguous completion.

    # Group matches and describe.
    zstyle ':completion:*:*:*:*:*' menu select
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:options' auto-description '%d'
    zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
    zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
    zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
    zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
    zstyle ':completion:*:default' list-prompt '%S%M matches%s'
    zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' verbose yes

    
    # Fuzzy match mistyped completions.
    zstyle ':completion:*' completer _complete _match _approximate
    zstyle ':completion:*:match:*' original only
    zstyle ':completion:*:approximate:*' max-errors 1 numeric
    
    # Increase the number of errors based on the length of the typed word. But make
    # sure to cap (at 7) the max-errors to avoid hanging.
    zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'
    
    # Don't complete unavailable commands.
    zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
    
    # Array completion element sorting.
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
    
    # Directories
	zstyle ':completion:*' special-dirs false
	export LSCOLORS=ExFxCxdxBxegedabagacad
	export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
	zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# }}}

# {{{Plugins
# https://github.com/zdharma/zinit
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins-Overview
declare -A ZINIT  # initial Zinit's hash definition, if configuring before loading Zinit, and then:
ZINIT[HOME_DIR]=$HOME/.local/share/zinit

source "$HOME/.local/share/zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit load denysdovhan/spaceship-prompt
zinit ice wait'1' lucid; zinit light softmoth/zsh-vim-mode
zinit ice wait'1' lucid; zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit ice wait'1' lucid; zinit snippet OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh
zinit ice wait'1' lucid; zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh
zinit ice wait'1' lucid; zinit snippet OMZ::plugins/dnf/dnf.plugin.zsh
# }}}

# {{{Spaceship Prompt
	SPACESHIP_PROMPT_ADD_NEWLINE=false”
	SPACESHIP_PROMPT_SEPARATE_LINE=false
	SPACESHIP_CHAR_SUFFIX=" "
	SPACESHIP_VI_MODE_INSERT="\uf8ea"
	SPACESHIP_VI_MODE_NORMAL="\uf6b5"
	spaceship_vi_mode_enable
# }}}
# {{{ Vim-Mode
	MODE_CURSOR_VIINS="#00ff00 blinking bar"
	MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
	MODE_CURSOR_VICMD="green block"
	MODE_CURSOR_SEARCH="#ff00ff steady underline"
	MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
	MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"
	export KEYTIMEOUT=1
	# Use vim keys in tab complete menu:
	bindkey -M menuselect 'h' vi-backward-char
	bindkey -M menuselect 'k' vi-up-line-or-history
	bindkey -M menuselect 'l' vi-forward-char
	bindkey -M menuselect 'j' vi-down-line-or-history
	bindkey -v '^?' backward-delete-char
# }}}

# source aliases, if present
[ -f $HOME/.config/aliasrc ] && source $HOME/.config/aliasrc

# {{{some functions
# conf - a simple function by Paul Ouellette to easily open/edit config files
conf() {
  typeset -A progs
  progs=(
    nvim ~/.config/nvim/init.vim
    ranger ~/.config/ranger/rc.conf
    zsh $ZDOTDIR/.zshrc
    tmux ~/.tmux.conf
    alacritty ~/.config/alacritty/alacritty.yml
    # and so on
  )
  $EDITOR ${progs[$1]}
}
# Automatically change the current working directory after closing ranger
ranger_cd() {
    temp_file="$(mktemp -t "ranger_cd.XXXXXXXXXX")"
    ranger --choosedir="$temp_file" -- "${@:-$PWD}"
    if chosen_dir="$(cat -- "$temp_file")" && [ -n "$chosen_dir" ] && [ "$chosen_dir" != "$PWD" ]; then
        cd -- "$chosen_dir"
    fi
    rm -f -- "$temp_file"
}

# Easily restart zsh
restart() {
	cd
	clear
	src # Provided by https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zsh_reload
}

# }}}

#{{{key bindings
	# This binds Ctrl-O to ranger-cd:
	bindkey -s '^o' 'ranger_cd\n'

	## miscellaneous key bindings
	# reload zsh
	bindkey -s '^[r' 'restart \n'

	# Edit line in vim with ctrl-e:
	autoload edit-command-line; zle -N edit-command-line
	bindkey '^e' edit-command-line
#}}}

# {{{fast-syntax-highlighting
# FAST_HIGHLIGHT[chroma-git]="chroma/-ogit.ch"
# }}}
# {{{fzf
source /usr/share/fzf/shell/key-bindings.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="
-m --height=50%
--layout=reverse
--prompt='➤ '
--ansi
--tabstop=4
--color=dark
--color=bg:-1,hl:2,fg+:4,bg+:-1,hl+:2
--color=info:1,prompt:2,pointer:5,marker:1,spinner:3,header:11
--bind=tab:down,btab:up,ctrl-s:toggle,ctrl-p:toggle-preview
"
# }}}
# {{{fzf-marks
# Usage: mark fzm C-d
FZF_MARKS_FILE="$HOME/.cache/fzf-marks"
FZF_MARKS_COMMAND="fzf"
FZF_MARKS_COLOR_RHS="249"
# }}}
# {{{zsh-autosuggestions
export ZSH_AUTOSUGGEST_USE_ASYNC="true"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244,underline"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^ ' autosuggest-accept
# }}}

# {{{zsh-history-substring-search
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down
# }}}
# {{{z.lua
export _ZL_DATA="$HOME/.cache/.zlua"
export _ZL_MATCH_MODE=1
alias zc='z -c' # 严格匹配当前路径的子路径
alias zz='z -i' # 使用交互式选择模式
alias zf='z -I' # 使用 fzf 对多个结果进行选择
# }}}
# }}}
# {{{Startup
# zprof  # 取消注释首行和本行，然后执行 time zsh -i -c exit
# 若直接执行 zprof，将会测试包括 lazyload 在内的所有启动时间
fortune
# }}}
# __        ______ 
# \ \      / / ___|
#  \ \ /\ / / |    
#   \ V  V /| |___ 
#    \_/\_/  \____|
#
# Will Clark - https://github.com/willcclark
