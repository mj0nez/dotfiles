# My dotfiles

## Settings

1. Language & Region
   - Change region in language settings - apply english USA system-wide to set en_US.utf8
1. Add src-repositories to apt sources
   - navigate to Settings > About > Software Updates > Ubuntu Software > activate "Source code"

To make sure the changes apply, logout and re-login.

add user to sudo group

```bash
$ su - root
Password:
$ sudo usermod -aG sudo <username>
$ groups <username>
```

make sure to kill the current session and create a new one

## Installation

```bash
$ su - <username>
Password:
```

Run either one of the two setup scripts

- [setup_basic.sh](/setup_basic.sh) - with git, curl, make, zsh
- [setup_full.sh](/setup_full.sh) - the above basics and also pyenv, pipx, VS-Code, DBeaver, Postman

with

```bash

sudo wget -qO- https://raw.githubusercontent.com/mj0nez/dotfiles/main/setup_basic.sh | bash

```

or

```bash
sudo wget -qO- https://raw.githubusercontent.com/mj0nez/dotfiles/main/setup_full.sh | bash

```

Lastly, set the loaded terminal profile as default by opening a terminal > Preferences > "zsh-terminal-profile"

## Updating the terminal profile

To see all profiles run

```bash
dconf dump /org/gnome/terminal/legacy/profiles:/
```

Dump a profile with

```bash
dconf dump /org/gnome/terminal/legacy/profiles:/:461f8ee8-d5f7-4da5-9de2-58ab7f40cf4a/ > .terminal-profile.dconf
```

To load the profile (this is done by [zsh.sh](/programs/zsh.sh))

```bash
dconf load /org/gnome/terminal/legacy/profiles:/:461f8ee8-d5f7-4da5-9de2-58ab7f40cf4a/ < .terminal-profile.dconf
```

### Set fonts manually

Change the following setting in VS-Code

```json
    "terminal.integrated.fontFamily": "Agave Nerd Font"
```

And fix the font in your terminal via Preferences > <Current Profile> > Font > Agave Nerd Font

## FAQ

### Docker-Compose version problems

```bash
sudo rm /usr/bin/docker-compose
❯ sudo ln -s /usr/libexec/docker/cli-plugins/docker-compose /usr/bin/docker-compose
❯ which docker-compose
/usr/bin/docker-compose
❯ docker-compose
```

### Trace Git errors

```bash
# activate general traces
# for more variables see https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables
export GIT_TRACE=1
```
