#!/bin/sh
# This script will later be aliased to "vm" in my .bashrc
#
. dmenu_colors.sh

VMS_DIR=/mnt/hdd/vms
LISTNUM=$(ls $VMS_DIR | wc -l) # used by dmenu -l
CHOICE="$(ls $VMS_DIR | dmenu -fn "$dmenu_fn" -sb "$dmenu_sb" -sf "$dmenu_sf" -l $LISTNUM -p "vms:")"

if [ "$CHOICE" ]; then
	exec $VMS_DIR/$CHOICE/start.sh
else
	exit 0;
fi
