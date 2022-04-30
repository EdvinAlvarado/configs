lsblk
read -p "drive (e.g. /dev/sda): " DRIVE
fdisk $DRIVE

while true; do
	read -p "encrypted Btrfs?" yn
	case $yn in
		[Yy]* ) cd ~/configs/btrfs; ./efi_fat_partition.sh && ./luks_btrfs_partition.sh; break;;
		[Nn]* ) read -p "write script for partitions: " ALT; $ALT; break;;
	esac
done

read -p "Mount point: " MOUNT

while true; do
	read -p "Live ISO is gentoo install medium? " DISTRO
	case $DISTRO in
		[Yy]* ) break;;
		[Nn]* ) test -L /dev/shm && rm /dev/shm && mkdir /dev/shm; mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm; chmod 1777 /dev/shm; pacman -S links; break;;
		*     ) echo "Please answer yer or no";;
	esac
done
# getting stage3
cd $MOUNT
links https://www.gentoo.org/downloads/mirrors/
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

# Configuration
mkdir -p $MOUNT/etc/portage/repos.conf
cp $MOUNT/usr/share/portage/config/repos.conf $MOUNT/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf $MOUNT/etc/


# chroot
mount --types proc /proc $MOUNT/proc
mount --rbind /sys $MOUNT/sys
mount --make-rslave $MOUNT/sys
mount --rbind /dev $MOUNT/dev
mount --make-rslave $MOUNT/dev
mount --bind /run $MOUNT/run

case $DISTRO in
	[Yy]* ) mirroselect -i -o >> $MOUNT/etc/portage/make.conf; break;; 
	[Nn]* ) echo "Mirror not written"; break;;


mkdir $MOUNT/configs
cp -r ~/configs $MOUNT/configs
echo "RUN THE FOLLOWING COMMANDS"
echo "source /etc/profile"
echo "export PS1="(chroot) ${PS1}""
chroot $MOUNT /bin/bash
