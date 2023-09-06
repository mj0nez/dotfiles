# My dotfiles

change region an language settings - apply english USA system-wide to set en_US.utf8

To make sure the changes apply, logout and re-login.

add user to sudo group

```bash
$ su - root
Password:
$ sudo usermod -aG sudo <username>
$ groups <username>
```

make sure to kill the current session and create a new one
now run the following script to download the sup

```bash
$ su - <username>
Password:
sudo wget -qO- https://raw.githubusercontent.com/mj0nez/dotfiles/main/setup.sh | bash
 
```

github caches raw files for 5 min...
