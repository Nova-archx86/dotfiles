#!/bin/bash

. dmenu_colors.sh

# Script idea courtousey of distro-tube
dir="/usr/share/doc/arch-wiki/html/en"
browser=surf # not using xdg-open due to having multiple browsers installed
docs=$(find ${dir} -iname "*.html")

choice=$(printf '%s\n' "${docs[@]}" | \
	cut -d '/' -f8- | \
	dmenu -fn "Mononoki Nerd font:size15" -sb "$dmenu_sb" -sf "$dmenu_sf" -i -l 20 -p "arch-wiki docs: ") 

if [ "$choice" ]; then
	$browser "$dir/$choice"
else
	exit 0
fi
