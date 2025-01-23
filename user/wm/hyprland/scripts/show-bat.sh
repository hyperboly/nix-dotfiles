#!/usr/bin/env sh

notify-send -u normal -t 3000 "[SYSTEM] Battery %" "$(cat /sys/class/power_supply/BAT1/capacity)%"
