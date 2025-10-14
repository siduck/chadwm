#!/bin/sh

# Execute initialization only on first run
xrdb merge ~/.config/chadwm/.Xresources
xbacklight -set 10 & # Commented out, usually not needed for desktop PCs
feh --bg-fill --randomize ~/Pictures/wall/* &
picom &
redshift -l 30.6:114.3 -t 6500:4000 & # Auto night mode for Wuhan location
pot &
flameshot &
	
dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
