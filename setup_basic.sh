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


basicDeps=(git git-gui tree curl bat tar gzip build-essential gcc make jq nmap htop tmux)

for dep in "${basicDeps[@]}"
do
  install $dep
done

# add alias - deb pkg installs als batcat see https://github.com/sharkdp/bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

mkdir "/home/$USER/repositories"
cd $_

git clone https://github.com/mj0nez/dotfiles.git
cd dotfiles


# Run all scripts in programs/
bash ./programs/zsh.sh 

# link dotfiles and overwrite autoconfig
./symlink.sh

# Get all upgrades
# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
