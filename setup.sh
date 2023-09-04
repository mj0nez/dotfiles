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
install tree
install git
install wget
install curl

# json and yaml parser
install jq
# install yq
#install chrome-gnome-shell
#install exfat-utils
#install file
#install htop

install nmap    # networkmonitor
#install openvpn

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y