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
)

sudo pacman -S ${pacman[@]}

systemctl start bluetooth.service
systemctl enable bluetooth.service
xdg-user-dirs-update