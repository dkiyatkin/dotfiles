#!/usr/bin/env sh
DIR=$(git rev-parse --show-toplevel)/.git
FILE=$DIR/nvimsocket

if [ -d "$DIRECTORY" ]; then
  nvr -s --servername "$FILE" "$@"
else
  nvr -s "$@"
fi
