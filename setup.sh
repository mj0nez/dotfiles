#!/bin/bash

# Copy dotfiles
# ./copy.sh

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
install chrome-gnome-shell
install curl
install exfat-utils
install file
install git
install htop
install jq
install yq
install nmap
install openvpn
install tree
install vim
install wget
