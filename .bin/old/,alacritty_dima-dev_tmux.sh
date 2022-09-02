#! /bin/sh

alacritty --title 'dima-dev: tmux - Alacritty' -e sh -c "DIMA_TMUX=1 su -w DISPLAY,DIMA_TMUX - dima-dev"
