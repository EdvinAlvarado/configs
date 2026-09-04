DEVICE=$1
MOUNT=$2

mkfs.fat -F 32 -n "EFI" $DEVICE
mkdir -p $MOUNT/boot/efi
