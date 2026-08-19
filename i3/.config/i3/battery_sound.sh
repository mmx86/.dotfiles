#!/bin/bash
# Play a sound on charger plug/unplug and on low battery.
BAT_PATH="/sys/class/power_supply/BAT0"

SND_PLUG="/usr/share/sounds/freedesktop/stereo/power-plug.oga"
PLAY_PLUG=1  # 1 = play sound when charger connects; 0 = do not play sound
SND_UNPLUG="/usr/share/sounds/freedesktop/stereo/power-unplug.oga"
SND_LOW="/usr/share/sounds/freedesktop/stereo/dialog-warning.oga"

LOW_LEVEL=15

last_status=""
last_low=0

while true; do
    status=$(cat "$BAT_PATH/status" 2>/dev/null)
    capacity=$(cat "$BAT_PATH/capacity" 2>/dev/null)

    if [ -n "$status" ] && [ -n "$capacity" ]; then
        # Plug/unplug transition (skip the very first iteration)
        if [ -n "$last_status" ] && [ "$status" != "$last_status" ]; then
            case "$status" in
                Charging|Full) [ "$PLAY_PLUG" -eq 1 ] && paplay "$SND_PLUG" ;;
                Discharging)   paplay "$SND_UNPLUG" ;;
            esac
        fi
        [ -n "$status" ] && last_status="$status"

        # Low battery warning (once, until recharged above hysteresis)
        if [ "$status" = "Discharging" ] && [ "$capacity" -le "$LOW_LEVEL" ] && [ "$last_low" -eq 0 ]; then
            paplay "$SND_LOW"
            last_low=1
        elif [ "$capacity" -gt $((LOW_LEVEL + 5)) ]; then
            last_low=0
        fi
    fi

    sleep 10
done
