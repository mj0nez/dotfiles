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
FONT_NAME=Agave

curl -OL https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh
chmod +x install.sh
VERBOSE=2 ./install.sh install DaddyTimeMono
./install.sh install $FONT_NAME

# clean up
rm -r -d install.sh

# loading the profile does not work - should be done manually...
#
# # load the terminal profile
# # sudo apt install dbus-x11 # not tested
# export DISPLAY=:0.0  # avoids dbus-x11 error
# dconf load /org/gnome/terminal/legacy/profiles:/:461f8ee8-d5f7-4da5-9de2-58ab7f40cf4a/
