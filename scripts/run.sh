#!/bin/sh

# Execute initialization only on first run
if [ ! -f /tmp/chadwm_running ]; then
    xrdb merge ~/.config/chadwm/.Xresources 
    xbacklight -set 10 &  # Commented out, usually not needed for desktop PCs
    feh --bg-fill --randomize ~/Pictures/* &
    xset r rate 200 50 &  # Set keyboard repeat rate: 200ms delay, 50 repeats/sec
    picom &
    fcitx5 &
    dash ~/.config/chadwm/scripts/bar.sh &
    
    touch /tmp/chadwm_running
    trap 'rm -f /tmp/chadwm_running; exit' EXIT INT TERM
fi

while type chadwm >/dev/null; do chadwm && continue || break; done