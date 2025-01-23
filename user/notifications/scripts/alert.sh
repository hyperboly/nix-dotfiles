#!/usr/bin/env bash

if [[ "$DUNST_SUMMARY" =~ ^\[SYSTEM\] ]]; then
    #aplay ~/.dotfiles/user/notifications/audio/animegirl.wav
    return 0
else
    aplay ~/.dotfiles/user/notifications/audio/youGotmail.wav
fi
