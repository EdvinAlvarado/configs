# finish chrooting
source /etc/profile
export PS1="(chroot) ${PS1}"
ln -sf /proc/self/mounts /etc/mtab

# update repo
emerge --sync


### Portage ---------------------------------------------------------------------------------------
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
while true; do
	read -p "Write the minimum of your cpu cores or RAM divided by 2: " MAKEOPTS
	case $MAKEOPTS in
		^[0-9]+$ ) echo 'MAKEOPTS="-j$MAKEOPTS"' >> /etc/portage/make.conf; break;;
		*        ) echo "write a number...";;
	esac
done

while true; do
	read -p "Write a graphic driver: " VIDEO 
	case $MAKEOPTS in
		"inte\|amdgpu\|radeon\|nvidea\|nouveau\|virtualbox\|vmware" ) echo 'VIDEO_CARDS="$VIDEO"' >> /etc/portage/make.conf; break;;
		*        ) echo "write an acceptable videoc card...";;
	esac
done

echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
echo 'ACCEPT_LICENSE="-* @BINARY-REDISTRIBUTABLE"' >> /etc/portage/make.conf
echo 'USE="device-mapper mount cryptsetup initramfs"' >> /etc/portage/make.conf

sed -i 's/CFLAGS="/CFLAGS="-march=native' /etc/portage/make.conf

### emerge -----------------------------------------------------------------------------------------
emerge -auDN @world linux-firmware btrfs-progs snapper cryptsetup genfstab vim genkernel gentoo-sources networkmanager xorg-server dev-vcs/git doas grub zsh sudo ranger

while true; do
	read -p "Write CPU: " CPU
	case $CPU in
		"intel" ) emerge -a intel-microcode; break;;
		"amd"   ) emerge -a linux-firmware; break;;
		"exit"  ) exit;;
		*       ) "Write CPU or exit";;
	esac
done

while true; do
	read -p "Write GPU: " GPU
	case $GPU in
		"intel"  ) echo "x11-libs/libdrm video_cards_intel" >> /etc/portage/package.use; emerge -a xf86-video-intel; break;;
		"nvidea" ) emerge -a nvidea-drivers; break;;
		"amd"    ) emerge -a xf86-video-amdgpu; break;;
		"exit"   ) exit;;
		*        ) "Write GPU or exit";;
	esac
done

echo "Check if there are any masking issues"
etc-update
read -p "Write packages impacted by masking: " MASKED
if [ $MASKED != "" ]; then
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
echo 'GRUB_CMDLINE_LINUX="init=/lib/systemd/systemd crypt_root=UUID=$CRYPTO root=UUID=$ROOT rootflags=subvol=@ root_trim=yes rd.luks=1 rd.luks.key=/crypto_keyfile.bin"
' >> /etc/default/grub

# Kernel
eselect kernel list
eselect kernel set 1

echo 'MAKEOPTS="$(portageq envvar MAKEOPTS)"' >> /etc/genkernel.conf
echo 'LUKS="yes"' >> /etc/genkernel.conf
echo 'BTRFS="yes"' >> /etc/genkernel.conf

genkernel --btrfs --luks --symlink --menuconfig --bootloader=grub2 all
grub-install --target=x86_64-efi --efi-directory=/efi
grub-mkconfig -o /boot/grub/grub.cfg


### General Configuration -------------------------------------------------------------------------
systemctl enable NetworkManager

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

passwd

read -p "username: " NAME
useradd -m $NAME
passwd $NAME

echo "permit persist :$1" >> /etc/doas.conf

echo "add $NAME ALL=(ALL) ALL"
EDITOR=vim visudo
