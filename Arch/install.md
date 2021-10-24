# Connect to Wireless
```
iwctl
station wlan0 scan
station wlan0 connect <wifi>
<wifi password>
quit
ping -c 3 www.google.com
```

# Updating System Clock
```
timedatectl set-ntp true
```

# Partition disk

[For encrypted BTRFS]("Encruption BTRFS subvolumes with swap.md")

Assuming UEFI with GPT
## Partition Table
| partition | type | size | mount point |
| --------- | ---- | ---- | ----------- |
| /dev/sda1 | EFI  | 260M | /mnt/boot   |
| /dev/sda2 | swap | 4G   |             |
| /dev/sda3 | root | 60G  | /mnt        |
| /dev/sda4 | home | rest | /mnt/home   |

## Format Partition
```
fdisk /dev/sda
mkfs.fat -F 32 -n "BOOT" /dev/sda1
mkfs.ext4 -L "ROOT" /dev/sda3
mkfs.ext4 -L "HOME" /dev/sda4
mkswap /dev/sda2
swapon /dev/sda2
```

# Mount
```
mount /dev/sda3 /mnt
mount /dev/sda4 /mnt/home
mount /dev/sda1 /mnt/boot
pacstrap /mnt base base-devel linux-zen linux-firmware neovim opendoas ranger python intel-ucode grub efibootmgrzsh iwctl
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```
# General Configuration
```
ln -sf /usr/share/zoneinfo/<region>/<city> /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "<hostname>" >> /etc/hostname
mkinitcpio -P
passwd
```

# GRUB Configuration
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

# Setup Network

## minimal install
systemd-networkd is included in base. If you want a plug & play network config, check NetworkManager 
```
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
```
### ethernet
```
cd /etc/systemd/network/
nvim wired.network
-------------------
[Match]
Type=ether

[Network]
DHCP=yes
-------------------
cd /
```
### wireless
```
cd /etc/systemd/network/
nvim wireless.network
-------------------
[Match]
Type=wlan

[Network]
DHCP=yes
-------------------
cd /
pacman -S iwd
iwctl
```

## NetworkManager
It is a bigger package but it is much easier to config
```
pacman -S networkmanager
systemctl enable NetworkManager.service
```

# Reboot
```
exit
umount -R /mnt
reboot
```

# Post-Instalation
```
useradd -m <username>
passwd <username>
nmtui
```
