#!/usr/bin/env sh
# https://unix.stackexchange.com/a/529049/87588
# Print the name of the first tmux session that has no clients attached.
tmux ls -F '#{session_name}|#{?session_attached,attached,not attached}' 2>/dev/null | grep 'not attached$' | tail -n 1 | cut -d '|' -f1
