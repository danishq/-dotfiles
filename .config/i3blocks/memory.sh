#!/usr/bin/env bash

read used total <<<$(free -m | awk '/Mem:/ {print $3,$2}')

used_gb=$(awk "BEGIN {printf \"%.1f\", $used/1024}")
total_gb=$(awk "BEGIN {printf \"%.1f\", $total/1024}")

printf "%5s/%-5sG\n" "$used_gb" "$total_gb"
