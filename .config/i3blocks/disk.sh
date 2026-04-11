#!/usr/bin/env bash

read used total percent <<<$(df -h / | awk 'NR==2 {print $3,$2,$5}')

printf "%6s/%-6s %4s\n" "$used" "$total" "$percent"
