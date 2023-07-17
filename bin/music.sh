#!/bin/sh

if [[ -d $HOME/music ]] 
then
	
	if [[ -d $HOME/music/$1 ]] 
	then
		mpv --shuffle $HOME/music/$1
	else
		echo "Error: playlist $1 not found!"
	fi

else
	echo "Error: music directory not found!"
fi
