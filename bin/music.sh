#!/bin/sh
dmenu_color="#6495ed"
dir=/mnt/hdd
font="Mononoki Nerd Font:size=15"
opts="-sf #444444 -sb $dmenu_color  -l 10"
choice="$(ls $dir/music | dmenu -fn "$font" $opts)"

if [ -z "$choice" ];
then
	exit 0
else
	mpv --shuffle $dir/music/$choice
fi

