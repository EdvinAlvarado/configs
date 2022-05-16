# Snapshot Management


## Snapper Config

run arch-post-reboot.sh


## Manually rollback
Boot from a liveusb and mount the the btrfs partition NOT the subvols. This example is assuming root and that the snapshot is number #.
```
mount /dev/mapper/cryptroot /mnt
btrfs subvolume delete @
btrfs subvolume snapshot /mnt/@snapshots/#/snapshot /mnt/@
```
Any subvolume under @ needs to be deleted before deleting @ and creating them after you complete copying the snapshot. If you want to save the current (or broken) @ subvol then save it to some other subvolume (e.g. @.broken)
