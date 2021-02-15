# Aliases

source ~/.config/fish/alias.fish
# Add other directories to $PATH
set --export --global PATH $HOME/.local/bin /usr/local/bin /usr/sbin /var/lib/flatpak/exports/bin $PATH

# ~/ Clean up:
set --export --global XDG_CONFIG_HOME "$HOME/.config"
set --export --global XDG_DATA_HOME "$HOME/.local/share"
set --export --global XDG_CACHE_HOME "$HOME/.cache"

# Default programs:
set --export --global EDITOR "nvim"      # $EDITOR use Emacs in terminal
set --export --global VISUAL "code"      # $VISUAL use Visual Studio Code in GUI mode
set --export --global MANPAGER 'nvim +Man!'

# # Setup Starship
starship init fish | source
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end
