#!/bin/bash

# вставка текущей даты, так же настроен vim-speeddating для этого формата
# Пн. 28.12.15 03:19
# Установить xclip, xvkbd
# Чтобы Shift+insert вставлял из clipboard а не из primary можно просто настроить только в konsole

CURRENT=`xclip -o -selection c`
echo -n `date +'%a %d.%m.%y %H:%M'` | xclip -selection c
sleep 0.5 # иногда вперед xdotool срабатывает
xvkbd -xsendevent -text '\[Shift]\[Insert]'
sleep 0.5 # иногда вперед xdotool срабатывает
echo -n $CURRENT | xclip -selection c
