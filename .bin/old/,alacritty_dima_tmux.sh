#! /bin/sh

alacritty --title 'dima: tmux - Alacritty' -e sh -c "DIMA_TMUX=1 su -w DISPLAY,DIMA_TMUX - dima"
