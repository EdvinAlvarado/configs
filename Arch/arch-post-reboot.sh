## General Config
../recover.sh
chsh -s $(which zsh)

## Snapper
# Setup root config (recommended by Arch wiki)
umount /.snapshots
rm -r /.snapshots
snapper -c root create-config /
btrfs subvolume delete /.snapshots
mkdir /.snapshots
mount -a
chmod 750 /.snapshots

# Setup home config
snapper -c home create-config /home

# Activate automatic snapshots
systemctl enable --now snapper-timeline.timer
systemctl enable --now snapper-cleanup.timer

# Setup pre/post root snapshots for pacman transactions
sed -i -e 's/#[root]/[root]/' /etc/snap-pac.ini
sed -i -e 's/#desc_limit/desc_limit/' /etc/snap-pac.ini
sed -i -e 's/#snapshot/snapshot/' /etc/snap-pac.ini
sed -i -e 's/#cleanup/cleanup/' /etc/snap-pac.ini
sed -i -e 's/#pre/pre/' /etc/snap-pac.ini
sed -i -e 's/#post/post/' /etc/snap-pac.ini
sed -i -e 's/#important/important/g' /etc/snap-pac.ini
sed -i -e 's/"pacman -Syu"/"pacman -Syu", "pikaur -Syu"/' /etc/snap-pac.ini
sed -i -e 's/"linux"/"linux", "linux-zen", "nvidia-utils", "nvidia-dkms", "systemd", "systemd-libs", "zram-generator", "amd-ucode", "intel-ucode", "networkmanager", "linux-firmware", "btrfs-progs"/' /etc/snap-pac.ini

## Network Printing

# You must disable the systemd DNS resolver
systemctl stop systemd-resolved.service
systemctl disable systemd-resolved.service

# and use avahi and mdns for it to work.
pacman -S nss-mdns avahi samba
systemctl enable --now avahi-daemon.service
sed -i -e 's/mymachines/mymachines mdns_minimal [NOTFOUND=return]/g' /etc/nsswitch.conf
systemctl restart cups.service
