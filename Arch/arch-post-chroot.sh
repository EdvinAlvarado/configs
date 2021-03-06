DEVICE=$1

# System Configuration
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

# Users
echo "Enter root password"
passwd

echo "Username"
read -p "username: " NAME
useradd -m $NAME
passwd $NAME

# Security
echo "permit persist :$NAME" >> /etc/doas.conf
echo "add $NAME ALL=(ALL) ALL"
sleep 2
echo "${NAME} ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
EDITOR=nvim visudo


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
nvim /etc/mkinitcpio.conf
nvim /etc/default/grub
mkinitcpio -P
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# System inits
systemctl enable NetworkManager
echo "[zram0]" | sudo tee -a /etc/systemd/zram-generator.conf
chsh -s $(which zsh)
