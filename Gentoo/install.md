# Gentoo Systemd Installation

To properly install Gentoo with systemd, we need a live iso that is using systemd (e.g. Arch Linux ISO). This guide will assume intel CPU and GPU. I will liberally link to my Arch Install Guide.

## [Follow from Connect to Wireless to mount](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#installation)

### chroot

```
mkdir -p /mnt/etc/portage/repos.conf
cp /mnt/usr/share/portage/config/repos.conf /mnt/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/etc/
```

if using gentoo iso, it will be /mnt/gentoo instead.
```
cd /mnt
mount --types proc /proc proc
mount --rbind /sys sys
mount --make-rslave sys
mount --rbind /dev dev
mount --make-rslave dev
mount --bind /run run
mount --make-slave run

test -L /dev/shm && rm /dev/shm && mkdir /dev/shm
mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
chmod 1777 /dev/shm
```

If you are using the gentoo iso it will be /mnt/gentoo instead.
```
chroot /mnt /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"
```

## General Configuration
Update repo
```
emerge --sync
```

Confirm that you have the appripiate profile
```
eselect profile list
```

follow what is mentioned in the [Arch General Configuration](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#general-configuration) besides what is mentioned below.

### Portage Conguration
the gentoo iso brings a convenient "mirrorselect" package which automatically added all the mirrors. But Arch iso does not have that. The number in MAKEOPTS will be the lesser of CPU threads or ram/2.
```
/etc/portage/make.conf
--------------------------
CFLAGS="-march=native ..."
MAKEOPTS='-j<X>'
VIDEO_CARDS="intel"
ACCEPT_LICENSE="-* @BINARY_REDISTRITBUTABLE"

USE="device-mapper mount"

GENTOO_MIRRORS="<https://gentoo.osuosl.org/>"
```

### Packages
```
emerge -auDN @world
emerge -a linux-firmware btrfs-progs snapper cryptsetup genfstab vim genkernel dracut gentoo-sources intel-microcode xf86-video-intel networkmanager xorg-server dev-vcs/git doas grub os-prober
```


## Bootloader and initramfs


Follow [standard](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#general-configuration) or [Encrypted Btrfs](https://github.com/EdvinAlvarado/configs/blob/master/Arch/Encrypted%20Btrfs.md#configure-mkinitcpio) for bootloader and initramfs.

the cmdline kernel parameters are different from Arch.
```
/etc/default/grub
------------------------------
GRUB_ENABLE_CRYPTODISK=y
GRUB_CMDLINE_LINUX="crypt_root=/dev/sda3 root=/dev/mapper/cryptroot"
```

```
eselect kernel list
eselect kernel set 1
```

initramfs will not be created by mkinitcpio but by genkernel. If using encrypted Btrfs add ```--btrfs --luks```.
```
genkernel --btrfs --luks --symlink --menuconfig --bootloader=grub2 all
dracut -f -I /crypto_keyfile.bin
```
