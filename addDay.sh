#!/bin/bash

SCRIPTPATH=$(
   cd "$(dirname "$0")"
   pwd -P
);
cd "$SCRIPTPATH"

PROGRESS=${1:-''}
THOUGHTS=${2:-''}
URL=${3:-''}
DAY=${4:-$(date +%m/%d)}
LOG_FILE=${5:-'r1-log.md'}

# set -x
LAST=$(expr $(grep '###' "$LOG_FILE" | tail -n1 | cut -d "D" -f 2 | cut -d " " -f 1) + 1)

REPORT=$(echo -e "\n### R1D$LAST ($DAY)\n\n**Today's Progress**: $PROGRESS.")

if [ "$THOUGHTS" != '' ]; then
    THOUGHTS=$(echo -e "\n\**Thoughts**: $THOUGHTS")
fi
if [ "$URL" != '' ]; then
    URL=$(echo -e "\n\n**Link to work:**: [Here]($URL)")
fi

echo -e "$REPORT$URL$THOUGHTS" >> "$LOG_FILE"

git commit -am "Add day $DAY"