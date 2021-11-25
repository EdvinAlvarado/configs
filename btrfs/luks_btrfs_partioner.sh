read -p "mount point (e.g. /mnt/gentoo): " MOUNT
lsblk
read -p "Storage partition (e.g. /dev/sda3)" DEVICE
while true; do
	read -p "Are you installing Arch? " yn
	case $yn in
		[Yy]* ) DISTRO="arch"; break;;
		[Nn]* ) DISTRO=""; break;;
		*     ) echo "Answer yes or no...";;
	esac
done


# create
cryptsetup --type luks1 --label="CRYPTROOT" luksFormat $DEVICE
cryptsetup open $DEVICE cryptroot
mkfs.btrfs -L ROOT /dev/mapper/cryptroot

mount /dev/mapper/cryptroot $MOUNT
btrfs subvolume create $MOUNT/@
btrfs subvolume create $MOUNT/@home
btrfs subvolume create $MOUNT/@snapshots
btrfs subvolume create $MOUNT/@swap

if [ "$DISTRO" == "arch" ]; then
	btrfs subvolume create $MOUNT/@var_log
	mkdir -p $MOUNT/@/var/cache/pacman
	btrfs subvolume create $MOUNT/@/var/cache/pacman/pkg
fi

# mount
umount $MOUNT
mount -o compress=zstd,subvol=@ /dev/mapper/cryptroot $MOUNT
mkdir $MOUNT/{home,.snapshots,swap}
mount -o compress=zstd,subvol=@home /dev/mapper/cryptroot $MOUNT/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/cryptroot $MOUNT/.snapshots
mount -o subvol=@swap /dev/mapper/cryptroot $MOUNT/swap

if [ "$DISTRO" == "arch" ]; then
	mkdir -p $MOUNT/var/log
	mount -o compress=zstd,subvol=@var_log /dev/mapper/cryptroot $MOUNT/var/log
fi

mkdir $MOUNT/{efi,recovery}
mount /dev/sda1 $MOUNT/efi
mount /dev/sda2 $MOUNT/recovery
cryptsetup luksHeaderBackup $DEVICE --header-backup-file $MOUNT/recovery/LUKS_header_backup.img

# swap
truncate -s 0 $MOUNT/swap/swapfile
chattr +C $MOUNT/swap/swapfile
btrfs property set $MOUNT/swap/swapfile compression none

dd if=/dev/zero of=$MOUNT/swap/swapfile bs=1M count=4096
chmod 600 $MOUNT/swap/swapfile
mkswap $MOUNT/swap/swapfile
swapon $MOUNT/swap/swapfile

# crypto keyfile
dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
chmod 600 /crypto_keyfile.bin
cryptsetup luksAddKey $DEVICE /crypto_keyfile.bin

# File Configuration
if [ "$DISTRO" == "arch" ]; then
	sed -i "s/BINARIES=()/BINARIES=(btrfs)/g" $MOUNT/etc/mkinitcpio.conf
	sed -i "s/FILES=()/FILES=(/crypto_keyfile.bin)/g" $MOUNT/etc/mkinitcpio.conf
	sed -i "s/keyboard/keyboard keymap consolefont encrypt/g" $MOUNT/etc/mkinitcpio.conf

	sed -i "s/#GRUB_ENABLE_CRYPTODISK=*$/GRUB_ENABLE_CRYPTODISK=y/g" $MOUNT/etc/default/grub
	sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cryptdevice=$DEVICE:cryptroot:allow-discards"/g' $MOUNT/etc/default/grub
fi
