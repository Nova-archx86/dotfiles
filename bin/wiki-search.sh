#!/bin/bash

# Script idea courtousey of distro-tube
dir="/usr/share/doc/arch-wiki/html/en"
browser=librewolf # not using xdg-open due to having multiple browsers installed
docs=$(find ${dir} -iname "*.html")

choice=$(printf '%s\n' "${docs[@]}" | \
	cut -d '/' -f8- | \
	dmenu -fn "Mononoki Nerd font:size15" -sb "#20B2AA" -i -l 20 -p "arch-wiki docs: ")

if [ "$choice" ]; then
	$browser "$dir/$choice"
else
	exit 0
fi
