DEVICE=$1
MOUNT=$2
DISTRO=$3

# Whether to create a swapfile or not
# Not needed thanks to zram
SWAPFILE=$4

# create
cryptsetup --type luks1 --label="CRYPTROOT" luksFormat $DEVICE
cryptsetup open $DEVICE cryptroot
mkfs.btrfs -L ROOT /dev/mapper/cryptroot

mount /dev/mapper/cryptroot $MOUNT
btrfs subvolume create $MOUNT/@
btrfs subvolume create $MOUNT/@home
btrfs subvolume create $MOUNT/@snapshots
if [ $SWAPFILE -eq 1 ]; then btrfs subvolume create $MOUNT/@swap; fi

if [ "$DISTRO" == "arch" ]; then
	btrfs subvolume create $MOUNT/@log
	btrfs subvolume create $MOUNT/@pkg
fi

# mount
umount $MOUNT
mount -o compress=zstd,subvol=@ /dev/mapper/cryptroot $MOUNT
mkdir $MOUNT/{home,.snapshots,swap}
mount -o compress=zstd,subvol=@home /dev/mapper/cryptroot $MOUNT/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/cryptroot $MOUNT/.snapshots
if [ $SWAPFILE -eq 1 ]; then mount -o subvol=@swap /dev/mapper/cryptroot $MOUNT/swap; fi

if [ "$DISTRO" == "arch" ]; then
	mkdir -p $MOUNT/var/log
	mount -o compress=zstd,subvol=@log /dev/mapper/cryptroot $MOUNT/var/log
	mkdir -p $MOUNT/var/cache/pacman/pkg
	mount -o compress=zstd,subvol=@pkg /dev/mapper/cryptroot $MOUNT/var/cache/pacman/pkg
fi


# swap
if [ $SWAPFILE -eq 1 ]; then
	truncate -s 0 $MOUNT/swap/swapfile
	chattr +C $MOUNT/swap/swapfile
	btrfs property set $MOUNT/swap/swapfile compression none

	dd if=/dev/zero of=$MOUNT/swap/swapfile bs=1M count=4096
	chmod 600 $MOUNT/swap/swapfile
	mkswap $MOUNT/swap/swapfile
	swapon $MOUNT/swap/swapfile
fi

# crypto keyfile
dd bs=512 count=4 if=/dev/random of=$MOUNT/crypto_keyfile.bin iflag=fullblock
chmod 600 $MOUNT/crypto_keyfile.bin
cryptsetup luksAddKey $DEVICE $MOUNT/crypto_keyfile.bin
