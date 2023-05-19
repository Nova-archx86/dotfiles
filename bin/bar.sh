#!/bin/sh

# Font awesome version 5 or later is required for the icons to work.
NIC="enp3s0f0"
DRIVE_PATH="/dev/sda3"

addr() {
    ADDR=" $(ip -br addr | grep $NIC | awk '{print $3}')"
    echo $ADDR
}

kernel() {
    KERNEL=" $(uname -sr)"
    echo $KERNEL
}

hdd() {
    HDD_USAGE=" $(df -H /home | grep $DRIVE_PATH | awk  '{print $4}')"
    echo $HDD_USAGE
}

cpu() {
    CPU_USAGE="  $(echo "CPU: "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]"%")"
    echo $CPU_USAGE
}

pack() {
    PACKAGES=" $(pacman -Q | wc -l)"
    echo $PACKAGES
}

ndate() {
	NDATE="  $(date +"%a %b %d %I:%M %Y")"
	echo $NDATE
}

status_bar() {
	echo "$(cpu) | $(hdd) | $(addr) | $(pack) | $(ndate) | $(kernel)"
}

while true; do
    xsetroot -name "$(status_bar)"
    sleep 1
done
