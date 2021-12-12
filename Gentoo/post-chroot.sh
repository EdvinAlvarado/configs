# finish chrooting
source /etc/profile
export PS1="(chroot) ${PS1}"
ln -sf /proc/self/mounts /etc/mtab

# update repo
emerge --sync

while true; do
	read -p "This script assumes your arch is amd64. Will you be installing amd64? " AMD64
	case $AMD64 in
		[Yy]* ) echo "script will continue."; break;;
		[Nn]* ) echo "script will stop here. Continue Installation yourself."; break;;
		*     ) echo "Yes or no?";;
	esac
done
### Portage ---------------------------------------------------------------------------------------
# Confirm appropiate profile
eselect profile list

# package.use
rmdir /etc/portage/package.use
touch /etc/portage/package.use
echo 'sys-fs/cryptsetup kernel -gcrypt -openssl -udev' >> /etc/portage/package.use

# accept_keywords
rmdir /etc/portage/package.accept_keywords
touch /etc/portage/package.accept_keywords
echo "sys-fs/btrfs-progs ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-boot/grub:2 ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-fs/cryptsetup ~amd64" >> /etc/portage/package.accept_keywords
echo "sys-kernel/gentoo-sources ~amd64" >> /etc/portage/package.accept_keywords

# /etc/portage/make.conf
while true; do
	read -p "Write the minimum of your cpu cores or RAM divided by 2: " MAKEOPTS
	if [[ $MAKEOPTS =~ ^[0-9]+$ ]]; then
		echo -n 'MAKEOPTS="-j' >> /etc/portage/make.conf;
		echo -n $MAKEOPTS >> /etc/portage/make.conf;
		echo '"' >> /etc/portage/make.conf; break;;
	else
		echo "write a number...";
	fi
done

while true; do
	read -p "Write a graphic driver: " VIDEO 
	case $VIDEO in
		intel|amdgpu|radeon|nvidea|nouveau|virtualbox|vmware ) echo -n 'VIDEO_CARDS="' >> /etc/portage/make.conf; echo -n $VIDEO >> /etc/portage/make.conf; echo '"' >> /etc/portage/make.conf; break;;
		*        ) echo "write an acceptable video card...";;
	esac
done

echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
echo 'ACCEPT_LICENSE="-* @BINARY-REDISTRIBUTABLE"' >> /etc/portage/make.conf
echo 'USE="device-mapper mount cryptsetup initramfs"' >> /etc/portage/make.conf

sed -i 's/CFLAGS="/CFLAGS="-march=native/g' /etc/portage/make.conf

### emerge -----------------------------------------------------------------------------------------
emerge -auDN @world linux-firmware btrfs-progs snapper cryptsetup genfstab vim genkernel gentoo-sources networkmanager xorg-server xorg-xinit dev-vcs/git doas grub zsh sudo ranger links

while true; do
	read -p "Write CPU: " CPU
	case $CPU in
		"intel" ) emerge -a intel-microcode; break;;
		"amd"   ) emerge -a linux-firmware; break;;
		"exit"  ) break;;
		*       ) "Write CPU or exit";;
	esac
done

while true; do
	read -p "Write GPU: " GPU
	case $GPU in
		"intel"  ) echo "x11-libs/libdrm video_cards_intel" >> /etc/portage/package.use; emerge -a xf86-video-intel; break;;
		"nvidia" ) emerge -a nvidia-drivers; break;;
		"amd"    ) emerge -a xf86-video-amdgpu; break;;
		"exit"   ) break;;
		*        ) "Write GPU or exit";;
	esac
done

echo "Check if there are any masking issues"
etc-update
read -p "Write packages impacted by masking: " MASKED
if [ "$MASKED" != "" ]; then
	emerge -auDN $MASKED
fi

eselect news read


### fstab, GRUB, kernel ---------------------------------------------------------------------------
# /etc/fstab
genfstab -U / >> /etc/fstab

# GRUB
CRYPTO = $(blkid | egrep "crypto_LUKS" | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)
ROOT = $(blkid | egrep "ROOT" | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)

#FIXME For now the rd commands do nothingvas far as I can notice
echo "GRUB_ENABLE_CRYPTODISK=y" >> /etc/default/grub
echo -n 'GRUB_CMDLINE_LINUX="init=/lib/systemd/systemd crypt_root=UUID=' >> /etc/default/grub
echo -n $CRYPTO >> /etc/default/grub
echo -n ' root=UUID=' >> /etc/default/grub
echo -n $ROOT >> /etc/default/grub
echo ' rootflags=subvol=@ root_trim=yes rd.luks=1 rd.luks.key=/crypto_keyfile.bin"' >> /etc/default/grub

# Kernel
eselect kernel list
eselect kernel set 1

echo 'MAKEOPTS="$(portageq envvar MAKEOPTS)"' >> /etc/genkernel.conf
echo 'LUKS="yes"' >> /etc/genkernel.conf
echo 'BTRFS="yes"' >> /etc/genkernel.conf

genkernel --btrfs --luks --symlink --menuconfig --bootloader=grub2 all

# FIXME grub-install will not show on boot
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=BOOT
echo "HOTFIX: Some Motherboards refuse to search for custom named boot entries. To fix this please fill in the following"
read -p "    Write EFI partition (e.g. /dev/sda1): " EFIPART
read -p "    Write EFI mount (e.g. /efi, /boot/efi): " EFIMOUNT
if [ "$EFIPART" != "" ]; then
	if [ "$EFIMOUNT" != "" ]; then
		mkdir $EFIMOUNT/EFI/BOOT
		cp $EFIMOUNT/EFI/GRUB/* $EFIMOUNT/EFI/BOOT/BOOTx64.EFI
		echo "    If your system does not have this bug, you might see two boots in your system. Both should direct to the same place."
		echo "    WARNING: While this bug is unresolved, running grub-install will not update the system without manually copying over the efi file to EFI/BOOT/BOOTx64.EFI"
	else
		echo "    EFI mount was not given. Copy grub efi file to 'ESP'/EFI/BOOT/BOOTx64.efi."
	fi
else
	echo "    EFI partition was not given. Copy grub efi file to 'ESP'/EFI/BOOT/BOOTx64.efi"
fi
grub-mkconfig -o /boot/grub/grub.cfg


### General Configuration -------------------------------------------------------------------------
systemctl enable NetworkManager
systemd-machine-id-setup

#FIXME add loop
ls /usr/share/zoneinfo/
read -p "Write Region: " REGION
ls /usr/share/zoneinfo/$REGION
read -p "Write city: " CITY

ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime
hwclock --systohc

vim /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

read -p "hostname: " HOSTNAME
echo "$HOSTNAME" >> /etc/hostname

echo "root password"
passwd

read -p "username: " NAME
useradd -m $NAME
passwd $NAME

echo "permit persist :$NAME" >> /etc/doas.conf

echo "add $NAME ALL=(ALL) ALL"
EDITOR=vim visudo
