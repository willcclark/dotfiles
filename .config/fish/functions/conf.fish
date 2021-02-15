function conf
    set -l fish ~/.config/fish/config.fish
    set -l git ~/.config/git/config
    set -l i3 ~/.config/i3/config
    set -l i3status ~/.config/i3status/config
    set -l ranger ~/.config/ranger/rc.conf   

    if test "$argv"
        vim $$argv
    else
        ranger --cmd='set hidden_filter ^\.git(ignore)?$' ~/src/dotfiles
    end
end
