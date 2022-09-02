#!/usr/bin/env bash

# Сделать бэкап системы

shopt -s expand_aliases
alias rsync-force-synchronize='rsync --verbose --archive --progress --human-readable --delete --hard-links'

DIRECTORY='/run/media/dima/BACKUP_SYSTEM/2/'
if [ ! -d "$DIRECTORY" ]; then
  echo "Directory $DIRECTORY does not exists."
  exit 1
fi

echo -e '\n/etc'
rsync-force-synchronize /etc $DIRECTORY

# echo -e '\n/home'
# rsync-force-synchronize --delete-excluded \
#   --exclude='/home/dima-xfce' \
#   --exclude='/home/dima/.cache' \
#   --exclude='/home/dima/.cargo' \
#   --exclude='/home/dima/.gradle' \
#   --exclude='/home/dima/.linuxbrew' \
#   --exclude='/home/dima/.node-gyp' \
#   --exclude='/home/dima/.npm' \
#   --exclude='/home/dima/.nvm' \
#   --exclude='/home/dima/.config/yarn/global/node_modules' \
#   --exclude='/home/dima/.local/share/dasht/docsets' \
#   --exclude='/home/dima/.local/share/Zeal/Zeal/docsets' \
#   /home $DIRECTORY

echo -e '\n/opt'
rsync-force-synchronize /opt $DIRECTORY

echo -e '\n/root'
rsync-force-synchronize /root $DIRECTORY

echo -e '\n/srv'
rsync-force-synchronize /srv $DIRECTORY

echo -e '\n/usr'
rsync-force-synchronize --delete-excluded \
  --exclude='/usr/lib*' \
  --exclude='/usr/share/doc' \
  --exclude='/usr/share/fonts' \
  --exclude='/usr/share/locale' \
  /usr $DIRECTORY

echo -e '\n/var'
rsync-force-synchronize --delete-excluded \
  --exclude='/var/cache' \
  --exclude='/var/lib' \
  --exclude='/var/tmp' \
  /var $DIRECTORY
