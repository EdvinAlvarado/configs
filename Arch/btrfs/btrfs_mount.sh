umount /mnt
mount -o compress=zstd,subvol=@ /dev/mapper/cryptroot /mnt
mkdir /mnt/{home,.snapshots,swap}
mkdir -p /mnt/var/log
mount -o compress=zstd,subvol=@home /dev/mapper/cryptroot /mnt/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/cryptroot /mnt/.snapshots
mount -o compress=zstd,subvol=@var_log /dev/mapper/cryptroot /mnt/var/log
mount -o subvol=@swap /dev/mapper/cryptroot /mnt/swap


truncate -s 0 /mnt/swap/swapfile
chattr +C /mnt/swap/swapfile
btrfs property set /mnt/swap/swapfile compression none

dd if=/dev/zero of=/mnt/swap/swapfile bs=1M count=4096
chmod 600 /mnt/swap/swapfile
mkswap /mnt/swap/swapfile
swapon /mnt/swap/swapfile

mkdir /mnt/{efi,recovery}
mount /dev/sda1 /mnt/efi
mount /dev/sda2 /mnt/recovery
cryptsetup luksHeaderBackup /dev/sda3 --header-backup-file /mnt/recovery/LUKS_header_backup.img
