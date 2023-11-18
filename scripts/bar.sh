#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/onedark

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)
  cpu_temp=$(cat /sys/devices/platform/coretemp.0/hwmon/hwmon*/temp1_input)
  cpu_temp=$((cpu_temp / 1000))

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val|$cpu_temp°C"
}

pkg_updates() {
  #updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch
  # updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l)  # apt (ubuntu, debian etc)

  if [ -z "$updates" ]; then
    printf "  ^c$green^    Fully Updated"
  else
    printf "  ^c$green^    $updates updates"
  fi
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
	down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
	esac
}

clock() {
	printf "^c$black^ ^b$darkblue^ 󱑆 "
  printf "^c$black^^b$blue^$(date +"%a, %d %B %H:%M"| sed 's/  / /g')"
}

current_network_speed() {
  interface="eno1"
  interval="1"  # Adjust this for longer intervals

  # Get initial values
  rx1=$(cat /sys/class/net/$interface/statistics/rx_bytes)
  tx1=$(cat /sys/class/net/$interface/statistics/tx_bytes)
  sleep $interval
  rx2=$(cat /sys/class/net/$interface/statistics/rx_bytes)
  tx2=$(cat /sys/class/net/$interface/statistics/tx_bytes)

  # Calculate the difference to get the speed
  rx_speed=$(( ($rx2 - $rx1) / $interval * 8 / 1048576 ))
  tx_speed=$(( ($tx2 - $tx1) / $interval * 8 / 1048576 ))
	printf "^c$blue^^b$black^ ⬇️⬆️"
  printf "^c$blue^$rx_speed|$tx_speed"
}

volume_level() {
  vol_lvl=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*%\).*,\1,')
	printf "^c$blue^^b$black^ 🔊"
  printf "^c$blue^ $vol_lvl%"
}

while true; do

  [ $interval = 30 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$updates $(cpu) $(mem) $(current_network_speed) $(volume_level) $(clock)"
done
