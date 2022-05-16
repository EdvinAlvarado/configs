MOUNT=$1

genfstab -U >> $MOUNT/etc/fstab

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
		"nvidia"  ) VIDEOCARD="nvidia-dkms"; break;;
		"amdgpu"  ) VIDEOCARD="xf86-video-amdgpu"; break;;
		"ati"     ) VIDEOCARD="xf86-video-ati"; break;;
		"nouveau" ) VIDEOCARD="xf86-video-nouveau"; break;;
		"exit"    ) VIDEOCARD=""; break;;
		*         ) "Write GPU or exit";;
	esac
done


pacstrap $MOUNT base base-devel linux-zen linux-firmware btrfs-progs snapper snap-pac cryptsetup networkmanager neovim opendoas ranger python grub efibootmgr zsh git $CPUCODE $VIDEOCARD

