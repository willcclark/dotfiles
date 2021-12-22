if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

if [ $ANDROID_DATA ]
    set -gx NOTESDIR ~/storage/shared/notes
else
    set -gx NOTESDIR ~/dox/notes/
end

set -gx fish_color_normal normal
set -gx fish_color_command b294bb
set -gx fish_color_quote b5bd68
set -gx fish_color_redirection 8abeb7
set -gx fish_color_end b294bb
set -gx fish_color_error cc6666
set -gx fish_color_param 81a2be
set -gx fish_color_match --background=brblue
set -gx fish_color_comment f0c674
set -gx fish_color_selection white --bold --background=brblack
set -gx fish_color_search_match bryellow --background=brblack
set -gx fish_color_history_current --bold
set -gx fish_color_cwd green
set -gx fish_color_escape 00a6b2
set -gx fish_color_cwd_root red
set -gx fish_color_valid_path --underline
set -gx fish_color_autosuggestion 969896
set -gx fish_color_user brgreen
set -gx fish_color_host normal
set -gx fish_color_cancel -r
set -gx fish_pager_color_completion normal
set -gx fish_pager_color_description B3A06D yellow
set -gx fish_pager_color_prefix normal --bold --underline
set -gx fish_pager_color_progress brwhite --background=cyan
set -gx fish_color_operator 00a6b2

if status is-login
    eval (ssh-agent -c)

    if test "$ANDROID_DATA"
        set -gx PATH ~/bin $PATH
    else
        set -gx PATH ~/bin ~/.local/bin /usr/sbin $PATH
        if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
            sway
        end
    end
end
