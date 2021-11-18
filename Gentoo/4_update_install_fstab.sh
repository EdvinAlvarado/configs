# emerge
emerge -auDN @world linux-firmware btrfs-progs snapper cryptsetup genfstab vim genkernel dracut gentoo-sources networkmanager xorg-server dev-vcs/git doas grub zsh sudo ranger

systemctl enable NetworkManager

# /etc/fstab
genfstab -U / >> /etc/fstab

echo "Install any video drivers that wasnt installed."
