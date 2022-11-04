#!/bin/bash

# hardcoded creator of json entries due to lack of array support for sound variants
echo "" > output.txt

if [[ -e $1 ]]; then
  file=$1
else
  printf "No file provided/found; exiting"
  exit
fi

if [[ -n $2 ]]; then
  usefile="$2"
else
  usefile=""
fi

while read -r line; do
  printf "{\n    \"type\": \"sound_effect\",\n    \"id\": \"reload\",\n    \"variant\": \"$line\",\n    \"volume\": 100,\n    \"files\": [\n      \"$usefile\"\n  ]\n}\n" >> ./output.txt
done<$file
