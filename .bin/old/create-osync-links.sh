#!/usr/bin/env bash

rmdir ~/bin ~/Data ~/Desktop ~/Documents ~/Music ~/Pictures ~/Public ~/Templates ~/tmp
ln -sfiT ~/.osync-replica/bin ~/bin
ln -sfiT ~/.osync-replica/Data ~/Data
ln -sfiT ~/.osync-replica/Desktop ~/Desktop
ln -sfiT ~/.osync-replica/Documents ~/Documents
ln -sfiT ~/.osync-replica/Music ~/Music
ln -sfiT ~/.osync-replica/Pictures ~/Pictures
ln -sfiT ~/.osync-replica/Public ~/Public
ln -sfiT ~/.osync-replica/Templates ~/Templates
ln -sfiT ~/.osync-replica/tmp ~/tmp
