# -----------------------------------------------------------------------------
# Name: 	~/.config/fish/config.fish
# GitHub:	willcclark <https://github.com/willcclark/dotfiles/blob/master/.config/fish/config.fish/
# -----------------------------------------------------------------------------

# Disable greeting at shell startup
set fish_greeting

#{{{Environment Variables
set --export EDITOR nvim
set --export PATH ~/bin ~/.cargo/bin ~/.local/bin /usr/sbin ~/.dotbare $PATH
set --export BROWSER google-chrome
set --export MANPAGER nvim +Man!
set --export DOTBARE_DIR $HOME/.cfg
#}}}

# Starship prompt <https://starship.rs>
starship init fish | source

# Fortune - display a random quotation from a collection of quotes <https://github.com/shlomif/fortune-mod>
fortune

#{{{Vi mode commands
function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Without an argument, fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings insert
end

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursor to an underscore
set fish_cursor_replace_one underscore
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
#}}}

# {{{Alias
# Use neovim for vim if present.
test -f (which nvim) && alias vim="nvim"

# Verbosity and settings that you pretty much just always are going to want.
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias mkd="mkdir -pv"
alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best"
alias ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias ls="lsd --long"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi"

# dnf aliases
alias dnfl="dnf list"                       # List packages
alias dnfli="dnf list installed"            # List installed packages
alias dnfgl="dnf grouplist"                 # List package groups
alias dnfmc="dnf makecache"                 # Generate metadata cache
alias dnfp="dnf info"                       # Show package information
alias dnfs="dnf search"                     # Search package

alias dnfu="sudo dnf upgrade"               # Upgrade package
alias dnfi="sudo dnf install"               # Install package
alias dnfgi="sudo dnf groupinstall"         # Install package group
alias dnfr="sudo dnf remove"                # Remove package
alias dnfgr="sudo dnf groupremove"          # Remove package group
alias dnfc="sudo dnf clean all"             # Clean cache
#}}}

# __        ______ 
# \ \      / / ___|
#  \ \ /\ / / |    
#   \ V  V /| |___ 
#    \_/\_/  \____|
#
# Will Clark - https://github.com/willcclark
