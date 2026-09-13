#!/usr/bin/env bash


# run basic setup
sudo wget -qO- https://raw.githubusercontent.com/mj0nez/dotfiles/main/setup_basic.sh | bash

echo "Setting up uv for Python tooling..."
bash ./programs/uv.sh

echo "Setting up .venv ..."
uv sync

echo "Running Ansible playbook..."
.venv/bin/ansible-playbook playbooks/setup-local-devbox.yml --ask-become-pass



# dev-tooling
bash ./programs/taskfile.sh
bash ./programs/snap_apps.sh

bash ./programs/setup_ansible.sh

# Update Ubuntu and get standard repository programs
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
