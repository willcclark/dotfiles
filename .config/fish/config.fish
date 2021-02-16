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

# Setup Starship
starship init fish | source


# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Aliases
source ~/.config/fish/alias.fish
