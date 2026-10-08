# Driver Installation of ASUS Radeon 9070

**Requirements:**

- Ubuntu 26.04
- Kernel 7.0.X

## Setup GPU drivers

```bash
# pre-flight
sudo apt update
sudo apt upgrade

# most should come with Ubuntu
sudo apt install linux-firmware libgl1-mesa-dri mesa-vulkan-drivers pciutils

# well yeah check
sudo apt-get check

sudo apt install mesa-utils vulkan-tools
# apply changes before continuing
sudo reboot
```

Verification:

```bash
# verify active Radeon Kernel Driver
lspci -nnk | grep -A3 -E 'VGA|3D|Display'
lsmod | grep -E '^(amdgpu|radeon)[[:space:]]'

# check for openGL & vulkan acceleration
glxinfo -B
vulkaninfo --summary
```

Add 32-Bit Libs for Steam

```bash
dpkg --print-architecture

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers:i386


dpkg-query -W -f='${binary:Package}\t${Version}\n' \
    libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 \
    mesa-vulkan-drivers:amd64 mesa-vulkan-drivers:i386

apt-cache policy \
    libgl1-mesa-dri:amd64 libgl1-mesa-dri:i386 \
    mesa-vulkan-drivers:amd64 mesa-vulkan-drivers:i386
```

## Setup ROCm for Ollama

Preflight:

```bash
# install additional libs
sudo apt install libatomic1 libquadmath0

# configure GPU access
# Add the current user to the render and video groups
sudo usermod -a -G render,video $LOGNAME

```

Installation:

```bash
# Download and install GPG key
sudo mkdir --parents --mode=0755 /etc/apt/keyrings

# ROCm release signing key
wget https://stable.repo.amd.com/rocm/gpg/packages.gpg -O - | \
    gpg --dearmor | sudo tee /etc/apt/keyrings/amdrocm.gpg > /dev/null

sudo tee /etc/apt/sources.list.d/amdrocm-stable.sources << EOF
X-Repo-Id: amdrocm-stable
Types: deb
URIs: https://stable.repo.amd.com/rocm/core/packages/ubuntu2604/
Suites: stable
Components: main
Architectures: amd64
Signed-By: /etc/apt/keyrings/amdrocm.gpg
Enabled: yes
EOF

sudo apt update && sudo apt install amdrocm10.1-gfx1201
```

Verify

```bash
rocminfo

amd-smi version
```

## Referenzes

- https://linuxcapable.com/how-to-install-amd-radeon-drivers-on-ubuntu-linux/#install-amd-radeon-software-on-ubuntu
- https://docs.ollama.com/gpu#amd-radeon
- https://rocm.docs.amd.com/en/latest/install/rocm.html?fam=radeon&w=compute&os=ubuntu&ubuntu-ver=26.04.1&i=pkgman&gfx=gfx1201&gpu=amd-radeon-rx-9070
