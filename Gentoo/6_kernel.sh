eselect kernel list
eselect kernel set 1

# genkernel
echo 'MAKEOPTS="$(portageq envvar MAKEOPTS)"' >> /etc/genkernel.conf
echo 'LUKS="yes"' >> /etc/genkernel.conf
echo 'BTRFS="yes"' >> /etc/genkernel.conf

genkernel --btrfs --luks --symlink --menuconfig --bootloader=grub2 all
dracut -f -I /crypto_keyfile.bin

# GRUB
grub-install --target=x86_64-efi --efi-directory=/efi
grub-mkconfig -o /boot/grub/grub.cfg
