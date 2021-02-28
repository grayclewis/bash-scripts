#!/bin/bash

# Takes a filename as a param - reads the file and prints any
# line starting with: URL, HTTP or Location
# Example: `./read-urls.sh output.txt`

filename=$1
IFS=' '

while read line; do
  read -ra ADDR <<< "$line"

  if [[ ${ADDR[0]} == URL* ]]; then
    echo ""
  fi

  if [[ ${ADDR[0]} == URL* || ${ADDR[0]} == HTTP* || ${ADDR[0]} == Location* ]]; then
    echo ${ADDR[@]}
  fi
done < $filename
