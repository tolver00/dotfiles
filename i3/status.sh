#!/bin/sh

iface=$(ls /sys/class/net | grep -E '^(en|eth)' | head -n1)

c_fg='#d4d2e2'
c_dim='#5890c8'
c_accent='#60a068'

echo '{"version":1}'
echo '['
echo '[]'

while true; do
    time=$(date '+%H:%M')
    date=$(date '+%d-%m-%Y')

    ram=$(awk '/^MemTotal:/{t=$2} /^MemAvailable:/{a=$2} \
        END{printf "%.1fG", (t-a)/1048576}' /proc/meminfo)

    if [ -r "/sys/class/net/$iface/operstate" ] && \
       [ "$(cat /sys/class/net/$iface/operstate)" = up ]; then
        eth_text="$iface up";   eth_color="$c_accent"
    else
        eth_text="${iface:-eth} down"; eth_color="$c_dim"
    fi

    printf ',[{"full_text":"%s","color":"%s"},{"full_text":"ram %s","color":"%s"},{"full_text":"%s","color":"%s"},{"full_text":"%s","color":"%s"}]\n' \
        "$eth_text"  "$eth_color" \
        "$ram"       "$c_fg" \
        "$date"      "$c_dim" \
        "$time"      "$c_accent"

    sleep 2
done
