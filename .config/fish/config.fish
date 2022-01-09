if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

if [ $ANDROID_DATA ]
    set -gx NOTESDIR ~/storage/shared/notes
else
    set -gx NOTESDIR ~/dox/notes/
end

alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
