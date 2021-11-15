# $1 == device
# $2 == distro

# create
cryptsetup --type luks1 --label="CRYPTROOT" luksFormat $1
cryptsetup open $1 cryptroot
mkfs.btrfs -L ROOT /dev/mapper/cryptroot

mount /dev/mapper/cryptroot /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@swap

if [ $2 == "arch" ]
then
	btrfs subvolume create /mnt/@var_log
	mkdir -p /mnt/@/var/cache/pacman
	btrfs subvolume create /mnt/@/var/cache/pacman/pkg
fi

# mount
umount /mnt
mount -o compress=zstd,subvol=@ /dev/mapper/cryptroot /mnt
mkdir /mnt/{home,.snapshots,swap}
mount -o compress=zstd,subvol=@home /dev/mapper/cryptroot /mnt/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/cryptroot /mnt/.snapshots
mount -o subvol=@swap /dev/mapper/cryptroot /mnt/swap

if [ $2 == "arch" ]
then
	mkdir -p /mnt/var/log
	mount -o compress=zstd,subvol=@var_log /dev/mapper/cryptroot /mnt/var/log
fi


# swap
mkdir /mnt/{efi,recovery}
mount /dev/sda1 /mnt/efi
mount /dev/sda2 /mnt/recovery
cryptsetup luksHeaderBackup /dev/sda3 --header-backup-file /mnt/recovery/LUKS_header_backup.img

# crypto keyfile
dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
chmod 600 /crypto_keyfile.bin
chmod 600 /boot/initramfs-linux*
cryptsetup luksAddKey /dev/sda3 /crypto_keyfile.bin
