#!/usr/bin/env bash

#Translation
export TEXTDOMAINDIR="/usr/share/locale"
export TEXTDOMAIN=biglinux-tweaks

#dependencias
#apt install dkms git

cd /usr/share/bigbashview/bcc/apps/biglinux-tweaks/scripts/wifi-rtl8821CU/

rm -Rf src
mkdir src
cd src

git clone https://github.com/brektrou/rtl8821CU.git

cd rtl8821CU

bash dkms-install.sh

usb_modeswitch -KW -v 0bda -p 1a2b

echo 'ATTR{idVendor}=="0bda", ATTR{idProduct}=="1a2b", RUN+="/usr/sbin/usb_modeswitch -K -v 0bda -p 1a2b"' | tee -a /lib/udev/rules.d/40-usb_modeswitch.rules
