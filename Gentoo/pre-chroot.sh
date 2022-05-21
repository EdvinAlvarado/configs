PRE_CHROOT_SCRIPT="pre-chroot.sh"
POST_CHROOT_SCRIPT="post-chroot.sh"
DISTRO="gentoo"

lsblk

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
	read -p "Default partition table? " yn
	case $yn in
		[Yy]* ) sfdisk $DEVICE < ../Arch/arch.sfdisk; break;;
		[Nn]* ) fdisk $DEVICE; break;;
		*     ) echo "Yes or No?";;
	esac
done
'''
fdisk $DEVICE << EOF
g
n


+500M
n


+1G
n



w
'''

# Partition Formatting
mkfs.fat -F 32 -n "BOOT" "${DEVICE}1"
mkfs.ext4 -L "RECOVERY" "${DEVICE}2"
../btrfs/luks_btrfs_partition.sh "${DEVICE}3" $MOUNT $DISTRO 0
mkdir $MOUNT/{efi,recovery}
mount /dev/sda1 $MOUNT/efi
mount /dev/sda2 $MOUNT/recovery
cryptsetup luksHeaderBackup "${DEVICE}3" --header-backup-file $MOUNT/recovery/LUKS_header_backup.img
lsblk
sleep 5

# getting stage3
if [ "$(which links | grep 'not found')" != "" ]; then pacman -S links; fi
links https://www.gentoo.org/downloads/mirrors/
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner --directory $MOUNT

# TODO add gentoo based filer
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

mirroselect -i -o >> $MOUNT/etc/portage/make.conf 


cp $POST_CHROOT_SCRIPT $MOUNT/$POST_CHROOT_SCRIPT
sleep 10

### Portage ---------------------------------------------------------------------------------------
# Confirm appropiate profile
eselect profile list

# package.use
touch $MOUNT/etc/portage/package.use/main
echo 'sys-fs/cryptsetup kernel -gcrypt -openssl -udev' >> $MOUNT/etc/portage/package.use/main

# accept_keywords
touch $MOUNT/etc/portage/package.accept_keywords/main
echo "sys-fs/btrfs-progs ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/main
echo "sys-boot/grub:2 ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/main
echo "sys-fs/cryptsetup ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/main
echo "sys-kernel/gentoo-sources ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/main

touch $MOUNT/etc/portage/package.accept_keywords/zram
echo "sys-apps/zram-generator ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/zram
echo "app-text/ronn-ng ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/zram
echo "dev-ruby/kramdown ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/zram
echo "dev-ruby/stringex ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/zram

touch $MOUNT/etc/portage/package.accept_keywords/flatpak
echo "sys-apps/flatpak ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/flatpak
echo "acct-user/flatpak ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/flatpak
echo "acct-group/flatpak ~amd64" >> $MOUNT/etc/portage/package.accept_keywords/flatpak

# $MOUNT/etc/portage/make.conf
while true; do
	read -p "Write the minimum of your cpu cores or RAM divided by 2: " MAKEOPTS
	if [[ $MAKEOPTS =~ ^[0-9]+$ ]]; then
		MAKE="MAKEOPTS=\"-j${MAKEOPTS}\"";
		echo "$MAKE" >> $MOUNT/etc/portage/make.conf; break;
	else
		echo "write a number...: ";
	fi
done

while true; do
	read -p "Write a graphic driver: " VIDEO 
	case $VIDEO in
		intel|amdgpu|radeon|nvidea|nouveau|virtualbox|vmware ) echo "VIDEO_CARDS=\"${VIDEO}\"" >> $MOUNT/etc/portage/make.conf; break;;
		*        ) echo "write an acceptable video card...";;
	esac
done

echo 'GRUB_PLATFORMS="efi-64"' >> $MOUNT/etc/portage/make.conf
echo 'ACCEPT_LICENSE="-* @BINARY-REDISTRIBUTABLE"' >> $MOUNT/etc/portage/make.conf
echo 'USE="device-mapper mount cryptsetup initramfs"' >> $MOUNT/etc/portage/make.conf

sed -i 's/COMMON_FLAGS="/COMMON_FLAGS="-march=native /g' $MOUNT/etc/portage/make.conf



chroot $MOUNT /bin/bash -c "./${POST_CHROOT_SCRIPT} ${DEVICE}"
sleep 10
umount -f -l -R $MOUNT
reboot
