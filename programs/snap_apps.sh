#!/bin/bash

sudo apt update

sudo apt install snapd
sudo snap install core postman dbeaver-ce
sudo snap install code --classic

function install {
  name="${1}"
  code --install-extension ${name} --force
}

install ms-python.python
install vscode-icons-team.vscode-icons
install eamodio.gitlens
install redhat.vscode-yaml
