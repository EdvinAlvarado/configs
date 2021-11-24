ls /usr/share/zoneinfo/
read -p "Write Region: " REGION
ls /usr/share/zoneinfo/$REGION
read -p "Write city: " CITY

ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime
hwclock --systohc

nvim /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

read -p "hostname: " HOSTNAME
echo "$HOSTNAME" >> /etc/hostname

echo "Enter root password"
passwd

echo "Username"
read -p "username: " NAME
useradd -m $NAME
passwd $NAME

echo "permit persist :$NAME" >> /etc/doas.conf

echo "add $NAME ALL=(ALL) ALL"
EDITOR=vim visudo


mkinitcpio -P
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager


echo "Do any configurations needed. When finished do:"
echo "1. exit"
echo "2. umount -R /mnt"
echo "3. reboot"
