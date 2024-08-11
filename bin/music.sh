#!/bin/sh
. dmenu_colors.sh

dir=/mnt/hdd
font="Mononoki Nerd Font:size=15"
opts="-sf $dmenu_sf -sb $dmenu_sb  -l 10"
choice="$(ls $dir/music | dmenu -fn "$font" $opts)"

if [ -z "$choice" ];
then
	exit 0
else
	mpv --shuffle $dir/music/$choice
fi

