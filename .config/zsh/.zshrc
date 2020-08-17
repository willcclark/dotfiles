# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/zsh/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=spaceship

# {{{change ohmyzsh defaults
	# Uncomment the following line to use case-sensitive completion.
	CASE_SENSITIVE="true"
	# Uncomment the following line if pasting URLs and other text is messed up.
	DISABLE_MAGIC_FUNCTIONS="true"
	# Uncomment the following line to enable command auto-correction.
	ENABLE_CORRECTION="true"
	# Uncomment the following line to display red dots whilst waiting for completion.
	COMPLETION_WAITING_DOTS="true"
# }}}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
bgnotify
dnf
fzf
git
zsh-autosuggestions
zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
# Zsh-syntax-highlighting config
# {{{ External Plugins
# Colorls tab completions (https://github.com/athityakumar/colorls)
source $(dirname $(gem which colorls))/tab_complete.sh
# }}}
# User configuration

# {{{Starship
	SPACESHIP_PROMPT_ADD_NEWLINE=false”
	SPACESHIP_PROMPT_SEPARATE_LINE=false
	SPACESHIP_CHAR_SYMBOL="❯"
	SPACESHIP_CHAR_SUFFIX=" "
# }}}

# {{{Zsh-autosuggestions
	export ZSH_AUTOSUGGEST_USE_ASYNC="true"
	export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
	export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
	export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
# }}}

# {{{Zsh-syntax-highlighting
	export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
	# Declare the variable
	typeset -A ZSH_HIGHLIGHT_STYLES
	
	# To differentiate aliases from other command types
	ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
	
	# To have paths colored instead of underlined
	ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
	
	# To disable highlighting of globbing expressions
	ZSH_HIGHLIGHT_STYLES[globbing]='none'
	# To define styles for nested brackets up to level 4
	ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
	ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
	# Declare the variable
	typeset -A ZSH_HIGHLIGHT_PATTERNS
	
	# To have commands starting with `rm -rf` in red:
	ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
	ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
	
	ZSH_HIGHLIGHT_STYLES[root]='bg=red'
	
	ZSH_HIGHLIGHT_STYLES[line]='bold'
# }}}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source aliases, if present
[ -f $HOME/.config/aliasrc ] && source $HOME/.config/aliasrc

#{{{Tab/autocomplete options
	_comp_options+=(globdots)		# Include hidden files.
	
	# Use vim keys in tab complete menu:
	bindkey -M menuselect 'h' vi-backward-char
	bindkey -M menuselect 'k' vi-up-line-or-history
	bindkey -M menuselect 'l' vi-forward-char
	bindkey -M menuselect 'j' vi-down-line-or-history
	bindkey -v '^?' backward-delete-char
#}}}

# {{{some functions
# conf - a simple function by Paul Ouellette to easily open/edit config files
conf() {
  typeset -A progs
  progs=(
    vim ~/.config/nvim/init.vim
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
# }}}

#{{{key bindings
	# Use emacs keys
	bindkey -e 
	# This binds Ctrl-O to ranger-cd:
	bindkey -s '^o' 'ranger_cd\n'
	
	## miscellaneous key bindings
	# reload zsh
	bindkey -s '^[r' 'exec zsh \n'
	
	# Edit line in vim with ctrl-e:
	autoload edit-command-line; zle -N edit-command-line
	bindkey '^e' edit-command-line
#}}}
