#!/bin/bash

interval=0

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c#222526^ ^b#89b482^ CPU"
  printf "^c#c7b89d^ ^b#2b2e2f^ $cpu_val"
}

update_icon() {
  printf "^c#89b482^ "
}

pkg_updates() {
  updates=$(doas xbps-install -un | wc -l) # void
  # updates=$(checkupdates | wc -l)   # arch , needs pacman contrib
  # updates=$(aptitude search '~U' | wc -l)  # apt (ubuntu,debian etc)

  if [ -z "$updates" ]; then
    printf "^c#89b482^ Fully Updated"
  else
    printf "^c#89b482^ $updates"" updates"
  fi
}

# battery
batt() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c#6f8faf^   $get_capacity"
}

brightness() {

  backlight() {
    backlight="$(xbacklight -get)"
    echo -e "$backlight"
  }

  printf "^c#ec6b64^   "
  printf "^c#ec6b64^%.0f\n" $(backlight)
}

mem() {
  printf "^c#7797b7^^b#222526^  "
  printf "^c#7797b7^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
  case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
  up) printf "^c#3b414d^ ^b#7681c5^ 󰤨 ^d^%s" " ^c#828dd1^Connected" ;;
  down) printf "^c#3b414d^ ^b#7681c5^ 󰤭 ^d^%s" " ^c#828dd1^Disconnected" ;;
  esac
}

clock() {
  printf "^c#222526^ ^b#6080a0^ 󱑆 "
  printf "^c#222526^^b#6f8faf^ $(date '+%a, %I:%M %p') "
}

while true; do

  [ $interval == 0 ] || [ $(($interval % 3600)) == 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(update_icon) $updates $(batt) $(brightness) $(cpu) $(mem) $(wlan) $(clock)"
done
