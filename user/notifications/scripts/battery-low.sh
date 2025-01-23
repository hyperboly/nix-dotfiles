#!/usr/bin/env bash

perc=$(cat /sys/class/power_supply/BAT1/capacity)
status=$(cat /sys/class/power_supply/BAT1/status)

if [ $perc -lt 20 ] && [ $status == 'Discharging' ]
then
    notify-send -u critical -i battery-level-10-symbolic -w "BATTERY LOW" "Battery is below 25% and discharging"
fi
