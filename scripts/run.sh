#!/bin/sh

# Execute initialization only on first run
if [ ! -f /tmp/chadwm_running ]; then
    xrdb merge ~/.config/chadwm/.Xresources 
    xbacklight -set 10 &  # Commented out, usually not needed for desktop PCs
    feh --bg-fill --randomize ~/Pictures/* &
    xset r rate 200 50 &  # Set keyboard repeat rate: 200ms delay, 50 repeats/sec
    picom &
    fcitx5 &
    redshift -l 30.6:114.3 -t 6500:4000 &  # Auto night mode for Wuhan location
    dash ~/.config/chadwm/scripts/bar.sh &
    
    ~/Documents/Snipaste-2.10.8-x86_64.AppImage &
    # set default output bluetooth device
    # pactl set-default-sink bluez_output.F4_4E_FD_45_ED_58.1

    pot &
    touch /tmp/chadwm_running
    trap 'rm -f /tmp/chadwm_running; exit' EXIT INT TERM
fi

while type chadwm >/dev/null; do chadwm && continue || break; done
