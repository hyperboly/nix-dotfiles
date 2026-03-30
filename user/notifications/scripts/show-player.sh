#/usr/bin/env bash

STATUS=$(playerctl status)
TITLE=$(playerctl metadata title)
ALBUM=$(playerctl metadata album)
ARTIST=$(playerctl metadata artist)
ALBUMART=$(playerctl metadata mpris:artUrl)

notify-send -e -u normal -t 7000 -i $ALBUMART "[SYSTEM] $STATUS:" "\n$TITLE\n- $ARTIST"
