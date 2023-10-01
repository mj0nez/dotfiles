#!/bin/bash

# install build extensions 
# see https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt update && sudo apt install -y build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev llvm 

# install pyenv
curl https://pyenv.run | bash

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

pyenv update
pyenv doctor  # verify installation and tools are sufficient

# isntall and set default python to isolate system python
pyenv install 3.11.5
pyenv global 3.11.5 

python3 -m pip install --user pipx
python3 -m pipx ensurepath

packages=(tox pre-commit pip-tools "black[jupyter]" codespell)

for package in "${packages[@]}"
do
  pipx install $package
done
