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

clear
# initramfs setup for encrypted drive
sed -i -e "s/MODULES=()/MODULES=(btrfs)/g" /etc/mkinitcpio.conf
sed -i -e "s|BINARIES=()|BINARIES=(/usr/bin/btrfs)|g" /etc/mkinitcpio.conf
sed -i -e 's/FILES=()/FILES=(\/crypto_keyfile.bin)/g' /etc/mkinitcpio.conf
sed -i -e "s/keyboard/keyboard keymap consolefont encrypt/g" /etc/mkinitcpio.conf
mkinitcpio -P

# system-boot install and configuration
CRYPTO_PART=$(blkid $DEVICE | egrep -o '\sPARTUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)
bootctl install
systemctl enable systemd-boot-update.service
echo "default @saved" | sudo tee /boot/loader/loader.conf
echo "timeout 4" | sudo tee -a /boot/loader/loader.conf
echo "console-mode max" | sudo tee -a /boot/loader/loader.conf
echo "editor no" | sudo tee -a /boot/loader/loader.conf
cp /repos/loader/* /boot/loader/entries/
for f in /boot/loader/entries/*.conf; do
	echo "options cryptdevice=PARTUUID=${CRYPTO}:luksdev root=/dev/mapper/luksdev zswap.enabled=0 rootflags=subvol=@ rw rootfstype-btrfs nvme.noacpi=1" | sudo tee -a $f
done
# TODO assumes linux and linux-zen
# TODO Assumes amducode
# Sanity Check
bootctl list
echo "Current loaders assume amd-ucode. If you are running intel, you should update the loaders for better support."
echo "WARNING: linux-zen loaders were added. If you did not choose linux-zen at the beginning, these loaders won't work. If you want to use a kernel besides linux or linux-zen, you will have to boot with linux and configure them yourself."
sleep 3

clear
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
