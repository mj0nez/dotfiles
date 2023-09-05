#!/bin/bash
brew install pyenv


# install build extensions 
# see https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev llvm

# should be set via .bashrc
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
#echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
#echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# should be set via .bash_profile
#echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
#echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
#echo 'eval "$(pyenv init -)"' >> ~/.bash_profile