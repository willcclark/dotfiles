# Install Oh My Fish, if not installed
if test ! -f $HOME/.local/share/omf/init.fish
	echo "Please install Oh My Fish"
	sleep 3 && exit 0
else
	echo "Oh My Fish is already installed"
end

# Aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# colors
set --global --export fish_color_normal normal
set --global --export fish_color_command b294bb
set --global --export fish_color_quote b5bd68
set --global --export fish_color_redirection 8abeb7
set --global --export fish_color_end b294bb
set --global --export fish_color_error cc6666
set --global --export fish_color_param 81a2be
set --global --export fish_color_comment f0c674
set --global --export fish_color_match --background=brblue
set --global --export fish_color_selection white --bold --background=brblack
set --global --export fish_color_search_match bryellow --background=brblack
set --global --export fish_color_history_current --bold
set --global --export fish_color_operator 00a6b2
set --global --export fish_color_escape 00a6b2
set --global --export fish_color_cwd green
set --global --export fish_color_cwd_root red
set --global --export fish_color_valid_path --underline
set --global --export fish_color_autosuggestion 969896
set --global --export fish_color_user brgreen
set --global --export fish_color_host normal
set --global --export fish_color_cancel -r
set --global --export fish_pager_color_completion normal
set --global --export fish_pager_color_description B3A06D yellow
set --global --export fish_pager_color_prefix white --bold --underline
set --global --export fish_pager_color_progress brwhite --background=cyan

# bobthefish
# set -g theme_nerd_fonts yes
# set -g theme_display_git no
# set -g theme_display_git_dirty no
# set -g theme_display_git_untracked no
# set -g theme_display_git_ahead_verbose yes
# set -g theme_display_git_dirty_verbose yes
# set -g theme_display_git_stashed_verbose yes
# set -g theme_display_git_default_branch yes
# set -g theme_git_default_branches master main
# set -g theme_git_worktree_support yes
# set -g theme_use_abbreviated_branch_name yes
# set -g theme_display_vagrant yes
# set -g theme_display_docker_machine no
# set -g theme_display_k8s_context yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_nix no
# set -g theme_display_ruby no
# set -g theme_color_scheme nord
# set -g theme_display_nvm yes
# set -g theme_display_user ssh
# set -g theme_display_hostname ssh
# set -g theme_display_vi no
# set -g theme_display_date no
# set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path no
# set -g theme_title_display_user yes
# set -g theme_title_use_abbreviated_path no
# set -g theme_date_format "+%a %H:%M"
# set -g theme_date_timezone America/Los_Angeles
# set -g theme_avoid_ambiguous_glyphs yes
# set -g theme_powerline_fonts no
# set -g theme_nerd_fonts yes
# set -g theme_show_exit_status yes
# set -g theme_display_jobs_verbose yes
# set -g default_user your_normal_user
# set -g theme_color_scheme dark
# set -g fish_prompt_pwd_dir_length 0
# set -g theme_project_dir_length 1
# set -g theme_newline_cursor yes
# set -g theme_newline_prompt '$ '

# You must call it on initialization or listening to directory switching won't work
test -d $HOME/.config/nvm ;and load_nvm
