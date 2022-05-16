# Connect wifi
while true; do
	read -p "Will you need wifi? " yn
	case $yn in
		[Yy]* ) iwctl; break;;
		[Nn]* ) break;;
		*     ) echo "Yes or No?";;
	esac
done

# Test internet and set time
ping -c 3 www.google.ecom
timedatectl set-ntp true

# Mount Point
read -p "mount point (e.g. /mnt): " MOUNT
if [ ! -d $MOUNT ]
then
	mkdir $MOUNT
fi

# Partition
# Btrfs with luks1 and a swapfile with a separate efi dir.
# TODO make recovery directory actuall useful
echo "will have three partitions:"
echo "1) efi partition"
echo "2) recovery partition (WIP)"
echo "1) the rest of the system"
read -p "Storage partition (e.g. /dev/sda): " DEVICE
while true; do
	read -p "Default parition table? " yn
	case $yn in
		[Yy]* ) sfdisk $DEVICE < arch.sfdisk; break;;
		[Nn]* ) fdisk; break;;
		*     ) echo "Yes or No?";;
	esac
done

mkfs.fat -F 32 -n "EFI" "${DEVICE}1"
mkfs.ext4 -L "RECOVERY" "${DEVICE}2"
../btrfs/luks_btrfs_partition.sh "${DEVICE}3" $MOUNT "arch"
lsblk

# Arch Preparation
./arch-pre-chroot.sh $MOUNT

# Chroot
cp arch-post.chroot.sh $MOUNT/arch-post.chroot.sh
arch-chroot $MOUNT ./arch-post-chroot.sh

umount -f -l -R $MOUNT
reboot
