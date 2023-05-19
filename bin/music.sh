#!/bin/sh

if [[ -d $HOME/Music ]] 
then
	
	if [[ -d $HOME/Music/$1 ]] 
	then
		mpv --shuffle $HOME/Music/$1
	else
		echo "Error: playlist $1 not found!"
	fi

else
	echo "Error: Music directory not found!"
fi
