#!/usr/bin/env sh

DATE=$(date +%m/%d/%Y)
TIME=$(date +%H:%M)
DAY_OF_WEEK=$(date +%A)

notify-send -i $HOME/.dotfiles/user/notifications/icons/ryo.png -u normal -t 5000 "[SYSTEM] Current Time" "\n $DAY_OF_WEEK\t$DATE\n\n $TIME"
