#!/bin/sh

# Font awesome version 5 or later is required for the icons to work.

OS_ICON=""

if [[ $(uname) == "Linux" ]]; then
		OS_ICON=" "
elif [[ $(uname) == "FreeBSD" ]]; then
		OS_ICON=" "
else
	OS_ICON=" "
fi

addr() {
    ADDR=" $(ip addr | grep -e "inet" | awk 'FNR == 3{print $4}')"
    echo $ADDR
}

kernel() {
    KERNEL="$OS_ICON $(uname -sr)"
    echo $KERNEL
}

hdd() {
    HDD_USAGE=" $(df -H /home/ | awk 'FNR == 2 {print $4}')"
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
