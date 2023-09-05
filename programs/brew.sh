#!/bin/bash

#sudo apt update
#sudo apt install build-essential git

export NONINTERACTIVE=1 

eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

#(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/"$USER"/.bashrc  # should be set via .bashrc
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew doctor
brew install gcc
brew analytics off