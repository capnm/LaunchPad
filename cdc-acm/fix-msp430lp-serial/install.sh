#!/bin/bash

# the kernel headers are IIRC installed by default
# apt-get install kernel-headers-`uname -r`

echo "** compile the cdcacm kernel module"
make
if [ $? != 0 ]
then
	exit
fi

d=/lib/modules/$(uname -r)/kernel/drivers/usb/class

echo "** unload old kernel modules"
sudo rmmod cdc_acm 2>/dev/null
sudo rmmod cdcacm 2>/dev/null

if [ -f $d/cdc-acm.ko ]
then
	# e.g. /lib/modules/3.2.0-40-generic/kernel/drivers/usb/class/cdc-acm.ko
	sudo mv -v $d/cdc-acm.ko $d/cdc-acm.ko-
fi

echo "** replace the cdc-acm module"
sudo cp -v cdcacm.ko $d/cdcacm.ko

echo "** clean up"
make clean

echo "** run depmod, modprobe ..."
sudo depmod -a
sudo modprobe cdcacm

# display module info
dmesg | tail -1
echo "** done."
