PRE_CHROOT_SCRIPT="arch-pre-chroot.sh"
POST_CHROOT_SCRIPT="arch-post-chroot.sh"
DISTRO="arch"

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
ping -c 3 www.google.com
timedatectl set-ntp true
sleep 1

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
echo "1) the rest of the system"
read -p "Storage partition (e.g. /dev/sda): " DEVICE
while true; do
	read -p "Default partition table? " yn
	case $yn in
		[Yy]* ) sfdisk $DEVICE < arch.sfdisk; break;;
		[Nn]* ) fdisk $DEVICE; break;;
		*     ) echo "Yes or No?";;
	esac
done


# Partition Formatting
mkfs.fat -F 32 -n "BOOT" "${DEVICE}1"
../btrfs/luks_btrfs_partition.sh "${DEVICE}2" $MOUNT $DISTRO
mkdir $MOUNT/{efi}
mount "${DEVICE}1" $MOUNT/efi
cryptsetup luksHeaderBackup "${DEVICE}2" --header-backup-file $MOUNT/recovery/LUKS_header_backup.img
lsblk
sleep 5

# pacstrap
./$PRE_CHROOT_SCRIPT $MOUNT
# Mount Configuration
genfstab -U $MOUNT >> $MOUNT/etc/fstab
vim $MOUNT/etc/fstab
sed -i -e "s/#ParallelDownloads = 5/ParallelDownloads = 10/" >> $MOUNT/etc/pacman.conf
# Chroot
cp $POST_CHROOT_SCRIPT $MOUNT/$POST_CHROOT_SCRIPT
arch-chroot $MOUNT ./$POST_CHROOT_SCRIPT "${DEVICE}2"
echo "Complete!"
sleep 10
umount -f -l -R $MOUNT
reboot
