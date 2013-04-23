#!/bin/bash
f="ti_launchpad.rules"
cp -v $f /tmp/
sudo cp -v "/tmp/$f" "/etc/udev/rules.d/"
rm -f "/tmp/$f"

#sudo stop udev
#sudo start udev

echo "done, re-plug your LaunchPad"
