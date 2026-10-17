#!/usr/bin/env bash
#
# The official Doc:  https://protonvpn.com/support/linux-vpn-debian-ubuntu#install
#

# Download the package that contains the repository configuration and keys required to install the Proton VPN GUI app and CLI. Run:
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb

# verify integrity 
# NOTE: this will fail for newer releases...
echo "0b14e71586b22e498eb20926c48c7b434b751149b1f2af9902ef1cfe6b03e180 protonvpn-stable-release_1.0.8_all.deb" | sha256sum --check -


# install the repository and update pkg list
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update

# install GUI & CLI
sudo apt install proton-vpn-gnome-desktop

# enable the system tray icon
sudo apt install gnome-shell-extension-appindicator gnome-shell-extension-prefs

# cleanup
sudo apt install proton-vpn-gnome-desktop
