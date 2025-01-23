#!/usr/bin/env bash

if [[ "$DUNST_SUMMARY" =~ ^\[SYSTEM\] ]]; then
    return 0
else
    aplay ~/.dotfiles/user/notifications/scripts/youGotmail.wav
fi
