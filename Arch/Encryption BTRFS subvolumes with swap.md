

## Partition Table
| partition | type 	   | size | mount point |
| --------- | -------- | ---- | ----------- |
| /dev/sda1 | EFI  	   | 260M | /efi        |
| /dev/sda2 | Recovery | 1G   | /recovery   |
| /dev/sda3 | root 	   | rest | /           |

# Clean Disk
```
cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped
dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress
cryptsetup close to_be_wiped
```

# Prepare partition
```
fdisk /dev/sda
mkfs.fat -F 32 -n "EFI" /dev/sda1
mkfs.ext4 -L "RECOVERY" /dev/sda2
```

# Encrypt Partition
```
cryptsetup --type luks1 --label="RECOVERY" luksFormat  /dev/sda3 
cryptsetup luksDump /dev/sda3
```

# Make BTRFS root partition
```
cryptsetup open /dev/sda3 cryptroot
mkfs.btrfs -L ROOT /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt
```

subvolid=5
  |
  ├── @ -|
  |     contained directories:
  |       ├── /usr
  |       ├── /bin
  |       ├── /.snapshots
  |       ├── ...
  |
  ├── @home
  ├── @snapshots
  ├── @var_log
  └── @...

## Create top-level subvolumes
```
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@var_log
btrfs subvolume create /mnt/@swap
```

## Create subvolumes to excludes from snapshots
```
mkdir -p /mnt/@/var/cache/pacman
btrfs subvolume create /mnt/@/var/cache/pacman/pkg
```

## Mount top-level subvolumes
```
umount /mnt
mount -o compress=zstd,subvol=@ /dev/mapper/cryptroot /mnt
mkdir /mnt/{home,.snapshots,swap}
mkdir -p /mnt/var/log
mount -o compress=zstd,subvol=@home /dev/mapper/cryptroot /mnt/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/cryptroot /mnt/.snapshots
mount -o compress=zstd,subvol=@var_log /dev/mapper/cryptroot /mnt/var/log
mount -o subvol=@swap /dev/mapper/cryptroot /mnt/swap
```

## Mount the rest partition
```
mkdir /mnt/{efi,recovery}
mount /dev/sda1 /mnt/efi
mount /dev/sda2 /mnt/recovery
cryptsetup luksHeaderBackup /dev/sda3 --header-backup-file /mnt/recovery/LUKS_header_backup.img
```

## Create swapfile
```
truncate -s 0 /mnt/swap/swapfile
chattr +C /mnt/swap/swapfile
btrfs property set /mnt/swap/swapfile compression none

dd if=/dev/zero of=/mnt/swap/swapfile bs=1M count=4096
chmod 600 /mnt/swap/swapfile
mkswap /mnt/swap/swapfile
swapon /mnt/swap/swapfile
```

# Continue from pacstrap till mkinitcpio
Be sure to pacstrap btrfs-progsd

# Configure mkinitcpio

## Keyfile embedded in initramfs
```
dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
chmod 600 /crypto_keyfile.bin
chmod 600 /boot/initramfs-linux*
cryptsetup luksAddKey /dev/sda3 /crypto_keyfile.bin
```

```
/etc/mkinitcpio.conf
-------------------
FILES=(/crypto_keyfile.bin)
BINARIES=(btrfs)
HOOKS=(keymap consolefont encrypt)
```

## Regenerate initramfs
```
mkinitcpio -P
```

# Configure GRUB
```
/etc/default/grub
---------------------------
GRUB_DISABLE_RECOVERY=false
GRUB_ENABLE_CRYPTODISK=y
GRUB_CMDLINE_LINUX="cryptdevice:/dev/sda3:cryptroot:allow-discards"

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```
