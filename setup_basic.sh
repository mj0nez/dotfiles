#!/bin/bash

# Update Ubuntu and get standard repository programs
sudo add-apt-repository ppa:git-core/ppa -y
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


basicDeps=(git git-gui tree curl bat tar gzip build-essential gcc make jq nmap htop tmux net-tools)

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


# Run zsh install
bash ./programs/zsh.sh

# link dotfiles and overwrite autoconfig
./symlink.sh

# setup git maintenance timers
# while the dotfiles will be registered here, new repos can be registers with 'git setup'
touch ~/repositories/.gitconfig
# pre-register dotfiles repo in non-tracked config file, so that it's not written to the
# global config with maintenance start
git maintenance register --config-file ~/repositories/.gitconfig
# start the timers (because creating them manually is kind of a pain...)
git maintenance start
# show tracked repo and timers
git config --show-origin --get-all maintenance.repo
systemctl --user list-timers

# Get all upgrades
# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
