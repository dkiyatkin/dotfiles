#!/bin/bash
# для всех приложений xkb-switch -n, для vim <F2>
# если gvim отправлять через xvkbd, то в нем может появляться предупреждение о изменении файла
W=`xdotool getactivewindow`
S1=`xprop -id ${W} | awk '/WM_CLASS/{print $4}'`
# sleep 0.1 # TODO правильно ловить окно, у xvkbd нормально без этого
if [ $S1 = '"Gvim"' ]; then
  xkb-switch -n
  # sleep 0.1 ; xdotool key --window $W --clearmodifiers 0x5c F6
  xvkbd -xsendevent -text '\[F2]'
# TODO
# фильтровать другие терминалы с запущенным vim
# не определяется yakuake, konsole-tmux, konsole-ssh
# как вариант: попробовать менять title через tmux
elif [ $S1 = '"Konsole"' ]; then
  S2=`xprop -id ${W} | awk '/WM_NAME/{for (i = 3; i <= NF; i++) printf $i " "; print ""}' | sed -n "1p"`
  if [[ $S2 == *" : vim — Konsole"* ]]; then
    # sleep 0.1 ; xdotool key --window $W --clearmodifiers 0x5c F6
    xvkbd -xsendevent -text '\[F2]'
  else
    # xkb-switch -n
    :
  fi
else
  # xkb-switch -n
  :
fi

