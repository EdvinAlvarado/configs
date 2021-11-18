blkid | egrep "(crypto_LUKS|ROOT)" | egrep -o '\sUUID="[[:alnum:]\|-]*"' >> /etc/default/grub

echo "GRUB_ENABLE_CRYPTODISK=y" >> /etc/default/grub
echo 'GRUB_CMDLINE_LINUX="init=/lib/systemd/systemd crypt_root=UUID=<crypto_LUKLS-UUID> root=/dev/mapper/cryptroot rootflags=subvol=@ root_trim=yes rd.luks=1 rd.luks.key=/crypto_keyfile.bin"
' >> /etc/default/grub

vim /etc/default/grub
