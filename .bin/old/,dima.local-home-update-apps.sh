#! /bin/sh

# Example:
# sudo -u dima-brave ,dima.local-home-update-apps.sh

echo 'Update apps home dir'

cp --verbose -r /etc/dima.local/etc/skel/Desktop ~/

cp --verbose -r /etc/dima.local/etc/skel/Downloads ~/

mkdir --verbose -p ~/.config
cp --verbose -r /etc/dima.local/etc/skel/.config/mimeapps.list ~/.config/

mkdir --verbose -p ~/.local/share/applications
cp --verbose -r /etc/dima.local/etc/skel/.local/share/applications/*.desktop ~/.local/share/applications/

cp --verbose -r /etc/dima.local/etc/skel/.local/share/applications/mimeapps.list ~/.local/share/applications/

cp --verbose -r /etc/dima.local/etc/skel/.bin ~/
