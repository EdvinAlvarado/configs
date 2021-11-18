# $1 == mount
# $2 == distro

mount --types proc /proc $1/proc
mount --rbind /sys $1/sys
mount --make-rslave $1/sys
mount --rbind /dev $1/dev
mount --make-rslave $1/dev
mount --bind /run $1/run
mount --make-slave $1/run

if [ $2 -ne "gentoo" ]
	test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
	mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
	chmod 1777 /dev/shm
fi


mirrorselect -i -o >> $1/etc/fstab
chroot $1 /bin/bash
