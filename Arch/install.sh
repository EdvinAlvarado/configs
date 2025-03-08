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
# TODO nvme only works id they put the "p".
read -p "Which is the drive device to install linux on? (e.g. /dev/sda or /dev/nvme0n1p): " DEVICE
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
mkdir $MOUNT/{boot}
mount "${DEVICE}1" $MOUNT/boot
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
cp -r repos $MOUNT/repos
arch-chroot $MOUNT ./$POST_CHROOT_SCRIPT "${DEVICE}2"
echo "Complete!"
sleep 10
umount -f -l -R $MOUNT
reboot
