#!/bin/bash

PORT=8080

case "$1" in
    status)
        if ss -tln | grep -q ":$PORT "; then
            echo "Running"
        else
            echo "Stopped"
        fi
        ;;
    start)
        if ss -tln | grep -q ":$PORT "; then
            exit 0
        fi

        while true; do
            title=$(swaymsg -t get_tree | jq -r '.. | select(.app_id? == "org.mixxx.Mixxx") | .name' | head -1)
            title="${title%Mixxx}"
            echo "$title"
            echo -e "HTTP/1.1 200 OK\n\n$title" | nc -N -l -p $PORT
        done
        ;;
esac
