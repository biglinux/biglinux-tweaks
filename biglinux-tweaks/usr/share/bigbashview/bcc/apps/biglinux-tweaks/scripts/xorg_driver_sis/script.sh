#!/usr/bin/env bash

#Translation
export TEXTDOMAINDIR="/usr/share/locale"
export TEXTDOMAIN=biglinux-tweaks

cd /usr/share/bigbashview/bcc/apps/biglinux-tweaks/scripts/xorg_driver_sis/

rm -Rf /root/xf86-video-sis671

./install_sis_graphics_on_linux.sh
