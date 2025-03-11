#!/usr/bin/env bash

BRIGHTNESS_LEVEL=$(x=$(brightnessctl g) ; printf %.2f\\n "$(((10**9 * x/255)*100))e-9")
VOL_LEVEL=$(pamixer --get-volume | tr -d '[:space:]')
read -r BAT_LEVEL < /sys/class/power_supply/BAT1/capacity
SSID=$(nmcli con show --active | grep wlp1s0 | cut -d ' ' -f 1)
SSID=${SSID:-"N/a"}

case $BAT_LEVEL in
    [0-9]|1[0-9]|2[0-4]) BAT_ICON="" ;;
    2[5-9]|3[0-9]|4[0-4]) BAT_ICON="" ;;
    4[5-9]|5[0-9]) BAT_ICON="" ;;
    6[0-9]|7[0-5]) BAT_ICON="" ;;
    7[6-9]|8[0-9]|9[0-9]|100) BAT_ICON="" ;;
    *) BAT_ICON="N/a" ;;
esac

if [[ "true" == "$(pamixer --get-mute)" ]]; then
    VOL_LEVEL=0
fi

case $VOL_LEVEL in
    0) VOL_ICON="" ;;
    [1-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|50) VOL_ICON="" ;;
    5[1-9]|6[0-9]|7[0-9]|8[0-9]|9[0-9]|100) VOL_ICON="" ;;
    *) VOL_ICON="N/a" ;;
esac

#notify-send -e -i $HOME/.dotfiles/user/notifications/icons/lain.png -u normal -t 7000 "[SYSTEM] System Info" "\n$VOL_ICON  $VOL_LEVEL%\t\t☀︎ $BRIGHTNESS_LEVEL%\n\n$BAT_ICON  $BAT_LEVEL%\t\t $SSID"
notify-send -e -u normal -t 7000 "[SYSTEM] System Info" "\n$VOL_ICON  $VOL_LEVEL%\t\t☀︎ $BRIGHTNESS_LEVEL%\n\n$BAT_ICON  $BAT_LEVEL%\t\t $SSID"
