#!/usr/bin/env bash

usage=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2)}')

printf "%3s%%\n" "$usage"
