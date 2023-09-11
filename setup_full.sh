#!/bin/bash


# run basic setup
sudo wget -qO- https://raw.githubusercontent.com/mj0nez/dotfiles/main/setup_basic.sh | bash

# dev-tooling
bash ./programs/brew.sh
bash ./programs/snap_apps.sh


# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
