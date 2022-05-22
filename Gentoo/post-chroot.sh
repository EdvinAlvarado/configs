DEVICE=$1

# finish chrooting
source /etc/profile
export PS1="(chroot) ${PS1}"
ln -sf /proc/self/mounts /etc/mtab

# Portage TMPDIR on tmpfs: build files run on RAM
echo "tmpfs\t/var/tmp/portage\ttmpfs\tsize=8G,uid=portage,gid=portage,mode=775,nosuid,noatime,nodev\t0 0" >> /etc/fstab
mount /var/tm/portage

# update repo
emerge --sync
eselect news read

# Profile and DE/WM installation
DEWM_PKG=""
while true; do
	read -p "DE or WM: " DEWM
	case $DEWM in
		plasma|kde	) DEWM_PKG="plasma-meta kdeaccessibility-meta kdeadmin-meta kdecore-meta kdegraphics-meta kdenetwork-meta kdeutils-meta"; eselect profile set $(eselect profile list | egrep "plasma/systemd" | egrep -o "[0-9]+" | head -n1); touch /etc/portage/package.use/kde; echo "kde-plasma/plasma-meta bluetooth browser-integration colord crash-handler crypt desktop-portal discover display-manager grub gtk handbook kwallet legacy-systray networkmanager sddm smart systemd wallpapers" >> /etc/portage/package.accept_keywords/kde; break;;
		xmonad		) DEWM_PKG="xmonad xmonad-contrb xmobar"; eselect profile set $(eselect profile list | egrep "desktop" | egrep -o "[0-9]+" | head -n1); break;;
		*			) echo "not a supported DE or WM";;
		exit|[q]*	) break;;
	esac
done


### packages -----------------------------------------------------------------------------------------
emerge -auDN --autounmask-contine @world euses gentoolkit linux-firmware btrfs-progs snapper cryptsetup genfstab neovim nodejs genkernel gentoo-sources networkmanager xorg-server dev-vcs/git doas grub zsh sudo ranger links sys-apps/flatpak zram-generator $DEWM_PKG
etc-update
sleep 5
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

while true; do
	read -p "Write CPU: " CPU
	case $CPU in
		"intel" ) emerge intel-microcode; break;;
		"amd"   ) emerge linux-firmware; break;;
		"exit"  ) break;;
		*       ) "Write CPU or exit";;
	esac
done

while true; do
	read -p "Write GPU: " GPU
	case $GPU in
		"intel"  ) echo "x11-libs/libdrm video_cards_intel" >> /etc/portage/package.use/main; emerge xf86-video-intel; break;;
		"nvidia" ) emerge nvidia-drivers; break;;
		"amd"    ) emerge xf86-video-amdgpu; break;;
		"exit"   ) break;;
		*        ) "Write GPU or exit";;
	esac
done

### fstab, GRUB, kernel ---------------------------------------------------------------------------
# /etc/fstab
genfstab -U / >> /etc/fstab
# GRUB
CRYPTO=$(blkid | egrep "crypto_LUKS" | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)
ROOT=$(blkid | egrep "ROOT" | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)

#FIXME For now the rd commands do nothingvas far as I can notice
echo "GRUB_ENABLE_CRYPTODISK=y" >> /etc/default/grub
echo "GRUB_CMDLINE_LINUX=\"init=/lib/systemd/systemd crypt_root=UUID=${CRYPTO} root=UUID=${ROOT} rootflags=subvol=@ root_trim=yes rd.luks=1 rd.luks.key=/crypto_keyfile.bin\"" >> /etc/default/grub

# Kernel
eselect kernel list
sleep 5
eselect kernel set 1

echo "MAKEOPTS=\"\$(portageq envvar MAKEOPTS)\"" >> /etc/genkernel.conf
echo 'LUKS="yes"' >> /etc/genkernel.conf
echo 'BTRFS="yes"' >> /etc/genkernel.conf

genkernel --btrfs --luks --symlink --menuconfig --bootloader=grub2 all

# FIXME grub-install will not show on boot
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=BOOT
read -p "did grub did not boot last time? " yn
if [ $yn in [Yy]* ]; then
	 echo "HOTFIX: Some Motherboards refuse to search for custom named boot entries. To fix this please fill in the following"
	 sleep 5
	#mkdir /efi/EFI/BOOT
	 cp /efi/EFI/GRUB/* /efi/EFI/BOOT/BOOTx64.EFI
	 echo "    If your system does not have this bug, you might see two boots in your system. Both should direct to the same place."
	echo "    WARNING: While this bug is unresolved, running grub-install will not update the system without manually copying over the efi file to EFI/BOOT/BOOTx64.EFI"
	echo "    EFI mount was not given. Copy grub efi file to 'ESP'/EFI/BOOT/BOOTx64.efi."
	echo "    EFI partition was not given. Copy grub efi file to 'ESP'/EFI/BOOT/BOOTx64.efi"
	sleep 10
fi
grub-mkconfig -o /boot/grub/grub.cfg


### General Configuration -------------------------------------------------------------------------
#FIXME add loop
ls /usr/share/zoneinfo/
read -p "Write Region: " REGION
ls /usr/share/zoneinfo/$REGION
read -p "Write city: " CITY

ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime
hwclock --systohc

sed -i -e "s/#en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen
while true; do
	read -p "Edit language? (default: en_US.UTF-8) " yn
	case $yn in
		[Yy]* 	) nvim /etc/locale.gen; break;;
		[Nn]*|"") break;;
		*    	) echo "Yes or No?";;
	esac
done
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

read -p "hostname: " HOSTNAME
echo "$HOSTNAME" >> /etc/hostname

echo "root password"
passwd

read -p "username: " NAME
useradd -m $NAME
passwd $NAME

# Security
echo "permit persist :$NAME" >> /etc/doas.conf
echo "add $NAME ALL=(ALL) ALL"
sleep 2
echo "${NAME} ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
EDITOR=nvim visudo

if [ $DEWM in plasma|kde ]; then
	systemctl enable sddm
fi
systemctl enable NetworkManager
systemd-machine-id-setup
echo "[zram0]" | sudo tee -a /etc/systemd/zram-generator.conf
chsh -s $(which zsh)
sleep 20
