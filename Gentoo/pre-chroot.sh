read -p "Mount point: " MOUNT

# getting stage3
cd $MOUNT
links https://www.gentoo.org/downloads/mirrors/
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

# Configuration
mkdir -p $MOUNT/etc/portage/repos.conf
cp $MOUNT/usr/share/portage/config/repos.conf $MOUNT/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf $MOUNT/etc/

# Get Mirrors
mirrorselect -i -o >> $MOUNT/etc/fstab

# chroot
mount --types proc /proc $MOUNT/proc
mount --rbind /sys $MOUNT/sys
mount --make-rslave $MOUNT/sys
mount --rbind /dev $MOUNT/dev
mount --make-rslave $MOUNT/dev
mount --bind /run $MOUNT/run

while true; do
	read -p "Live ISO is gentoo install medium? " DISTRO
	case $DISTRO in
		[Yy]* ) exit;;
		[Nn]* ) test -L /dev/shm && rm /dev/shm && mkdir /dev/shm; mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm; chmod 1777 /dev/shm; break;;
		*     ) echo "Please answer yer or no";;
	esac
done

chroot $MOUNT /bin/bash
