# Aliases

source ~/.config/fish/alias.fish
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
set --export MANPAGER 'nvim +Man!'

# # Setup Starship
starship init fish | source