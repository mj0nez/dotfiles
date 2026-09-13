#!/bin/bash


# run basic setup
sudo wget -qO- https://raw.githubusercontent.com/mj0nez/dotfiles/main/setup_basic.sh | bash

# setup python stuff and run playbook
bash ./programs/uv.sh

uv sync
.venv/bin/ansible-playbook playbooks/setup-local-devbox.yml --ask-become-pass


# dev-tooling
bash ./programs/taskfile.sh
bash ./programs/snap_apps.sh

bash ./programs/setup_ansible.sh

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
