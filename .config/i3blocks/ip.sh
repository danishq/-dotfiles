#!/usr/bin/env bash

# detect active interface
IF=$(ip -o -4 route show to default | awk '{print $5}' | head -n1)

# get IPv4 with subnet (CIDR format)
IP=$(ip -o -4 addr show dev "$IF" | awk '{print $4}')

# fallback
[[ -z "$IP" ]] && IP="No IP"

# fixed width so i3bar doesn't shift
printf "%-18s\n" "$IP"
