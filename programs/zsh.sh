#!/bin/bash

sudo apt install -y zsh fonts-powerline
# set as default shell - takes affect after a new login
sudo chsh -s /usr/bin/zsh "$USER"

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# power10k theme
# this requires so symlink the zshrc after installation, otherwise the settings will be overriden
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# download and install nerd-fonts

version=v3.0.2
font=Agave

mkdir -p patched-fonts/$font/

# get and unpack font archive
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/$version/$font.tar.xz
tar -xf $font.tar.xz -C patched-fonts/$font/

# load and run installation
wget -qO- https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh | bash

# clean up
rm -r -d patched-fonts
rm $font.tar.xz

# loading the profile does not work - should be done manually...
#
# # load the terminal profile
# # sudo apt install dbus-x11 # not tested
# export DISPLAY=:0.0  # avoids dbus-x11 error
# dconf load /org/gnome/terminal/legacy/profiles:/:461f8ee8-d5f7-4da5-9de2-58ab7f40cf4a/
