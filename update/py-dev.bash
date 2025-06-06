#!/bin/bash


pyenv update

BASE_PYTHON_VERSION=3.11
BASE_PYTHON="python${BASE_PYTHON}"

$BASE_PYTHON -m pip install --upgrade pip
$BASE_PYTHON -m pip install --upgrade pipx

pipx upgrade-all
