# SSH

Because I'm always looking it up...

```txt
# SSH will interpret each of the Host sections that match the hostname given on the command line, in order.
# During this process, it will always use the first value given for each option.
# There is no way to override a value that has already been given by a previously matched section.
#
# This means that your config file should follow the rule of having the most specific configurations at the top.
# More general definitions should come later on in order to apply options that were not defined by the previous matching sections.
#
# see https://www.digitalocean.com/community/tutorials/how-to-configure-custom-connection-options-for-your-ssh-client [last accessed 2025-07-09]
#
# and the man page https://www.man7.org/linux/man-pages/man5/ssh_config.5.html
#

Host github.com
	User git
	HostName github.com
	PreferredAuthentications publickey
	IdentityFile ~/.ssh/github

Host *
	IdentitiesOnly yes
	AddKeysToAgent yes

```
