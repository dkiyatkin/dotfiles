#!/bin/bash
# Открыть yakuake и создать новую вкладку
# http://kde-files.org/content/show.php/Open+Yakuake+Here+%28KDE4%29?content=107654

aPath=$1

(qdbus org.kde.yakuake >/dev/null 2>&1 || yakuake) &&
qdbus org.kde.yakuake /yakuake/sessions addSession &&
qdbus org.kde.yakuake /yakuake/sessions runCommand "cd \"$(echo $aPath | sed -e s/\"/\\\\\"/g -e s/\'/\"\\\\\'\"/g)\"" &&
qdbus org.kde.yakuake /yakuake/tabs setTabTitle "`qdbus org.kde.yakuake /yakuake/sessions activeSessionId`" "$(echo $aPath | sed -e 's|.*/\([^/]*\)/$|\1|')" &&
(if [ "`qdbus org.kde.yakuake /yakuake/MainWindow_1 org.qtproject.Qt.QWidget.visible`" == "false" ]; then qdbus org.kde.yakuake /yakuake/window toggleWindowState; fi)
