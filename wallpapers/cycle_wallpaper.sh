#!/bin/sh
swaybg -i $(find /home/nikita/dev/nixos-config/wallpapers/img/ -type f | shuf -n1) -m fill &
# OLD_PID=$!
while true; do
    kill `pidof swaybg`
    swaybg -i $(find /home/nikita/dev/nixos-config/wallpapers/img/ -type f | shuf -n1) -m fill &
    # NEXT_PID=$!
    sleep 1
    # kill $OLD_PID
    sleep 3600
    # OLD_PID=$NEXT_PID
done
