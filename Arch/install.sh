# Connect internet
iwctl
ping -c 3 www.google.ecom
timedatectl set-ntp true

# Mount Point
read -p "mount point (e.g. /mnt): " MOUNT
if [ ! -d $MOUNT ]
then
	mkdir $MOUNT
fi

# Partition
read -p "Storage partition (e.g. /dev/sda): " DEVICE
sfdisk $DEVICE < arch.sfdisk
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
