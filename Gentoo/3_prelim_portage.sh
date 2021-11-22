read -p "# of MAKEOPTS: " MAKEOPTS
read -p "VIDEO_CARDS: " VIDEO

source /etc/profile
export PS1="(chroot) ${PS1}"
ln -sf /proc/self/mounts /etc/mtab

# update repo
emerge --sync
eselect news read

# Confirm appropiate profile
eselect profile list

# package.use
rmdir /etc/portage/package.use
touch /etc/portage/package.use
echo 'sys-fs/cryptsetup kernel -gcrypt -openssl -udev' >> /etc/portage/package.use

# accept_keywords
rm /etc/portage/package.accept_keywords
touch /etc/portage/package.accept_keywords
echo "sys-fs/btrfs-progs ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-boot/grub:2 ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-fs/cryptsetup ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords

# /etc/portage/make.conf
echo 'MAKEOPTS="-j$MAKEOPTS"' >> /etc/portage/make.conf
echo 'VIDEO_CARDS="$VIDEO"' >> /etc/portage/make.conf
echo 'ACCEPT_LICENSE="-* @BINARY-REDISTRIBUTABLE"' >> /etc/portage/make.conf
echo 'USE="device-mapper mount cryptsetup initramfs"' >> /etc/portage/make.conf

