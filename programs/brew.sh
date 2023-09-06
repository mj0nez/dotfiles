#!/bin/bash

sudo apt update
sudo apt install build-essential git


# for some reason we get this error:
#
# programs/brew.sh: line 65: warn: command 
# Homebrew Installer
# Usage: [NONINTERACTIVE=1] [CI=1] install.sh [options]
#     -h, --help       Display this message.
#     NONINTERACTIVE   Install without prompting for user input
#     CI               Install in CI mode (e.g. do not prompt for user input)
if [[ -z ${CI+0} ]]
then
    export NONINTERACTIVE=1
else
    echo "CI mode was set"
fi

eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

#(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/"$USER"/.bashrc  # should be set via .bashrc
#eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# brew will be available from the next terminal session
# therefore we need to manually set the path

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

bash brew doctor
bash brew install gcc
bash brew analytics off
