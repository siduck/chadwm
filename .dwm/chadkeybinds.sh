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
    less --mouse --wheel-lines=3 ~/.dwm/user-chadkeys.md
else
    less --mouse --wheel-lines=3 ~/.dwm/chadkeys.md
fi

