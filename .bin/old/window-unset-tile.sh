#!/usr/bin/env bash

# Если окно затайлено, то убрать его из этого тайла

W=$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2)
XWININFO=$(xwininfo -id ${W} -all)
BORDERS=$(echo "$XWININFO" | grep "Frame extents:" | tr -s ' ' | cut -c16-)
MAX_H=$(echo "$XWININFO" | grep "Maximized Horz")
MAX_V=$(echo "$XWININFO" | grep "Maximized Vert")

# у окна должно быть описание границ
if [[ $BORDERS ]]; then
  LEFT=$(echo "$BORDERS" | cut -d',' -f1 | cut -c2-)
  RIGHT=$(echo "$BORDERS" | cut -d',' -f2 | cut -c2-)
  TOP=$(echo "$BORDERS" | cut -d',' -f3 | cut -c2-)
  BOTTOM=$(echo "$BORDERS" | cut -d',' -f4 | cut -c2-)

  # maximized left top right bottom (при тайлинге по сторонам нужно назначать окну maximized_horz или maximized_vert)
  if [[ $MAX_H && $MAX_V ]] ; then
    qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Maximize'
  elif [[ $MAX_H ]] ; then
    qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Maximize Horizontal'
  elif [[ $MAX_V ]] ; then
    qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Maximize Vertical'
  # top left
  elif [[ ( $LEFT == 0 ) && ( $TOP != 0 ) && ( $RIGHT != 0 ) && ( $BOTTOM != 0 ) ]] ; then
    qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Quick Tile Top Left'
  # top right
  elif [[ ( $LEFT != 0 ) && ( $TOP != 0 ) && ( $RIGHT == 0 ) && ( $BOTTOM != 0 ) ]] ; then
    qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Quick Tile Top Right'
  # TODO right (мышкой окно тайлится без maximized), поэтому тайлинг мышкой отключаем, заменяем на перемещение окон на другой рабочий стол
  # elif [[ ( $LEFT != 0 ) && ( $TOP != 0 ) && ( $RIGHT == 0 ) && ( $BOTTOM == 0 ) ]] ; then
  #   notify-send "123"
  #   qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Quick Tile Right'
  # bottom right
  elif [[ ( $LEFT != 0 ) && ( $TOP != 0 ) && ( $RIGHT == 0 ) && ( $BOTTOM == 0 ) ]] ; then
    qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Quick Tile Bottom Right'
  # bottom left
  elif [[ ( $LEFT == 0 ) && ( $TOP != 0 ) && ( $RIGHT != 0 ) && ( $BOTTOM == 0 ) ]] ; then
    qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut 'Window Quick Tile Bottom Left'
  fi
  # window-move-center.sh
  # notify-send "$LEFT $TOP $RIGHT $BOTTOM"
fi
