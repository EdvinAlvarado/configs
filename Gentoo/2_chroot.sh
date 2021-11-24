echo -n "mount point: "
read MOUNT

echo -n "live iso is gentoo? "
read DISTRO



mount --types proc /proc $MOUNT/proc
mount --rbind /sys $MOUNT/sys
mount --make-rslave $MOUNT/sys
mount --rbind /dev $MOUNT/dev
mount --make-rslave $MOUNT/dev
mount --bind /run $MOUNT/run
mount --make-slave $MOUNT/run

if [ $DISTRO != "yes" ]; then
	test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
	mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
	chmod 1777 /dev/shm
fi


chroot $MOUNT /bin/bash
