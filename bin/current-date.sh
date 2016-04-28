#!/bin/bash
# вставка текущей даты, так же настроен vim-speeddating для этого формата
# Пн. 28.12.15 03:19
# Установить xclip, xdotool
# Чтобы Shift+insert вставлял из clipboard а не из primary можно просто настроить только в konsole
CURRENT=`xclip -o -selection c`
W=`xdotool getactivewindow`
echo -n `date +'%a %d.%m.%y %H:%M'` | xclip -selection c
xdotool key --clearmodifiers --window $W Shift+Insert
sleep 0.5 # иногда вперед xdotool срабатывает
echo -n $CURRENT | xclip -selection c

# пропуски в наборе, долго вставляется
# # DATE="`date +'%d.%m.%y'` `date +'%a' | rev | cut -c 2- | rev | awk '{print tolower($0)}'` `date +'%H:%M'`"
# sleep 0.5
# sync
# # из-за русских символов нужно вводить помедленнее
# xdotool type --clearmodifiers --window $W --delay 50 "`date +'%a %d.%m.%y %H:%M'`"
# sync
# # заменяем ^ на :
# xdotool key --clearmodifiers --window $W --delay 50 Left Left BackSpace colon Right Right
