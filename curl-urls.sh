#!/bin/bash

# Takes a filename of URLs (one per line) as a param - reads
# the file and curls the URL outputing the response. If curl
# takes longer than 10 seconds - assume it's hanging and move on.
# Example:
# ./curl-urls.sh files/urls.txt
# ./curl-urls.sh files/urls.txt > files/output.txt - to save output to a file

filename=$1

while read line; do
  echo "URL: ${line}"
  if timeout 10 curl -I $line; then
    echo curl -I $line
  else
    echo "Hangs!"
  fi

done < $filename
