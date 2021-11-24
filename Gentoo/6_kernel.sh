#FIXME Find a way to avoid double key ask
genkernel --btrfs --luks --symlink --menuconfig --bootloader=grub2 all
# dracut -f -I /crypto_keyfile.bin

# GRUB
grub-install --target=x86_64-efi --efi-directory=/efi
grub-mkconfig -o /boot/grub/grub.cfg
