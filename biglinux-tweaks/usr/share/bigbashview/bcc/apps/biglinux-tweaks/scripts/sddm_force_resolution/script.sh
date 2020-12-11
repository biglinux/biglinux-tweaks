#!/bin/bash

## forçar resolução do SDDM ##
#versão 1.2

#verificar se já existe configuração
xrandxsetup=$(grep "xrandr --output" /usr/share/sddm/scripts/Xsetup)
if [ -z "$xrandxsetup" ]; then
    #descobri o nome do dispositivo interno
    lvds=$(xrandr --listactivemonitors | egrep -i "lvds|edp")
    dispositivo=$(echo $lvds | awk '{print $4}')
    resH=$(echo $lvds | awk '{print $3}' | cut -d '/' -f1)
    resV=$(echo $lvds | awk '{print $3}' | cut -d 'x' -f2 | cut -d "/" -f1)
    #adiconar ao arquivo /usr/share/sddm/scripts/Xsetup
    echo '
xrandr --output '"$dispositivo"' --mode '"$resH"'x'"$resV" | tee -a /usr/share/sddm/scripts/Xsetup

fi
