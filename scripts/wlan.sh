#!/bin/zsh
function get_bytes {
    interface=$(ip route get 8.8.8.8 2>/dev/null | awk '{print $5}')
    line=$(grep $interface /proc/net/dev | cut -d ':' -f2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
    eval $line
    now=$(date +%s%N)
}


function get_velocity {
    value=$1
    old_value=$2
    now=$3
    timediff=$(($now - $old_time))
    velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff")
    if [ $((velKB)) -gt 1024 ]
    then
      echo $(echo "$((velKB/1024))")MB/s
    else
      echo $((velKB))KB/s
    fi
}
get_bytes
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now
get_bytes
vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)
echo "$vel_recv$vel_trans"
