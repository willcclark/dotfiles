function conf
    set -l alacritty ~/.config/alacritty/alacritty.yml
    set -l fish ~/.config/fish/config.fish
    set -l git ~/.config/git/config
    set -l i3 ~/.config/i3/config
    set -l i3status ~/.config/i3status/config
    set -l nvim ~/.config/nvim/init.vim
    set -l ranger ~/.config/ranger/rc.conf   
    set -l vim ~/.config/nvim/init.vim

    if test "$argv"
        $EDITOR $$argv
    else
        ranger --cmd='set hidden_filter ^\.git(ignore)?$' ~/src/dotfiles
    end
end
