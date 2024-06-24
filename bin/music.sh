#!/bin/sh

dir=/mnt/hdd
font="Mononoki Nerd Font:size=15"
opts="-sb #00FF00 -l 10"
choice=$(ls $dir/music | dmenu -fn "$font" $opts)
mpv --shuffle $dir/music/$choice
