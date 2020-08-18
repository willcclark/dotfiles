#/bin/bash
# Pop os Bootstrapping script

if [ $(id -u) = 0 ]; then
   echo "This script changes your users gsettings and should thus not be run as root!"
   echo "You may need to enter your password multiple times!"
   exit 1
fi

echo ' '
echo 'Installing codecs, CLI utilities, and applications'
echo ' '

# Multimedia codecs
sudo add-apt-repository multiverse -y
sudo apt install ubuntu-restricted-extras -y

# Brave web browser
sudo apt install apt-transport-https curl -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update

### 
# Base packages and applications
###
apt=(
alacritty
brave-browser
code
neovim
ranger
zsh

