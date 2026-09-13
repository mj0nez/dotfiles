# Tailscale

## Default setup

> [!NOTE]
>
> The default configuration is done via a daemon config file: [Doc](https://tailscale.com/docs/reference/tailscaled/tailescaled-config-file?q=daemon+config) and loaded via `tailscaled --config=/etc/tailscale/config.json`

To advertise routes add subnets to `tailscale_advertised_routes` on each host.

### With Auth Flow

Install tailscale and connect the machine to the tailnet via:

```sh
# do not add iptable rules and do not configure magic dns
sudo tailscale up --netfilter-mode=nodivert --accept-dns=false

To authenticate, visit:

        https://login.tailscale.com/a/abcdefg123456hijklmnop

Success.
```

### Server

To pre-enroll got to [tailscale.com](https://login.tailscale.com/admin/machines/new-linux). Create a temporary auth key and run:

```sh
sudo tailscale up --netfilter-mode=nodivert --accept-dns=false --auth-key=<generated auth key>
```

## Don't modify iptables and allow management with ufw

Per default Tailscale uses a iptables input rule which allows all traffic on tailscale0 see [GH-11717](https://github.com/tailscale/tailscale/issues/11717#issuecomment-2246515326) which circumvents ufw based ruling. To enable traffic management via ufw, we have to use `--netfilter-mode=nodivert` either with the `up` command or by configuring it as day-2-operation.

```bash
# list current iptables
sudo iptables -L INPUT

# reconfigure iptable mode
sudo tailscale set --netfilter-mode=nodivert

# delete and check the result
sudo iptables -D INPUT -j ts-input
sudo iptables -L INPUT

# restart tailscale daemon
sudo systemctl restart tailscaled
```

## Create a subnet router

Subnet routing allows to expose private subnets a tailscale client is connected to. This has the advantage that
you only have to configure one client instead of a client on each machine. But to act as a subnet router you will
have to configure some additional forwarding rules. See the following documentation:

- [connect-to-tailscale-as-a-subnet-router](https://tailscale.com/kb/1019/subnets#connect-to-tailscale-as-a-subnet-router)
- [linux-optimizations-for-subnet-routers-and-exit-nodes](https://tailscale.com/kb/1320/performance-best-practices#linux-optimizations-for-subnet-routers-and-exit-nodes)

With the configurations applied, you can bring up the client with

```sh
sudo tailscale up --advertise-routes=192.168.0.0/24 --accept-dns=false
```

> **NOTE**: To fully enable subnet routing, you'll have to approve the subnet-routes in the machine settings via the admin panel.

## Custom DNS settings

Tailscale's magic DSN hooks into the `/etc/resolv.conf` and overwrites it. To avoid this and use a custom DNS server like `CoreDNS` we must start tailscale like

```sh
sudo tailscale up --accept-dns=false
```

## Fixing Magic DNS / IPv6 error

Because of an incompatible kernel version we get the following error with Kernel `6.8.0-57-generic`:

```bash
$ tailscale status
# Health check:
#     - adding [-i tailscale0 -j MARK --set-mark 0x40000/0xff0000] in v6/filter/ts-forward: running [/usr/sbin/ip6tables -t filter -A ts-forward -i tailscale0 -j MARK --set-mark 0x40000/0xff0000 --wait]: exit status 2: Warning: Extension MARK revision 0 not supported, missing kernel module?
ip6tables v1.8.10 (nf_tables): MARK: bad value for option "--set-mark", or out of range (0-4294967295).
```

Get you kernel version with:

```bash
uname -r
```

The following issues [gh-15471](https://github.com/tailscale/tailscale/issues/15471) and [gh-13863](https://github.com/tailscale/tailscale/issues/13863) suggest a roll-back or upgrade to `6.11`.

We upgrade with the following command:

```bash
sudo apt install --install-recommends linux-generic-hwe-24.04
```

After a reboot, the newer kernel will be loaded automatically.

## Debugging

Für das Mappen des outputs: https://github.com/tailscale/tailscale/issues/2130#issuecomment-2873951317

```bash
$ sudo tailscale debug prefs
{
        "ControlURL": "https://controlplane.tailscale.com",
        "RouteAll": false,
        "ExitNodeID": "",
        "ExitNodeIP": "",
        "InternalExitNodePrior": "",
        "ExitNodeAllowLANAccess": false,
        "CorpDNS": true,
        "RunSSH": false,
        "RunWebClient": false,
        "WantRunning": true,
        "LoggedOut": false,
        "ShieldsUp": false,
        "AdvertiseTags": null,
        "Hostname": "",
        "NotepadURLs": false,
        "AdvertiseRoutes": null,
        "AdvertiseServices": null,
        "Sync": null,
        "NoSNAT": false,
        "NoStatefulFiltering": true,
        "NetfilterMode": 2,
        "AutoUpdate": {
                "Check": true,
                "Apply": true
        },
        "AppConnector": {
                "Advertise": false
        },
        "PostureChecking": false,
        "NetfilterKind": "",
        "DriveShares": null,
        "AllowSingleHosts": true,
        "Config": {
        }
}
```
