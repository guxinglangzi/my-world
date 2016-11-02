#!/bin/bash
#need to run this script with "sudo"
fastboot flash bootloader bootloader
fastboot oem reboot fb
sleep 3 # wait for bootloader reboot
fastboot oem cmd "fdisk -c"
fastboot oem reboot fb
sleep 5 # wait for bootloader reboot
fastboot oem poweroff
echo "bootloader updated."
echo "start to update other partitions."
echo "please power your device to fastboot mode manually then press any key to continue..."
read
fastboot flash cache cache.img
fastboot flash ldfw ldfw
fastboot flash dtb dtb
fastboot flash bootlogo logo.bin
fastboot flash bootimg boot.img
fastboot flash recovery recovery.img
fastboot flash system ubuntu.sparse.img
fastboot flash custom custom.img
fastboot flash userdata userdata.img
#fastboot -w 
# if you would like to clear cache/userdata partition, please flash them by image instead.
fastboot reboot
echo "device rebooting..."
