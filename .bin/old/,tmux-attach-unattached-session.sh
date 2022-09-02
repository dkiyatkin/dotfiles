#!/usr/bin/env sh
# https://unix.stackexchange.com/a/529049/87588
# Attach to the first tmux session that has no attached clients.
# If there are no unattached sessions, then create a new session.
tmux attach -t `,tmux-first-unattached-session.sh` 2> /dev/null || tmux
