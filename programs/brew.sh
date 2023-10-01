#!/bin/bash

# ensure we have all deps
sudo apt update
sudo apt install build-essential git

# don't ask for user input
export NONINTERACTIVE=1

eval "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 

# adds brew to .bashrc
#(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/"$USER"/.bashrc 

# brew will be available from the next terminal session
# therefore we need it temporarly
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


brew doctor 
brew analytics off
brew install gcc pre-commit pyenv

# should be set via .bashrc
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
#echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
#echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# should be set via .bash_profile
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
#echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
#echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

# install build extensions 
# see https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev llvm 

# we currently miss the Tkinter lib:
# WARNING: The Python tkinter extension was not compiled and GUI subsystem has been detected. Missing the Tk toolkit?

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# isntall and set default python to isolate system python
pyenv install 3.11.5
pyenv global 3.11.5 

python3 -m pip install --user pipx
python3 -m pipx ensurepath

packages=(tox pip-tools "black[jupyter] codespell")

for package in "${packages[@]}"
do
  pipx install $package
done
