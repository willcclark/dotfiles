function conf
	set -l fish ~/.config/fish/config.fish
	set -l git ~/.config/git/config
	set -l tmux ~/.tmux.conf
	set -l starship ~/.config/starship.toml
	set -l vim ~/.config/nvim/init.vim
	set -l zsh ~/.config/zsh/.zshrc
	set -l codium ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json

	if test "$argv"
		$EDITOR $$argv
	else
		ranger --cmd='set hidden_filter ^\.git(ignore)?$' ~/src/dotfiles
	end
end
