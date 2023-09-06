#!/bin/bash

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
#install awscli
install git
install tree
# install wget  # this comes with ubuntu
install curl
install tar 
install gzip 
install build-essential

install jq  #json parser

install nmap    # networkmonitor
#install openvpn

mkdir "/home/$USER/repositories" && cd $_

git clone https://github.com/mj0nez/dotfiles.git
cd dotfiles

# link dotfiles
./symlink.sh

# Run all scripts in programs/
bash ./programs/brew.sh 

# Get all upgrades
# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
