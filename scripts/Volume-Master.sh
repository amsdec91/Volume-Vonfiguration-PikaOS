#!/usr/bin/env bash

pactl subscribe | while read -r event; do

    [[ "$event" == *"'new' on sink-input"* ]] || continue

    id=$(grep -oP '#\K[0-9]+' <<< "$event")

    sleep 0.02

    info="$(pactl list sink-inputs)"

    block="$(awk -v id="$id" '
        $0 ~ "Sink Input #"id"$" {f=1}
        f {print}
        f && /^$/ {exit}
    ' <<< "$info")"

    binary=$(grep 'application.process.binary =' <<< "$block" | cut -d'"' -f2)
    app=$(grep 'application.name =' <<< "$block" | cut -d'"' -f2)
    media=$(grep 'media.name =' <<< "$block" | cut -d'"' -f2)

    ###############################
    # Discord Notifications
    ###############################
    if [[ "$binary" == "Discord" &&
          "$app" == "Chromium" &&
          "$media" == "Playback" ]]; then

        pactl set-sink-input-volume "$id" 30%
        continue
    fi

    ###############################
    # Zen Browser
    ###############################
    if [[ "$binary" == "zen" ]]; then

        pactl set-sink-input-volume "$id" 20%
        continue
    fi

done
