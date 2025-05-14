#!/usr/bin/env bash

URL="https://www.amfiindia.com/spages/NAVAll.txt"
OUTPUT="nav.tsv"

curl -s "$URL" \
  | awk -F';' '
      NR>1 && $1 ~ /^[0-9]+$/ {
        print $4 "\t" $5
      }
    ' > "$OUTPUT"

echo "Extraction complete: $OUTPUT"
