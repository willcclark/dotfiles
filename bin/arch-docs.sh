#! /usr/bin/env bash

# Set up YAY (AUR Helper)
sudo pacman -S base-devel
cd ~/.config
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# Install applications
pacman=(
xorg
awesome
alacritty
unzip
xclip
ranger
neofetch
tmux
powerline
powerline-fonts
vim-airline
vim-airline-themes
lxappearance
papirus-icon-theme
firefox
zsh
feh
compton
xorg-xinit
vlc
zoom
mesa
xdg-user-dirs
pulseaudio
pulseaudio-alsa 
pulseaudio-bluetooth
pulseaudio-equalizer
pulseaudio-jack
pulseaudio-lirc
pulseaudio-zeroconf
pavucontrol
fwupd
rofi
)

sudo pacman -S ${pacman[@]}

systemctl start bluetooth.service
systemctl enable bluetooth.service
xdg-user-dirs-update

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/willcclark/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
rm .bashrc 
config checkout

git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/zsh/oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions