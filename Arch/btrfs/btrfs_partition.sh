mkfs.btrfs -L ROOT /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt
mount subvolume create /mnt/@
mount subvolume create /mnt/@home
mount subvolume create /mnt/@snapshots
mount subvolume create /mnt/@var_log
mount subvolume create /mnt/@swap
mkdir -p /mnt/@/var/cache/pacman
btrfs subvolume create /mnt/@/var/cache/pacman/pkg
