#!/bin/sh
swaymsg -t subscribe -m '[ "window" ]' | while read line
do
    if [ "$(echo "$line" | jq -r '.change')" = "new" ]; then
        sway_tree="$(swaymsg -t get_tree)"
        focused_window="$(echo "$sway_tree" | jq -r '.. | select(.type?) | select(.focused==true)')"
        fullscreen_mode="$(echo "$focused_window" | jq -r '.fullscreen_mode')"
        if [ "$fullscreen_mode" = "1" ]; then
            swaymsg fullscreen disable
            swaymsg [con_id=$(echo "$line" | jq -r '.container.id')] focus
        fi
    fi
done
