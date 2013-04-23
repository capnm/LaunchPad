# TI LaunchPads & Linux
[energia](https://github.com/energia/Energia) [mspdebug](http://mspdebug.sourceforge.net/) [openocd](https://github.com/ntfreak/openocd)
[lm4tools](https://github.com/scompo/lm4tools)

# cdc-acm kernel module fix 

### Symptoms 
The serial connection to [MSP430 LaunchPad](http://processors.wiki.ti.com/index.php/MSP-EXP430G2_Out_of_the_box) is really screwed up.

Running ``dmesg`` shows lines like:
```tty_port_close_start: tty->count = 1 port count = 0```

### Install
Note: it has been fixed in the kernel v3.3.

For kernels v3.2+ (e.g. Ubuntu LTS 12.04)
```
git clone git://github.com/capnm/LaunchPad.git
cd LaunchPad/cdc-acm/fix-v3.2+
./install.sh
```

For kernels v3.0+
```
git clone git://github.com/capnm/LaunchPad.git
cd LaunchPad/cdc-acm/fix-v3.0+
./install.sh
```

# udev rules
```
cd etc-rules-udev.d
./install.sh
```

add LaunchPad users to the "access external storage devices" group
```
sudo usermod -a -G plugdev USERNAME
```

### Links / Notes
* http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/class/cdc-acm.c
* http://lxr.linux.no/linux/drivers/usb/class/cdc-acm.c

* You can use an RS232 USB converter instead of the slow (9600 baud) and broken one inside the launchpad. Unplug the TX and RX jumpers on J3 and connect RX/TX/GND to the P1.1 and P1.2 ``G2553 P1.1 = TX, P1.2 = RX`` ``G2452 P1.1 = RX, P1.2 = TX``  This assumes your converter supports 3.3 volt I/O signals.


### Credits
* https://groups.google.com/d/msg/ti-launchpad/5BS_Bm-9HVk/idbOY-wsiEwJ
* https://github.com/energia/Energia/wiki/Linux-Serial-Communication
