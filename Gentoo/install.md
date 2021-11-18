# Gentoo Systemd Installation

To properly install Gentoo with systemd, we need a live iso that is using systemd (e.g. Arch Linux ISO). This guide will assume intel CPU and GPU. I will liberally link to my Arch Install Guide.

## Internet
For wireless


```
ip addr
net-setup wlan0
ntpd -q -g
```

## [Encrypted Btrfs](https://github.com/EdvinAlvarado/configs/blob/master/Arch/Encrypted%20Btrfs.md)

## Install base
Install the appropiate systemd stage3 tarball.
```
cd /mnt/gentoo
links https://www.gentoo.org/downloads/mirrors/
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
```

### chroot
```
mkdir -p /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
```

```
cd /mnt
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
```

For non-gentoo install medium
```
test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
chmod 1777 /dev/shm
```
If you are using the gentoo iso it will be /mnt/gentoo instead.
```
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"
ln -sf /proc/self/mounts /etc/mtab
```

## General Configuration
Update repo
```
emerge --sync
eselect news read
```

Confirm that you have the appripiate profile
```
eselect profile list
```

follow what is mentioned in the [Arch General Configuration](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#general-configuration) besides what is mentioned below.

### Portage Conguration
```
/etc/portage/make.conf
--------------------------
CFLAGS="-march=native ..."
MAKEOPTS='-j<X>'
VIDEO_CARDS="intel"
ACCEPT_LICENSE="-* @BINARY-REDISTRITBUTABLE"
USE="device-mapper mount cryptsetup initramfs"
```

### Packages
For whatever reason gentoo default is to use /etc/portage/package.use as a directory. I prefer to treat it as a file.
```
rmdir /etc/portage/package.use
touch /etc/portage/package.use
echo "sys-fs/cryptsetup kernel -gcrypt -openssl -udev" >> /etc/portage/package.use
```

```
touch /etc/portage/package.accept_keywords
echo "sys-fs/btrfs-progs ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-boot/grub:2 ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-fs/cryptsetup ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords
```

```
emerge -auDN @world
emerge -a linux-firmware btrfs-progs snapper cryptsetup genfstab vim genkernel dracut gentoo-sources intel-microcode xf86-video-intel networkmanager xorg-server dev-vcs/git sudo doas grub zsh ranger
```

Generate fstab
```
genfstab -U / >> /etc/fstab
```


## Bootloader and initramfs

Follow [standard](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#general-configuration) or [Encrypted Btrfs](https://github.com/EdvinAlvarado/configs/blob/master/Arch/Encrypted%20Btrfs.md#configure-mkinitcpio) for bootloader and initramfs.

the cmdline kernel parameters are different from Arch. You don't need the systemd parameter if using an initramfs made by dracut.

Kernel parameters require reference by UUID (or device?). Let's copy the UUID and put them in the correct place
```
blkid | egrep "(crypto_LUKS|ROOT)" >> /etc/default/grub
```
```
/etc/default/grub
------------------------------
GRUB_ENABLE_CRYPTODISK=y
GRUB_CMDLINE_LINUX="init=/lib/systemd/systemd crypt_root=UUID=<crypto_LUKLS-UUID> root=/dev/mapper/cryptroot rootflags=subvol=@ root_trim=yes rd.luks=1 rd.luks.key=/crypto_keyfile.bin"
```

```
eselect kernel list
eselect kernel set 1
```

Config genkernel
```
/etc/genkernel.conf
----------------------
MAKEOPTS="$(portageq envvar MAKEOPTS)"
LUKS="yes"
BTRFS="yes"
```

initramfs will not be created by mkinitcpio but by genkernel. If using encrypted Btrfs add ```--btrfs --luks```.
```
genkernel --btrfs --luks --symlink --menuconfig --bootloader=grub2 all
dracut -f -I /crypto_keyfile.bin
```

```
grub-install --target=x86_64-efi --efi-directory=/efi
grub-mkconfig -o /boot/grub/grub.cfg
```


## [Finishes](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#networkmanager)
