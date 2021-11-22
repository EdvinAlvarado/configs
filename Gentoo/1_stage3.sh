echo -n "Mount point: "
read MOUNT

cd $MOUNT
links https://www.gentoo.org/downloads/mirrors/
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

mkdir -p $MOUNT/etc/portage/repos.conf
cp $MOUNT/usr/share/portage/config/repos.conf $MOUNT/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf $MOUNT/etc/
