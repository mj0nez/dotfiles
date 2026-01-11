#!/usr/bin/env bash

echo "Setting up uv for Python tooling..."
./programs/uv.sh

echo "Setting up .venv ..."
uv sync

echo "Running Ansible playbook..."
.venv/bin/ansible-playbook playbooks/setup-local-devbox.yml --ask-become-pass
