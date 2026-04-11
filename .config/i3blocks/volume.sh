#!/usr/bin/env bash

#vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1)
#
#printf "%4s\n" "$vol"

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | head -n1 | tr -d '%')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [[ "$mute" == "yes" ]]; then
  icon="󰝟"
elif ((vol < 30)); then
  icon="󰕿"
elif ((vol < 60)); then
  icon="󰖀"
else
  icon="󰕾"
fi

printf "<span font_family='JetBrainsMono Nerd Font'><b>%s %3s%%</b></span>\n" "$icon" "$vol"
