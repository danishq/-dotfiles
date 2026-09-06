#!/usr/bin/env bash

print_clock() {
  printf "%16s\n" "$(date '+%a %d %b %I:%M %p') |"
}

print_clock
while true; do
  sleep $((60 - $(date +%-S)))
  print_clock
done
