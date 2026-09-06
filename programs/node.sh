#!/bin/bash


PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'




# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash

# in lieu of restarting the shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.20.0".

# Download and install pnpm:
corepack enable pnpm

# Verify pnpm version:
pnpm -v