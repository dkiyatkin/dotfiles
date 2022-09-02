#!/usr/bin/env bash
# http://hints.macworld.com/article.php?story=20030918121856528
PIDS=`ps ax | grep 'updatedb\|find /' | grep -v grep | sort | awk '{print $1}' | perl -ne 'chomp;print "$_ "'`
if [ "$PIDS" ]; then
  kill $PIDS
fi
