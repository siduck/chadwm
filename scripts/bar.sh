#!/bin/env bash

# This script sets up a custom status bar for the dwm window manager.
# The status bar includes information such as CPU load, battery level,
# package updates, brightness, memory usage, wireless network status, and
# the current time.

# Color codes for the status bar. These can be used in the format ^c$color^ and ^b$color^
# to set the foreground and background colors of different sections of the bar.

interval=0
# Directory where the theme files are located.
themes_dir="$HOME/.config/chadwm/scripts/bar_themes/"

# Name of the current theme and available themes.
current_theme="catppuccin"

# Load the color variables from the theme file.
if [ -f "${themes_dir}/${current_theme}" ]; then
  . "${themes_dir}/${current_theme}"
else
  echo "Theme not found: ${current_theme}"
  exit 1
fi

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
  printf "%s" "^c$black^ ^b$green^ CPU"
  printf "%s" "^c$white^ ^b$grey^ $cpu_val"
}

pkg_updates() {
   #updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch
  # updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l)  # apt (ubuntu, debian etc)
  
  if [ "$updates" -eq 0 ]; then
    printf "%s" "  ^c$green^    Fully Updated"
  else
    printf "%s" "  ^c$green^    $updates"" updates"
  fi
}

battery() {
  get_status=$(</sys/class/power_supply/BAT?/status)
  get_capacity=$(</sys/class/power_supply/BAT?/capacity)
  # Set battery icon based on capacity and status
case "$get_status" in
    "Discharging")
        case "$get_capacity" in
            9[0-9]|100) icon=" " ;;
            7[5-9]|8[0-9]) icon=" " ;;
            4[0-9]|5[0-9]|6[0-9]) icon=" " ;;
            1[0-9]|2[0-9]|3[0-9]) icon=" " ;;
            *) icon=" " ;;
        esac
        ;;
    "Charging"|"Full")
        icon=" "
        ;;
    *)
        icon="?"
        ;;
esac
printf "^c$blue^ %s $icon $get_capacity"
}

brightness() {
  printf "%s ^c$red^   "
  printf "^c$red^%.0f\n %s" "$(cat /sys/class/backlight/*/brightness)" 
}

mem() {
  printf "%s" "^c$blue^^b$black^  "
  printf  "%s" "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "%s" "^c$black^ ^b$darkblue^ 󱑆 "
  printf "%s" "^c$black^^b$blue^$(date '+%b %d %Y - (%H:%M)') "
}

while true; do

  [ $interval = 0 ] || [ $((interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$updates $(battery) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
done
