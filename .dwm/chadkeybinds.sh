#!/bin/bash

fetch_binds() {
    curl -s 'https://raw.githubusercontent.com/siduck76/chadwm/main/keyssheet.md' 2>/dev/null |
        sed 's/^\([^|#]\)/    \1/g' |
        sed 's/^##*[ ]*/ /g' >~/.dwm/chadkeys.md 
}

if ! [ -e ~/.dwm/chadkeys.md ]; then
    fetch_binds
fi


if [ -e ~/.dwm/user-chadkeys.md ]; then
    sed 's/^/>/g' ~/.dwm/user-chadkeys.md | rofi -dmenu -l 32 -p 2 -bw 3
else
    sed 's/^/>/g' ~/.dwm/chadkeys.md | rofi -dmenu -l 32 -p 2 -bw 3
fi
