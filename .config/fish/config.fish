# My fish config. Not much to see here.  Some pretty standard stuff.

# Add other directories to $PATH
set --export --global PATH $HOME/.local/bin /usr/local/bin /usr/sbin /var/lib/flatpak/exports/bin $PATH

# ~/ Clean up:
set --export --global XDG_CONFIG_HOME "$HOME/.config"
set --export --global XDG_DATA_HOME "$HOME/.local/share"
set --export --global XDG_CACHE_HOME "$HOME/.cache"

# Default programs:
set --export TERM "xterm-256color"              # Sets the terminal type
set --export EDITOR "nvim"      # $EDITOR use Emacs in terminal
set --export VISUAL "code"      # $VISUAL use Visual Studio Code in GUI mode

# Install Oh My Fish, if not installed
if test ! -f $HOME/.local/share/omf/init.fish
	echo "Please install Oh My Fish"
	sleep 3 && exit 1;;
else
end

# bobthefish prompt
set --global theme_nerd_fonts yes
set --global theme_display_git_default_branch yes
set --global theme_color_scheme base16
set --global theme_title_display_process yes
set --global theme_display_nvm yes
set --global theme_display_user yes
set --global theme_newline_cursor yes
set -g theme_newline_prompt '$ '

# colors
set --global fish_color_normal normal
set --global fish_color_command b294bb
set --global fish_color_quote b5bd68
set --global fish_color_redirection 8abeb7
set --global fish_color_end b294bb
set --global fish_color_error cc6666
set --global fish_color_param 81a2be
set --global fish_color_comment f0c674
set --global fish_color_match --background=brblue
set --global fish_color_selection white --bold --background=brblack
set --global fish_color_search_match bryellow --background=brblack
set --global fish_color_history_current --bold
set --global fish_color_operator 00a6b2
set --global fish_color_escape 00a6b2
set --global fish_color_cwd green
set --global fish_color_cwd_root red
set --global fish_color_valid_path --underline
set --global fish_color_autosuggestion 969896
set --global fish_color_user brgreen
set --global fish_color_host normal
set --global fish_color_cancel -r
set --global fish_pager_color_completion normal
set --global fish_pager_color_description B3A06D yellow
set --global fish_pager_color_prefix white --bold --underline
set --global fish_pager_color_progress brwhite --background=cyan

### ALIASES ###
# Use neovim for vim if present.
alias vim="nvim"

# Verbosity and settings that you pretty much just always are going to want.
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vi"
alias mkd="mkdir -pv"

# Colorize commands when possible.
alias ls='lsd --group-dirs first --human-readable --long'
alias grep="grep --color=auto"
alias diff="diff --color=auto"

# These common commands are just too long! Abbreviate them.
alias ka="killall"
alias g="git"
alias sdn="sudo shutdown -h now"
alias e="$EDITOR"
alias v="$EDITOR"
alias d="sudo dnf"

alias alias-finder='alias | fzf'

# spark aliases
alias clear='clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# bare git repo alias for dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

# You must call it on initialization or listening to directory switching won't work
test -d $HOME/.config/nvm ;and load_nvm
