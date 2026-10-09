#!/bin/bash

sudo apt update && sudo apt install snapd

sudo snap install \
    core \
    spotify

# apps using classic confinement
sudo snap install --classic \
    code \
    gitkraken
