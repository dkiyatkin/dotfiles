#!/bin/bash
# вставка текущей даты, так же настроен vim-speeddating для этого формата
# Пн. 28.12.15 03:19
W=`xdotool getactivewindow`
# DATE="`date +'%d.%m.%y'` `date +'%a' | rev | cut -c 2- | rev | awk '{print tolower($0)}'` `date +'%H:%M'`"
sleep 0.2
# из-за русских символов нужно вводить помедленнее
xdotool type --clearmodifiers --window $W --delay 150 "`date +'%a %d.%m.%y %H:%M'`"
# заменяем ^ на :
xdotool key --clearmodifiers --window $W --delay 30 Left Left BackSpace colon Right Right
