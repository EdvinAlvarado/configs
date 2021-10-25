# Prologue
This guide is mostly to document my [arch install](https://wiki.archlinux.org/title/installation_guide), be it with DE or without. Arch provides a higher level of customizability over any distro besides source-based distros (e.g. Gentoo). Some of the options taken here:

| types          | software          |
| -----          | --------          |
| kernel         | linux-zen         |
| CPU            | intel-ucode       | 
| GPU   		 | xf86-video-intel  |
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

[For encrypted BTRFS](https://github.com/EdvinAlvarado/configs/blob/master/Arch/Encryption%20BTRFS%20subvolumes%20with%20swap.md)

Assuming UEFI with GPT
### Partition Table
| partition | type | size | mount point |
| --------- | ---- | ---- | ----------- |
| /dev/sda1 | EFI  | 260M | /mnt/boot   |
| /dev/sda2 | swap | 4G   |             |
| /dev/sda3 | root | 60G  | /mnt        |
| /dev/sda4 | home | rest | /mnt/home   |

### Format Partition
Create partition as the table above
```
fdisk /dev/sda
fdisk /dev/sda
mkfs.fat -F 32 -n "BOOT" /dev/sda1
mkfs.ext4 -L "ROOT" /dev/sda3
mkfs.ext4 -L "HOME" /dev/sda4
mkswap /dev/sda2
swapon /dev/sda2
```

## Mount
```
mount /dev/sda3 /mnt
mount /dev/sda4 /mnt/home
mount /dev/sda1 /mnt/boot
```

## General Configuration
check /usr/share/zoneinfo for available regions and cities.
```
pacstrap /mnt base base-devel linux-zen linux-firmware neovim opendoas ranger python intel-ucode xf86-video-intel grub efibootmgr zsh git

genfstab -U /mnt >> /mnt/etc/fstab
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

## install Desktop Enviroment
There are various DEs and WMs that you can install. Most DEs already bring their own internet and wifi interface so the following chapter can be ignored.

## Setup Network

### minimal install
systemd-networkd is included in base. If you want a plug & play network config, check NetworkManager 
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

## Create non-sudo user
```
useradd -m <username>
passwd <username>
echo "permit persist :<username>" >> /etc/doas.conf
EDITOR=nvim visudo
# uncomment
# <username> ALL=(ALL) ALL
```

## Reboot
```
exit
umount -R /mnt
reboot
```

# Post-Instalation
login as your user

## Connect Wifi
if using a DE, use your DE's internet interface. Else use:

| systemd-networkd | NetworkManager |
| ---------------- | -------------- |
| iwctl            | nmtui          |

## Getting configs
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
