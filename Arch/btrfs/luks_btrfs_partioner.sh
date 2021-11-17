# $1 == mount
# $2 == device
# $3 == distro

# create
cryptsetup --type luks1 --label="CRYPTROOT" luksFormat $2
cryptsetup open $2 cryptroot
mkfs.btrfs -L ROOT /dev/mapper/cryptroot

mount /dev/mapper/cryptroot $1
btrfs subvolume create $1/@
btrfs subvolume create $1/@home
btrfs subvolume create $1/@snapshots
btrfs subvolume create $1/@swap

if [ $3 == "arch" ]
then
	btrfs subvolume create $1/@var_log
	mkdir -p $1/@/var/cache/pacman
	btrfs subvolume create $1/@/var/cache/pacman/pkg
fi

# mount
umount $1
mount -o compress=zstd,subvol=@ /dev/mapper/cryptroot $1
mkdir $1/{home,.snapshots,swap}
mount -o compress=zstd,subvol=@home /dev/mapper/cryptroot $1/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/cryptroot $1/.snapshots
mount -o subvol=@swap /dev/mapper/cryptroot $1/swap

if [ $3 == "arch" ]
then
	mkdir -p $1/var/log
	mount -o compress=zstd,subvol=@var_log /dev/mapper/cryptroot $1/var/log
fi


# swap
mkdir $1/{efi,recovery}
mount /dev/sda1 $1/efi
mount /dev/sda2 $1/recovery
cryptsetup luksHeaderBackup $2 --header-backup-file $1/recovery/LUKS_header_backup.img

# crypto keyfile
dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
chmod 600 /crypto_keyfile.bin
cryptsetup luksAddKey $2 /crypto_keyfile.bin
