#!/bin/bash

## forçar resolução do SDDM ##
#versão 1.3
##add monitores VGA, DVI e HDMI

#lista monitores ativos
listactivemonitors=$(xrandr --listactivemonitors | awk '{print $4}' | sed '/^$/d')

#loop FOR, fazer a cada monitor encontrado
for i in $listactivemonitors; do
#lista monitores ativos
activemonitor=$(xrandr --listactivemonitors | egrep -i "$i")
#nome da saida do monitor
device=$(echo $activemonitor | awk '{print $4}')
#resolução do monitor
resH=$(echo $activemonitor | awk '{print $3}' | cut -d '/' -f1)
resV=$(echo $activemonitor | awk '{print $3}' | cut -d 'x' -f2 | cut -d "/" -f1)
#verificar se já existe configuração
xrandxsetup=$(grep "xrandr --output $i" /usr/share/sddm/scripts/Xsetup)
#se não exister escrever
if [ -z "$xrandxsetup" ]; then
    echo '
xrandr --output '"$device"' --mode '"$resH"'x'"$resV" | tee -a /usr/share/sddm/scripts/Xsetup
#se existir, apagar a antiga configuração e escrever a nova
elif [ -n "$xrandxsetup" ]; then
    sed -i "/$xrandxsetup/d" /usr/share/sddm/scripts/Xsetup
    echo '
xrandr --output '"$device"' --mode '"$resH"'x'"$resV" | tee -a /usr/share/sddm/scripts/Xsetup
fi; done
