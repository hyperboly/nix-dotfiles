#!/usr/bin/env sh

BRIGHTNESS_LEVEL=$(x=$(brightnessctl g) ; printf %.2f\\n "$(((10**9 * x/255)*100))e-9")
VOLUME=$(pamixer --get-volume)

notify-send -u normal -t 7000 "[SYSTEM] Volume and Brightness LVs" "\n🔊 $VOLUME%\n☀︎ $BRIGHTNESS_LEVEL%"
notify-send -u normal -t 3000 "[SYSTEM] Battery %" "$(cat /sys/class/power_supply/BAT1/capacity)%"
