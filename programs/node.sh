#!/bin/bash


PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'

nvm install node  #latest version
nvm install --lts

nvm use node

node -v