ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc

nano /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "# write hostname" >> /etc/hostname
nano /etc/hostname
