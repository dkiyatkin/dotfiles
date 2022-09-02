#! /bin/sh

echo 'Update user home dirs'

for userhome in /home/dima /home/dima-* ; do
  ln --verbose -sf /etc/zsh/important_commands "$userhome/.important_commands"
  ln --verbose -sf /etc/.editorconfig "$userhome/.editorconfig"
  ln --verbose -sf /etc/home.dima/.bin/ "$userhome/.bin"
done
