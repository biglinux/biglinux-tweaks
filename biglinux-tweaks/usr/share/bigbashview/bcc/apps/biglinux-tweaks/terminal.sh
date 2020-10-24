#!/bin/bash

#Author Bruno Goncalves  <www.biglinux.com.br>
#License: GPLv2 or later                       
#################################################

# Start resize script
PID_BIG_TERMINAL="$$" WINDOW_ID="$WINDOW_ID" ./terminal_resize.sh &

# Enter in correct folder
cd "$(cat ~/.biglinux_tweaks_selected)"

# Execute run script
bash run

# Kill if windows closed
if [ "$(xwininfo -id $WINDOW_ID 2>&1 | grep -i "No such window")" != "" ]; then
    kill -9 $PID_BIG_TERMINAL
    exit 0
fi

