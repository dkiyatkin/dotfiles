#!/bin/sh

# DisplayCommand=/usr/share/sddm/scripts/Xsetup

(
sleep 5 # wait when kde apply settings
/etc/X11/xinit/xinitrc.d/60-local.sh
,setxkbmap
) &
