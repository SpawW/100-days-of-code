#!/bin/bash

PROGRESS=${1:-''}
THOUGHTS=${2:-''}
URL=${3:-''}
DAY=${4:-$(date +%m/%d)}
LOG_FILE=${5:-'r1-log.md'}

# set -x
LAST=$(expr $(grep '###' "$LOG_FILE" | tail -n1 | cut -d "D" -f 2 | cut -d " " -f 1) + 1)

REPORT=$(echo -e "\n### R1D$LAST ($DAY)\n\nToday's Progress: $PROGRESS.\n\nThoughts: $THOUGHTS")
if [ "$URL" == '' ]; then
    URL=$(echo -e "\nWork URL: Not available")
else
    URL=$(echo -e "\nWork URL: [Here]($URL)")
fi

echo -e "$REPORT\n$URL" >> "$LOG_FILE"

git commit -am "Add day $DAY"