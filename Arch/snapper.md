# Snapshot Management


## Snapper Config

the default snapper config fails as it requires making @snapshots. As it is existing, we have to do it manually.
```
cp /usr/share/snapper/config-templates/default /etc/snapper/configs/root
```

You must also add config with the same name as the file to the following folder.
```
/etc/conf.d/snapper
-------------------
SNAPPER_CONFIGS="root"
```

Enable systemd automatic snapshots (or set cron daemon)
```
systemctl enable snapper-timeline.timer
systemctl start snapper-timeline.timer
systemctl enable snapper-cleanup.timer
systemctl start snapper-cleanup.timer
```

## Manually rollback
Boot from a liveusb and mount the the btrfs partition NOT the subvols. This example is assuming root and that the snapshot is number #.
```
mount /dev/mapper/cryptroot /mnt
btrfs subvolume delete @
btrfs subvolume snapshot /mnt/@snapshots/#/snapshot /mnt/@
```
Any subvolume under @ needs to be deleted before deleting @ and creating them after you complete copying the snapshot. If you want to save the current (or broken) @ subvol then save it to some other subvolume (e.g. @.broken)
