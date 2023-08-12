#!/bin/sh

# Font awesome version 5 or later is required for the icons to work.

OS_ICON=""
PKG_CMD=""

if [[ $(uname) == "Linux" ]]; then
		OS_ICON=" "
		PKG_CMD="pacman -Q" # "I use arch btw" -every archuser ever.
elif [[ $(uname) == "FreeBSD" ]]; then
		OS_ICON=" "
		PKG_CMD="pkg info"
else
	OS_ICON=" "
	PKG_CMD="pkg_info" # Probably open bsd if im not using FreeBSD or linux
fi
echo $PKG_CMD
addr() {
    ADDR=" $(ip addr | grep -e "inet" | awk 'FNR == 3{print $2}')"
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
    PACKAGES=" $($PKG_CMD | wc -l)"
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
