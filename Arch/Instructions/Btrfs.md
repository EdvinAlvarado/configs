# Btrfs
Btrfs provides recoverable snapshots and dynamic "partitions". Also included a /recovery to create a live cd like recovery(WIP).

## Partition Table
all paritions (including swap) besides the EFI boot will be made inside Btrfs as subvolumes.
| partition | type 	   | size | mount point |
| --------- | -------- | ---- | ----------- |
| /dev/sda1 | EFI  	   | 260M | /boot       |
| /dev/sda2 | Recovery | 1G   | /recovery   |
| /dev/sda3 | root 	   | rest | /           |

## Clean Disk
```
cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped
dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress
cryptsetup close to_be_wiped
```

## Prepare Partition
```
fdisk /dev/sda
mkfs.fat -F 32 -n "EFI" /dev/sda1
mkfs.ext4 -L "RECOVERY" /dev/sda2
mkfs.btrfs -L ROOT /dev/sda3
```

We will use the following branches to build our Btrfs.
WIP. this doesn't show properly in github.
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

#### Create top-level subvolumes
```
mount /dev/sda3 /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@var_log
btrfs subvolume create /mnt/@swap
```

#### Create subvolumes to excludes from snapshots
```
mkdir -p /mnt/@/var/cache/pacman
btrfs subvolume create /mnt/@/var/cache/pacman/pkg
```

#### Mount top-level subvolumes
```
umount /mnt
mount -o compress=zstd,subvol=@ /dev/sda3 /mnt
mkdir /mnt/{home,.snapshots,swap}
mkdir -p /mnt/var/log
mount -o compress=zstd,subvol=@home /dev/sda3 /mnt/home
mount -o compress=zstd,subvol=@snapshots /dev/sda3 /mnt/.snapshots
mount -o compress=zstd,subvol=@var_log /dev/sda3 /mnt/var/log
mount -o subvol=@swap /dev/sda3 /mnt/swap
```

#### Create swapfile
Here the size of the swapfile is set to 4GB. You can calculate and change the swapfile size by changing the dd parameters of bs and count.
```
truncate -s 0 /mnt/swap/swapfile
chattr +C /mnt/swap/swapfile
btrfs property set /mnt/swap/swapfile compression none

dd if=/dev/zero of=/mnt/swap/swapfile bs=1M count=4096
chmod 600 /mnt/swap/swapfile
mkswap /mnt/swap/swapfile
swapon /mnt/swap/swapfile
```

### Mount the non-btrfs partitions
```
mkdir /mnt/{efi,recovery}
mount /dev/sda1 /mnt/efi
mount /dev/sda2 /mnt/recovery
```

Continue from [General Configuration](https://github.com/EdvinAlvarado/configs/blob/master/Arch/install.md#general-configuration) but remember to add btrfs-progs and snapper to pacstrap.
