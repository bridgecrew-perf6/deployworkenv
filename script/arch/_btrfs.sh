#!/bin/bash
set -e
test -z "$deviceName" && read -p 'device name (/dev/?):' deviceName
if [ -z "$noEncrypt"]; then
    cryptsetup luksFormat -q "/dev/$deviceName"
    cryptsetup open "/dev/$deviceName" cryptlvm
    targetDevice=/dev/mapper/cryptlvm
else
    targetDevice="/dev/$deviceName"
fi
mkfs.btrfs "$targetDevice"

mkdir /mnt/btrfs
mount "$targetDevice" /mnt/btrfs
btrfs subvol create /mnt/btrfs/@
btrfs subvol create /mnt/btrfs/@home
umount /mnt/btrfs

mkdir /mnt/archinstall
mount -o relatime,compress=zstd:1,space_cache=v2,subvol=@ "$targetDevice" /mnt/archinstall
mkdir /mnt/archinstall/home
mount -o relatime,compress=zstd:1,space_cache=v2,subvol=@home "$targetDevice" /mnt/archinstall/home

mount | grep /mnt/archinstall

echo ./arch/_btrfs.sh >> ~/deployworkenv.log
