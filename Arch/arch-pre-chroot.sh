# Connect internet
iwctl
ping -c 3 www.google.ecom
timedatectl set-ntp true


genfstab -U >> /mnt/etc/fstab

while true; do
	read -p "Write CPU: " CPU
	case $CPU in
		"intel" ) CPUCODE="intel-ucode"; break;;
		"amd"   ) CPUCODE="amd-ucode"; break;;
		"exit"  ) CPUCODE=""; break;;
		*       ) echo "Write supported CPU or exit";;
	esac
done

while true; do
	read -p "Write GPU: " GPU
	case $GPU in
		"intel"   ) VIDEOCARD="xf86-video-intel"; break;;
		"nvidia"  ) VIDEOCARD="nvidia"; break;;
		"amdgpu"  ) VIDEOCARD="xf86-video-amdgpu"; break;;
		"ati"     ) VIDEOCARD="xf86-video-ati"; break;;
		"nouveau" ) VIDEOCARD="xf86-video-nouveau"; break;;
		"exit"    ) VIDEOCARD=""; break;;
		*         ) "Write GPU or exit";;
	esac
done


pacstrap /mnt base base-devel linux-zen linux-firmware btrfs-progs snapper cryptsetup networkmanager neovim opendoas ranger python grub efibootmgr zsh git $CPUCODE $VIDEOCARD

arch-chroot /mnt