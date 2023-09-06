#!/bin/bash

sudo apt install zsh fonts-powerline
# set as default shell - takes affect after a new login
chsh -s /usr/bin/zsh

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# power10k theme
# this requires so symlink the zshrc after installation, otherwise the settings will be overriden
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

