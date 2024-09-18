#!/bin/sh

. dmenu_colors.sh
BROWSER=surf
URL=$(dmenu -fn "$dmenu_fn" -sb "$dmenu_sb" -sf "$dmenu_sf" -p "Go:")
if [ "$URL" ]; then
    $BROWSER $URL
else
    exit 0
fi
