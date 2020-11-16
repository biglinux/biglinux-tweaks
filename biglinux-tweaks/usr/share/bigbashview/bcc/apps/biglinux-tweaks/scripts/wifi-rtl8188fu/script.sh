#!/usr/bin/env bash

#Translation
export TEXTDOMAINDIR="/usr/share/locale"
export TEXTDOMAIN=biglinux-tweaks

cd /usr/share/bigbashview/bcc/apps/biglinux-tweaks/scripts/wifi-rtl8188fu/


rm -Rf src
mkdir src
cd src

git clone -b ARM-driver https://github.com/corneal64/Realtek-USB-Wireless-Adapter-Drivers.git

cd Realtek-USB-Wireless-Adapter-Drivers

dkms add ./rtl8188fu

dkms build rtl8188fu/1.0

dkms install rtl8188fu/1.0

cp ./rtl8188fu/firmware/rtl8188fufw.bin /lib/firmware/rtlwifi/

cd ..
cd ..
rm -Rf src

mkdir -p /etc/modprobe.d/

echo "options rtl8188fu rtw_power_mgnt=0 rtw_enusbss=0" > /etc/modprobe.d/rtl8188fu.conf

echo -e "[device]\nwifi.scan-rand-mac-address=no" > /etc/NetworkManager/conf.d/disable-random-mac.conf

modprobe rtl8188fu
