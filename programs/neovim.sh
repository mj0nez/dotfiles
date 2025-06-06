#!/usr/bin/env bash

# install deps
sudo apt update && sudo apt install -y \
    gcc \
    ripgrep \
    unzip \
    git \
    xclip

# download and unarchive latest binary release
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
