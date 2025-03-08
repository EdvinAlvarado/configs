# Prologue
This guide is mostly to document my [arch install](https://wiki.archlinux.org/title/installation_guide), be it with DE or without. Arch provides a higher level of customizability over any distro besides source-based distros (e.g. Gentoo). Some of the options taken here:

| types          | software          |
| -----          | --------          |
| kernel         | linux-zen         |
| editor         | neovim            |
| bootloader     | grub,efibootmgr   |
| root privilege | sudo,opendoas     |
| misc           | ranger,python,git |

# Installation

## Connect to Wireless
```
iwctl
station wlan0 scan
station wlan0 connect <wifi>
<wifi password>
quit
ping -c 3 www.google.com
```

## Updating System Clock
```
timedatectl set-ntp true
```

## Partition disk

### Partition Table
| partition | type  		| size | mount point			|
| --------- | ------------	| ---- | ---------------------	|
| /dev/sda1 | FAT32 		| 500M | /boot					|
| /dev/sda2 | ext4			| 1G   | /recovery				|
| /dev/sda3 | Btrfs/crypt	| rest | /						|
|           |       		|      | /home					|
|           |       		|      | /var/log				|
|           |       		|      | /var/cache/pacman/pkg	|
|           |       		|      | /.snapshots			|
|           |       		|      | /swap					|

### Format Partition
Create partition as the table above
```
fdisk /dev/sda
mkfs.fat -F 32 -n "BOOT" /dev/sda1
mkfs.ext4 -L "ROOT" /dev/sda3
mkfs.ext4 -L "HOME" /dev/sda4
```

### Mount
```
swapon /dev/sda2
mount /dev/sda3 /mnt
mount /dev/sda4 /mnt/home
mount /dev/sda1 /mnt/boot
```

## General Configuration
check /usr/share/zoneinfo for available regions and cities.
```
genfstab -U /mnt >> /mnt/etc/fstab

pacstrap /mnt base base-devel linux-zen linux-firmware neovim opendoas ranger python intel-ucode xf86-video-intel grub efibootmgr zsh git

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/<region>/<city> /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "<hostname>" >> /etc/hostname

passwd
```

## Bootloader and initramfs
```
mkinitcpio -P

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## Install Desktop Enviroment
There are various DEs and WMs that you can install. Most DEs already bring their own internet and wifi interface so continue to [User Configuration](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#user-configuration).

## Setup Network

### minimal install
systemd-networkd is included in base. If you want a plug & play network config, check [NetworkManager](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#networkmanager) 
```
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
```
#### ethernet
```
nvim /etc/systemd/network/wired.network
-------------------
[Match]
Type=ether

[Network]
DHCP=yes
-------------------
```
#### wireless
```
nvim /etc/systemd/network/wireless.network
-------------------
[Match]
Type=wlan

[Network]
DHCP=yes
-------------------
```
##### wifi software
systemd-networkd requires another package for wifi connection.
```
pacman -S iwd
```

### NetworkManager
It is a bigger package but it is much easier to config
```
pacman -S networkmanager
systemctl enable NetworkManager.service
```

## User Configuration
```
useradd -m <username>
passwd <username>
echo "permit persist :<username>" >> /etc/doas.conf
```

Add user to sudo
```
EDITOR=nvim visudo
# <username> ALL=(ALL) ALL
```

## Reboot
```
exit
umount -f -l -R /mnt
reboot
```

# Post-Installation
login as your user

## Connect Wifi
if using a DE, use your DE's internet interface. Else use:

| systemd-networkd | NetworkManager |
| ---------------- | -------------- |
| iwctl            | nmtui          |

## Getting configs
(WIP) You might have to create the parent directories yourself. curl in nvim_setup is not working properly.
```
git clone https://github.com/EdvinAlvarado/configs.git
cd configs
./recover.sh
./nvim_setup.sh
cd ~
```

## AUR
There are a many AUR wrappers to choose. Here we install one written on python.
```
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd ~
```

see Arch Linux [General Recommendations](https://wiki.archlinux.org/title/General_recommendations)
