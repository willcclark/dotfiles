# Fedora Bootstrapping script
#!/bin/bash

if [ $(id -u) = 0 ]; then
   echo "This script changes your users gsettings and should thus not be run as root!"
   echo "You may need to enter your password multiple times!"
   exit 1
fi

# DNF usability improvements
sudo tee -a /etc/dnf/dnf.conf > /dev/null  <<EOF
fastestmirror=true
max_parallel_downloads=10
EOF


# Install TLP to improve battery live
sudo dnf -y install tlp
tlp start

###
# Optionally clean all dnf temporary files
###

sudo dnf clean all

###
# Enable RpmFusion repos 
# These contain software not available in the default Fedora repos
###
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install AppStream metadata (for gnome-software)
sudo dnf groupupdate core

###
# Multimedia post-install
###
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

###
# RpmFusion tainted repos
# Tainted free is dedicated for FLOSS packages where some usages might be restricted in some countries.
sudo dnf install rpmfusion-free-release-tainted
sudo dnf install libdvdcss
# Tainted nonfree is dedicated to non-FLOSS packages without a clear redistribution status by the copyright holder. But is allowed as part of hardware inter-operability between operating systems in some countries.
sudo dnf install rpmfusion-nonfree-release-tainted
sudo dnf install \*-firmware
###

###
# Alacritty terminal emulator
# "A cross-platform, GPU enhanced terminal emulator"
###
sudo dnf copr enable pschyska/alacritty 

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
chromium-freeworld `#Comes with hardware acceleration and all Codecs` \
vim # best text editor
zsh # favorite shell
zsh-autosuggestions
zsh-syntax-highlighting


###
# Install base packages and applications
###

