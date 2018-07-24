#!/bin/sh

set -xe

input=${1-/tmp/plugins.txt}
while read -r line; do
    echo "$line"
    gvt fetch "$line"
    sed -i -e $'/This is where other plugins get plugged in/a \\\n\\\t_ \"'"$line"$'\"\n' caddy/caddymain/run.go
done < "$input"