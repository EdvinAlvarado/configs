# emerge
emerge -auDN @world linux-firmware btrfs-progs snapper cryptsetup genfstab vim genkernel dracut gentoo-sources networkmanager xorg-server dev-vcs/git doas grub zsh sudo ranger

systemctl enable NetworkManager

# /etc/fstab
genfstab -U / >> /etc/fstab


read -p "Enter CPU: " CPU

if [ $CPU = "intel" ]; then
	emerge -a intel-microcode
else
	echo "CPU not supported"
fi


read -p "Enter Graphic Drivers: " GPU

if [ $GPU = "intel" ]; then
	echo "x11-libs/libdrm video_cards_intel" >> /etc/portage/package.use
	emerge -a xf86-video-intel
else
	echo "graphic drivers not supported"
fi

echo "check etc-update for any masking issues preventing installing packages."
