#!/usr/bin/env bash

INLABEL=${INLABEL:-"↓"}
OUTLABEL=${OUTLABEL:-"↑"}

INTERFACES=$(ip -o link show up | awk -F': ' '{print $2}' | grep -E '^(en|wl)')
[[ -z "$INTERFACES" ]] && exit

STATE_FILE="/tmp/i3blocks-bandwidth"

rx=0
tx=0

for IF in $INTERFACES; do
  r=$(<"/sys/class/net/$IF/statistics/rx_bytes")
  t=$(<"/sys/class/net/$IF/statistics/tx_bytes")
  rx=$((rx + r))
  tx=$((tx + t))
done

now=$(date +%s)

if [[ ! -f "$STATE_FILE" ]]; then
  echo "$now $rx $tx" >"$STATE_FILE"
  exit
fi

read old_time old_rx old_tx <"$STATE_FILE"
echo "$now $rx $tx" >"$STATE_FILE"

time_diff=$((now - old_time))
[[ $time_diff -le 0 ]] && exit

rx_rate=$(((rx - old_rx) / time_diff))
tx_rate=$(((tx - old_tx) / time_diff))

rx_kib=$((rx_rate / 1024))
tx_kib=$((tx_rate / 1024))

format_rate() {
  local kib=$1

  if ((kib >= 1048576)); then
    printf "%5.1fG" "$(awk "BEGIN{print $kib/1048576}")"
  elif ((kib >= 1024)); then
    printf "%5.1fM" "$(awk "BEGIN{print $kib/1024}")"
  else
    printf "%5dK" "$kib"
  fi
}

printf " %s%s %s%s\n" \
  "$INLABEL" "$(format_rate $rx_kib)" \
  "$OUTLABEL" "$(format_rate $tx_kib)"
