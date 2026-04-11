#!/usr/bin/env bash

# detect active interface (ethernet or wifi)
IF=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $5; exit}')

# get IP
IP=$(ip -4 addr show "$IF" 2>/dev/null | awk '/inet / {print $2}' | cut -d/ -f1)

# fallback if no connection
[[ -z "$IP" ]] && IP="No IP"

# icon based on interface
if [[ "$IF" == wl* ]]; then
  ICON=""
else
  ICON="󰈀"
fi

# fixed width output (15 chars)
printf "<span font_family='JetBrainsMono Nerd Font'><b>%s %-10s</b></span> \n" "$ICON" "$IP"
