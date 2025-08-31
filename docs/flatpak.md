# Flatpak

The nextcloud-clients are either pretty old or do not function when installing from source.
Therefore the official but not verified flatpak app is used:

https://flathub.org/apps/com.nextcloud.desktopclient.nextcloud

> **NOTE**: Don't forget to add an autostart entry for `/usr/bin/flatpak run com.nextcloud.desktopclient.nextcloud`

## Auto-Updates

We create a systemd service and a corresponding timer to auto-update out flatpaks.

```ini
#/etc/systemd/system/update-system-flatpaks.service
[Unit]
Description=Update system Flatpaks
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/bin/flatpak update --assumeyes --noninteractive --system

[Install]
WantedBy=multi-user.target
```

```ini
#/etc/systemd/system/update-system-flatpaks.timer
[Unit]
Description=Update system Flatpaks daily

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target
```

```bash
sudo systemctl --system enable --now update-system-flatpaks.timer
```
