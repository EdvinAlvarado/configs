#!/usr/bin/env bash

DEVICE=$1
MOUNT=$2
DISTRO=$3

./luks_btrfs_partition.sh "${DEVICE}2" $MOUNT $DISTRO
./efi_fat_partition.sh "${DEVICE}1" $MOUNT
