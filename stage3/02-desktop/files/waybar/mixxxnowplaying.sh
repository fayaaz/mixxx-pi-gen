#!/bin/bash

case "$1" in
    status)
	if [[ $(lsof -i tcp:8080) ]]; then
          echo "Running"
        else
          echo "Stopped"
        fi
     ;;
     start)
	if [[ $(lsof -i tcp:8080) ]]; then
	  exit 0
	fi

	while true;
	   do a=$(swaymsg -t get_tree | jq -r '.. | select(.app_id? == "org.mixxx.Mixxx") | select(.name | test("Mixxx")) | .name // empty' | cut -d '|' -f1 )
	   title=${a/%"Mixxx"}
	   echo $title
	   echo -e "HTTP/1.1 200 OK\n\n$title" | nc -N -l -p 8080 ;
	done
	;;
esac
