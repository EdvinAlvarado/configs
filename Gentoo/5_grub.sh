CRYPTO = $(blkid | egrep "crypto_LUKS" | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)
ROOT = $(blkid | egrep "ROOT" | egrep -o '\sUUID="[[:alnum:]\|-]*"' | egrep -o '[[:alnum:]\|-]*' | tail -n1)

#FIXME For now the rd commands do nothingvas far as I can notice
echo "GRUB_ENABLE_CRYPTODISK=y" >> /etc/default/grub
echo 'GRUB_CMDLINE_LINUX="init=/lib/systemd/systemd crypt_root=UUID=$CRYPTO root=UUID=$ROOT rootflags=subvol=@ root_trim=yes rd.luks=1 rd.luks.key=/crypto_keyfile.bin"
' >> /etc/default/grub

# vim /etc/default/grub
