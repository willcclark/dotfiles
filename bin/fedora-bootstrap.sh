# Fedora Bootstrapping script
#!/bin/bash

if [ $(id -u) = 0 ]; then
   echo "This script changes your users gsettings and should thus not be run as root!"
   echo "You may need to enter your password multiple times!"
   exit 1
fi

echo ' '
echo "Adding some dnf usability improvements to /etc/dnf/dnf.conf"
echo ' '

# DNF usability improvements
sudo tee -a /etc/dnf/dnf.conf > /dev/null  <<EOF
fastestmirror=true
max_parallel_downloads=10
EOF

echo ' '
echo 'Installing codecs, CLI utilities, and applications'
echo ' '

###
# Optionally clean all dnf temporary files
###

sudo dnf clean all

###
# Enable RpmFusion repos 
# These contain software not available in the default Fedora repos
###
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install AppStream metadata (for gnome-software)
sudo dnf -y groupupdate core

###
# Multimedia post-install
###
sudo dnf -y groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf -y groupupdate sound-and-video

###
# RpmFusion tainted repos
# Tainted free is dedicated for FLOSS packages where some usages might be restricted in some countries.
sudo dnf -y install rpmfusion-free-release-tainted
sudo dnf -y install libdvdcss
# Tainted nonfree is dedicated to non-FLOSS packages without a clear redistribution status by the copyright holder. But is allowed as part of hardware inter-operability between operating systems in some countries.
sudo dnf -y install rpmfusion-nonfree-release-tainted
sudo dnf -y install \*-firmware
###

###
# Alacritty terminal emulator
# "A cross-platform, GPU enhanced terminal emulator"
###
sudo dnf -y copr enable pschyska/alacritty 

###
# Force update the whole system to the latest and greatest
###

sudo dnf upgrade --best --allowerasing --refresh -y

# And also remove any packages without a source backing them
sudo dnf distro-sync -y

### 
# Base packages and applications
###
dnf=(
alacritty # fastest Terminal
cargo
cascadia-code-fonts
exfat-utils
fuse-exfat
gnome-extensions-app
gnome-shell-extension-dash-to-dock.noarch
gnome-shell-extension-appindicator
ranger
rust
vim # best text editor
zsh # favorite shell
zsh-autosuggestions
zsh-syntax-highlighting
)

flatpak=(
org.gnome.Geary
info.mumble.Mumble
org.gnome.FeedReader
org.gnome.Polari
)

cargo=(
exa
starship
)

###
# Install base packages and applications
###
sudo dnf -y install ${dnf[@]}
flatpak install -y ${flatpak[@]}
cargo install ${cargo[@]}

###
# change default shell to zsh
###
chsh -s $(which zsh)
mkdir -p .cache/zsh
touch .cache/zsh/history

echo ' '
echo 'enabling NightLight to reduce eye strain'
echo ' '

#Gnome Night Light (Like flux/redshift)
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

echo ' '
echo 'Pulling my dotfiles from GitHub'
echo ' '

###
# Pull down my dotfiles from github
###
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/willcclark/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
rm .bashrc
config checkout


# The user needs to reboot to apply all changes.
echo "Please Reboot" && exit 0
