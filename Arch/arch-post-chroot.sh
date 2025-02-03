DEVICE=$1

ZONEINFO="/usr/share/zoneinfo"
# System Configuration
while true; do
	ls $ZONEINFO
	read -p "Write Region: " REGION
	if [ -f $ZONEINFO/$REGION ]; then
		break
	elif [ -d $ZONEINFO/$REGION ]; then
		while true; do
			ls $ZONEINFO/$REGION
			read -p "Choose a sub region or city: " SUBREGION
			if [ -f $ZONEINFO/$REGION/$SUBREGION ]; then
				REGION=$REGION/$SUBREGION
				break
			elif [ -d $ZONEINFO/$REGION/$SUBREGION ]; then
				REGION=$REGION/$SUBREGION
				echo "Seems there are sub sub regions..."
			else
				echo "not a sub region or city..."
			fi
		done
		break
	else
		echo "Region doesn't exist in zoneinfo..."
	fi
done
ln -sf $ZONEINFO/$REGION /etc/localtime
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

while true; do
	read -p "hostname: " HOSTNAME
	read -p "is $HOSTNAME correct? " yn
	case $yn in
		[Yy]*	) break;;
		*		) echo "let's try again";;
	esac
done
echo "$HOSTNAME" >> /etc/hostname

# Users
echo "Enter root password"
passwd

while true; do
	read -p "username: " NAME
	read -p "is $NAME correct? " yn
	case $yn in
		[Yy]*	) break;;
		*		) echo "let's try again";;
	esac
done
useradd -m $NAME
passwd $NAME

# Security
echo "permit persist :$NAME" >> /etc/doas.conf
echo "${NAME} ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo


# Grub Configuration
CRYPTO=$(blkid $DEVICE | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)
# ROOT=$(blkid | egrep "ROOT" | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)
sed -i -e "s/MODULES=()/MODULES=(btrfs)/g" /etc/mkinitcpio.conf
sed -i -e "s|BINARIES=()|BINARIES=(/usr/bin/btrfs)|g" /etc/mkinitcpio.conf
sed -i -e 's/FILES=()/FILES=(\/crypto_keyfile.bin)/g' /etc/mkinitcpio.conf
sed -i -e "s/keyboard/keyboard keymap consolefont encrypt/g" /etc/mkinitcpio.conf
sed -i -e "s/#GRUB_ENABLE_CRYPTODISK=/GRUB_ENABLE_CRYPTODISK=/g" /etc/default/grub
sed -i -e "s/GRUB_DISABLE_RECOVERY=/#GRUB_DISABLE_RECOVERY=/g" /etc/default/grub
sed -i -e "s|GRUB_CMDLINE_LINUX=\"\"|GRUB_CMDLINE_LINUX=\"cryptdevice=UUID=${CRYPTO}:cryptroot:allow-discards cryptkey=rootfs:/crypto_keyfile.bin\"|g" /etc/default/grub

while true; do
	read -p "Do you have another OS or would you like to automatically detect one? " yn
	case $yn in
		[Yy]* 	) sed -i -e "s/#GRUB_DISABLE_OS_PROBER=/GRUB_DISABLE_OS_PROBER=/g" /etc/default/grub; break;;
		[Nn]*|"") break;;
		*    	) echo "Yes or No?";;
	esac
done

mkinitcpio -P
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# System inits
systemctl enable NetworkManager
echo "[zram0]" | sudo tee -a /etc/systemd/zram-generator.conf
echo "zram-size = max(ram / 2, 4096)" | sudo tee -a /etc/systemd/zram-generator.conf
echo "compression-algorithm = zstd" | sudo tee -a /etc/systemd/zram-generator.conf
echo "vm.swappiness = 180" | sudo tee -a /etc/sysctl.d/99-vm-zram-parameters.conf
echo "vm.watermark_boost_factor = 0" | sudo tee -a /etc/sysctl.d/99-vm-zram-parameters.conf
echo "vm.watermark_scale_factor = 125" | sudo tee -a /etc/sysctl.d/99-vm-zram-parameters.conf
echo "vm.page-cluster = 0" | sudo tee -a /etc/sysctl.d/99-vm-zram-parameters.conf
chsh -s $(which zsh)
