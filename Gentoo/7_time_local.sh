ls /usr/share/zoneinfo/
echo -n "Write Region: "
read REGION

ls /usr/share/zoneinfo/$REGION
echo -n "Write city: "
read CITY

ln -sf /usr/share/zoneinfo/$REGION/$CITY /etc/localtime
hwclock --systohc

nano /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo -n "hostname: "
read HOSTNAME
echo "$HOSTNAME" >> /etc/hostname
