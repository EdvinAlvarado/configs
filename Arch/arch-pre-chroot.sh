MOUNT=$1

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
		"nvidia"  ) VIDEOCARD="nvidia nvidia-settings"; break;;
		"amdgpu"  ) VIDEOCARD="xf86-video-amdgpu"; break;;
		"ati"     ) VIDEOCARD="xf86-video-ati"; break;;
		"nouveau" ) VIDEOCARD="xf86-video-nouveau"; break;;
		"exit"    ) VIDEOCARD=""; break;;
		*         ) "Write GPU or exit";;
	esac
done

while true; do
	read -p "Write kernel: " KERN
	case $KERN in
		"linux"   			) KERNEL=$KERN; break;;
		"linux-zen"  		) KERNEL=$KERN; break;;
		"linux-lts"  		) KERNEL=$KERN; break;;
		"linux-hardened"	) KERNEL=$KERN; break;;
		*         			) "Write KERNEL";;
	esac
done

if [[ $KERNEL != "linux" ]] && [[ $VIDEOCARD = "nvidia nvidia-settings" ]]
then
	VIDEOCARD="nvidia-dkms nvidia-settings"
fi

pacman -Sy
pacstrap $MOUNT base base-devel arch-install-scripts linux $KERNEL linux-firmware zram-generator btrfs-progs snapper snap-pac cryptsetup networkmanager neovim opendoas ranger python efibootmgr zsh git $CPUCODE $VIDEOCARD

